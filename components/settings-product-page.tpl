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
            if (data[i].product) {
              productsPageList.push(
                {
                  "title": data[i].product.name,
                  "value": data[i].parent.id
                }
              );
            }
          };
        }
      }).then(function() {
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
              }
            ],
            dataKey: '{{productLayoutSettingsKey}}',
            containerClass: ['bottom-settings-popover', 'first', 'editor_default'],
            values: valuesObj
          }
        )
      });
    });
  {% endif %}
</script>
