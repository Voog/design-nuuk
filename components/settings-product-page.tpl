<div class="js-prevent-sideclick content_settings-btn layout_settings-btn">
  <button class="js-product-page-settings-btn js-settings-editor-btn edy-cbtn">
    <span>
      <span class="edy-cbtn-content">
        <span class="edy-cbtn-ico"></span>
        <span>
          <div class="bold">{{ "product_page" | lce }}</div>
          <div class="grey">{{ "edit_product_page" | lce }}</div>
        </span>
      </span>
    </span>
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

      $('.js-layout_settings-btn').one( "click", function(e) {
        $.ajax({
          type: 'GET',
          contentType: 'application/json',
          url: '/admin/api/buy_buttons?q.content.parent_type=page&q.content.language_id={{page.language_id}}&per_page=250',
          dataType: 'json',
          success: function(data) {
            for (var i = 0; i < data.length; i++) {
              if (data[i].product) {
                productsPageList.push(
                  {
                    "title": data[i].product.name + " (" + data[i].parent.title + ")",
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
