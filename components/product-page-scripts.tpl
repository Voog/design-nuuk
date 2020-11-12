<script>
  site.initCommonPage();
  {% if editmode %}
    window.addEventListener('DOMContentLoaded', (event) => {
      {% if page.data[productPageSettings] %}
        var valuesObj = {{ page.data[productPageSettings] | json }};
      {% else %}
        var valuesObj = {};
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
                "key": "related_product_1",
                "list": productsPageList,
              },
              {
                "title": "Select related product",
                "type": "select",
                "key": "related_product_2",
                "list": productsPageList,
              },
              {
                "title": "Select related product",
                "type": "select",
                "key": "related_product_3",
                "list": productsPageList,
              },
              {
                "title": "Add product label",
                "type": "text",
                "key": "product_label",
                "placeholder": "Add product label"
              },
              {
                "title": "Add product note input",
                "type": "checkbox",
                "key": "is_product_note_input",
                "states": {
                  "on": true,
                  "off": false
                }
              },
              {
                "title": "Add product note input label",
                "type": "text",
                "key": "product_note_input_label",
                "placeholder": "Add product note input label"
              }
            ],
            dataKey: '{{productPageSettings}}',
            values: valuesObj
          }
        )
      );
    });
  {% endif %}
</script>

{% if page.data[productPageSettings].is_product_note_input == true %}
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

    var $productTypeSelect = $('.edy-buy-button-container').find('.edy-buy-button'),
      productTypeTextContainer,
      productTypeTextInput,
      productTypeTextLabel

    // Builds input note field
    productTypeTextContainer = document.createElement('div');
    productTypeTextContainer.className = 'form_field js-product-note-text-container';

    productTypeTextLabel = document.createElement('label');
    productTypeTextLabel.setAttribute('for', 'product-note');
    productTypeTextLabel.className = 'form_field_label';
    {%- assign productNoteLabel = '' -%}
    {%- if page.data[productPageSettings].product_note_input_label != blank -%}
      {%- assign productNoteLabel = page.data[productPageSettings].product_note_input_label -%}
      productTypeTextLabel.innerHTML = "{{productNoteLabel}}";
    {%- endif -%}

    productTypeTextInput = document.createElement('input');
    productTypeTextInput.setAttribute('id', 'product-note');
    productTypeTextInput.className = 'form_field_textfield input_option';

    productTypeTextContainer.append(productTypeTextLabel);
    productTypeTextContainer.append(productTypeTextInput);

    $productTypeSelect.parent().before(productTypeTextContainer);

    // Updates product note on changing the note input.
    var setTextNote = function(labelTitle) {
      var textValue = $('.js-product-note-text-container').find('.form_field_textfield').val();
      $('.edy-buy-button').attr('data-note', labelTitle + ': "' + textValue + '"');
    };

    $('.js-product-note-text-container').find('.form_field_textfield').on('input', function() {
    setTextNote("{{productNoteLabel}}");

    });
  </script>
{% endif %}

<script>
  $('.top-inner.js-zoom').click(function() {
    $(this).toggleClass('zoom');
  });
</script>
