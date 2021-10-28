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

      function getAllProducts(pageNumber) {
        var promises = [];

        return getProductsPage(1).then(function (productsPage) {
          var numberOfPages = productsPage.numberOfPages;

          for (var i = 2; i <= numberOfPages; i++) {
            promises.push(getProductsPage(i));
          }

          parseResults(productsPage.products);

          Promise.all(promises).then(function (results) {
            results.forEach(function (result) {
              parseResults(result.products);
            });
          });
        });
      }

      function getProductsPage(pageNumber) {
        var numberOfPages;

        return new Promise(function (resolve, reject) {
          $.ajax({
            type: 'GET',
            contentType: 'application/json',
            url: "/admin/api/buy_buttons" +
                  "?q.content.parent_type=page" +
                  "&q.content.language_id={{page.language_id}}" +
                  "&per_page=250" +
                  "&page=" + pageNumber,
            dataType: 'json',
          })
          .then(function (products, status, xhr) {
            numberOfPages = parseInt(xhr.getResponseHeader('X-Total-Pages'));

            resolve({
              products: products,
              numberOfPages: numberOfPages
            });
          })
          .catch(function (xhr) {
            alert('Something went wrong.');
            reject();
          });
        });
      }

      function parseResults(results) {
        results.forEach(function (result) {
          if (result.product) {
            productsPageList.push({
              "title": result.product.name + " (" + result.parent.title + ") ",
              "value": result.parent.id
            });
          }
        });
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
