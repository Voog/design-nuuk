<div class="js-prevent-sideclick content_settings-btn layout_settings-btn">
  <button disabled class="js-product-page-settings-btn js-settings-editor-btn">
    <div class="bold">{{ "product_page" | lce }}</div>
    <div class="grey">{{ "edit_product_page" | lce }}</div>
  </button>
</div>

{%- assign productNoteInputCount = 1 -%}
{%- assign productPageSettings = page.data[productLayoutSettingsKey] -%}
{%- if productPageSettings != blank -%}
  {%- assign productNoteInputCount = productPageSettings.product_note_input_count | to_num -%}
{%- endif -%}

<script>
  {% if editmode %}
    window.addEventListener('DOMContentLoaded', function(event) {
      {% if productPageSettings %}
        var valuesObj = {{ productPageSettings | json }};
      {% else %}
        var valuesObj = {product_note_input_count: "1"};
      {% endif %}

      if (!('is_related_product_1' in valuesObj)) {
        valuesObj.is_related_product_1 = 0;
      }

      if (!('is_related_product_2' in valuesObj)) {
        valuesObj.is_related_product_2 = 0;
      }

      if (!('is_related_product_3' in valuesObj)) {
        valuesObj.is_related_product_3 = 0;
      }

      var productsPageList = [{"title": '---',"value": 0}];

      $.ajax({
        type: 'GET',
        contentType: 'application/json',
        url: '/admin/api/buy_buttons?q.content.parent_type=page&q.content.language_id={{page.language_id}}&per_page=100',
        dataType: 'json',
        success: function(data) {
          for (var i = 0; i < data.length; i++) {
            if (data[i].product) {
              var productExists = productsPageList.some(function(product) {
                return product.id === data[i].product.id;
              });

              if (!productExists) {
                productsPageList.push(
                  {
                    "title": data[i].product.name,
                    "value": data[i].parent.id,
                    "id": data[i].product.id
                  }
                );
              }
            }
          };
        }
      }).then(function() {
        initSettingsEditor(
          {
            settingsBtn: document.querySelector('.js-product-page-settings-btn'),
            menuItems: [
              {
                "title": {{ "select_related_product" | lce | json }},
                "type": "select",
                "key": "is_related_product_1",
                "list": productsPageList,
              },
              {
                "title": {{ "select_related_product" | lce | json }},
                "type": "select",
                "key": "is_related_product_2",
                "list": productsPageList,
              },
              {
                "title": {{ "select_related_product" | lce | json }},
                "type": "select",
                "key": "is_related_product_3",
                "list": productsPageList,
              },
              {
                "title": {{ "add_product_label" | lce | json }},
                "type": "text",
                "key": "product_label",
                "placeholder": {{ "add_product_label" | lce | json }}
              },
              {
                "title": {{ "cross_out_label" | lce | json }},
                "type": "checkbox",
                "key": "is_product_label_line_through",
                "states": {
                  "on": true,
                  "off": false
                }
              },
              {
                "title": {{ "border_around_label" | lce | json }},
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
