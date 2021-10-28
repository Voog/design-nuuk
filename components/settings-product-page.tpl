{% include 'settings-editor-button',
  _titleKey: "product_page",
  _descriptionKey: "edit_product_page",
  _className: "js-product-page-settings-btn",
  _wrapClassName: "content_settings-btn"
%}

{%- assign productNoteInputCount = 1 -%}
{%- assign productPageSettings = page.data[productLayoutSettingsKey] -%}
{%- if productPageSettings != blank -%}
  {%- assign productNoteInputCount = productPageSettings.product_note_input_count | to_num -%}
{%- endif -%}

<script>
  {% if editmode %}
    window.addEventListener('DOMContentLoaded', function(event) {
      var productsPageList = [{"title": '---',"value": 0}];

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

      $('.js-layout_settings-btn').one( "click", function(e) {
        getAllProducts().then(function() {
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
    });
  {% endif %}
</script>
