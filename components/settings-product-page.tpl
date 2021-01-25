<div class="js-prevent-sideclick content_settings-btn layout_settings-btn">
  <button disabled class="js-product-page-settings-btn js-settings-editor-btn">
    <div class="bold">Product page</div><div class="grey">Edit product page</div>
  </button>
</div>

{%- assign productNoteInputCount = 1 -%}
{%- assign productPageSettings = page.data[productLayoutSettingsKey] -%}
{%- if productPageSettings != blank -%}
  {%- assign productNoteInputCount = productPageSettings.product_note_input_count | to_num -%}
{%- endif -%}

<script>
  {% if editmode %}
    window.addEventListener('DOMContentLoaded', (event) => {
      {% if productPageSettings %}
        var valuesObj = {{ productPageSettings | json }};
      {% else %}
        var valuesObj = {product_note_input_count: "1"};
      {% endif %}

      var productsPageList = [];

      $.ajax({
        type: 'GET',
        contentType: 'application/json',
        url: '/admin/api/buy_buttons?q.content.parent_type=page&q.content.language_id={{page.language_id}}&per_page=100',
        dataType: 'json',
        success: function(data) {
          for (var i = 0; i < data.length; i++) {
            productsPageList.push(
              {
                "title": data[i].product.name,
                "value": data[i].parent.id
              }
            );
          };
        }
      }).then(() =>
        initSettingsEditor(
          {
            settingsBtn: document.querySelector('.js-product-page-settings-btn'),
            menuItems: [
              {
                "title": "Select related product",
                "type": "select",
                "key": "is_related_product_1",
                "list": productsPageList,
              },
              {
                "title": "Select related product",
                "type": "select",
                "key": "is_related_product_2",
                "list": productsPageList,
              },
              {
                "title": "Select related product",
                "type": "select",
                "key": "is_related_product_3",
                "list": productsPageList,
              },
              {
                "title": "Add product label",
                "type": "text",
                "key": "product_label",
                "placeholder": "Add product label"
              },
              {
                "title": "Line through label text",
                "type": "checkbox",
                "key": "is_product_label_line_through",
                "states": {
                  "on": true,
                  "off": false
                }
              },
              {
                "title": "Bordered box around label",
                "type": "checkbox",
                "key": "is_product_label_box",
                "states": {
                  "on": true,
                  "off": false
                }
              }/*,
              {
                "title": "Select note input area count",
                "type": "select",
                "key": "product_note_input_count",
                "list": [
                  {"title": "1", "value": "1"},
                  {"title": "2", "value": "2"},
                  {"title": "3", "value": "3"}
                ]
              },
              {%- for i in (1..productNoteInputCount) -%}
                {
                  "title": "Publish {{i}} product note input",
                  "type": "checkbox",
                  "key": "is_product_note_input_{{i}}",
                  "states": {
                    "on": true,
                    "off": false
                  }
                },
                {
                  "title": "Add {{i}} product note input label",
                  "type": "text",
                  "key": "product_note_input_label_{{i}}",
                  "placeholder": "Add product note input label"
                },
              {%- endfor -%}*/
            ],
            dataKey: '{{productLayoutSettingsKey}}',
            containerClass: ['bottom-settings-popover', 'first', 'editor_default'],
            values: valuesObj
          }
        )
      );
    });
  {% endif %}
</script>

{%- comment -%}
<script>
  // Append polyfill for IE. Source: https://github.com/jserz/js_piece/blob/master/DOM/ParentNode/append()/append().md
  (function (arr) {
    arr.forEach(function (item) {
      if (item.hasOwnProperty('append')) {
        return;
      }
      Object.defineProperty(item, 'append', {
        configurable: true,
        enumerable: true,
        writable: true,
        value: function append() {
          var argArr = Array.prototype.slice.call(arguments),
            docFrag = document.createDocumentFragment();

          argArr.forEach(function (argItem) {
            var isNode = argItem instanceof Node;
            docFrag.appendChild(isNode ? argItem : document.createTextNode(String(argItem)));
          });

          this.appendChild(docFrag);
        }
      });
    });
  })([Element.prototype, Document.prototype, DocumentFragment.prototype]);
</script>

<script>
  {%- for i in (1..productNoteInputCount) -%}
    var inputElement = '.product_note-input-{{i}}';
    var inputElements = inputElement.concat(inputElement);

    {%- assign isProductNoteKey = 'is_product_note_input_' | append: i -%}
    {% if editmode or productPageSettings[isProductNoteKey] == true %}
      var $productTypeSelect = $('.edy-buy-button-container').find('.edy-buy-button'),
        productTypeTextContainer,
        productTypeTextInput,
        productTypeTextLabel

      // Builds input note field
      productTypeTextContainer = document.createElement('div');
      productTypeTextContainer.className = 'form_field js-product-note-text-container';

      productTypeTextLabel = document.createElement('label');
      productTypeTextLabel.setAttribute('for', 'product-note-{{i}}');
      productTypeTextLabel.className = 'form_field_label product_note-label-{{i}}';
      {%- assign productNoteLabel = '' -%}
      {%- assign productNoteLabelKey = 'product_note_input_label_' | append: i -%}
      {%- if productPageSettings[productNoteLabelKey] != blank -%}
        {%- assign productNoteLabel = productPageSettings[productNoteLabelKey] -%}
        productTypeTextLabel.innerHTML = "{{productNoteLabel}}";
      {%- endif -%}

      productTypeTextInput = document.createElement('input');
      productTypeTextInput.setAttribute('id', 'product-note-{{i}}');
      productTypeTextInput.className = 'form_field_textfield product_note-input-{{i}} product_note';

      productTypeTextContainer.append(productTypeTextLabel);
      productTypeTextContainer.append(productTypeTextInput);

      $productTypeSelect.parent().before(productTypeTextContainer);
    {% endif %}
  {%- endfor -%}

  $('.edy-buy-button').on('click', function() {
    var noteString = '';
    {%- for i in (1..productNoteInputCount) -%}
      var noteLabel = $('.product_note-label-{{i}}').text()
      var noteValue = $('.js-product-note-text-container').find('.product_note-input-{{i}}').val();
      if (noteValue.length >= 1) {
        noteString = noteString.concat(noteLabel + ': ' + noteValue{% if forloop.last != true %} + ', '{% endif %});
      }
    {%- endfor -%}
    $('.edy-buy-button').attr('data-note', noteString);
    $(".product_note").each(function() {
      $(this).val("");
    });
  });
</script>
{%- endcomment -%}
