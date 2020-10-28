<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign productPageSettings = 'product_page_settings_' | append: page.id -%}
  {%-  assign productPageFeaturedKey = 'product_page_featured' -%}
</head>

<body class="product-page js-bg-picker-area">
  {% include "header" %}
  {% if editmode %}
    <button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg" data-bg-picture-boolean="true" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
  {% endif %}

  <div class="background-image js-background-image"></div>
  <div class="background-color js-background-color"></div>

  <div class="container js-bg-picker-area">
    <div class="js-background-type {{ container_bg_type }}">
      <div class="background-color js-background-color">
        {% if editmode %}
          <button class="voog-bg-picker-btn js-background-settings" data-bg-key="container_bg" data-bg-picture-boolean="false" data-bg-color="{{ container_bg_color }}" data-bg-color-data="{{ container_bg_color_data_str | escape }}"></button>
        {% endif %}


        <div class="flex_box">{% include 'menu-level-2' %}</div>

        <main class="content" role="main" data-search-indexing-allowed="true">
          {% if editmode %}
            <button disabled class="js-product-page-settings-btn">Product page settings</button>
          {% endif %}
          <div class="flex_row flex_row-2 mar_0-16-neg flex_a-center">
            {% include 'image_src_variable', _data: page.data.product_image, _targetWidth: "1200" %}
            <div class="flex_row-2--item">
              <div class="mar_0-16">
                <div
                  class="product_image bg_img-cover{%- if _src != blank %} image_portrait{%- endif -%}"
                  {% if _src != blank -%}
                    style="background-image: url({{_src}});"
                  {%- endif -%}
                >
                  {% if editmode %}
                    <button class="bg-picker" data-picture="true" data-color="false" data-image_elem=".product_image" data-name="product_image" data-bg="{{ page.data.product_image | json | escape }}"></button>
                  {% endif %}
                </div>
              </div>
            </div>

            <div class="flex_row-2--item">
              <div class="mar_0-16 flex_col flex_a-center flex_j-center">
                <h3>{{page.title}}</h3>
                <section class="content-body content-formatted">{% content %}</section>
                <section class="content-body content-formatted">{% content name="product-content-1" %}</section>
              </div>
            </div>
          </div>

          <div>
            {%- assign pageIdsArr = "" | split: ',' -%}
            {%- for i in (1..3) -%}
              {%- assign relatedProductKey = 'related_product_' | append: i -%}
              {%- assign relatedProductPageId = page.data[productPageSettings][relatedProductKey] -%}
              {%- assign pageIdsArr = pageIdsArr | push: relatedProductPageId -%}
              {%- assign pageIdCompactArr = pageIdsArr | compact -%}
            {%- endfor -%}

            <h3 class="visits-title"{% if pageIdCompactArr.size <= 0 %} style="display: none;"{% endif %}>Related products</h3>

            <div class="product_list flex_row flex_row-3 mar_0-8-neg pad_40-0">
              {%- for id in pageIdCompactArr -%}
                {%- load buy_button to "buy_button" q.content.parent_id=id q.content.parent_type="page" -%}
                {%- assign product = buy_button.product -%}

                <div class="product_item js-product-item flex_row-3--item scale-up" data-path="{{item_child.path}}">
                  {% include 'image_src_variable', _data: buy_button.content.parent.data.product_image, _targetWidth: "500" %}
                  <div class="mar_0-8 mar_b-32 content-formatted">
                    <div
                      class="product_image bg_img-cover{%- if _src != blank %} image_square{%- endif -%}"
                      {% if _src != blank -%}
                        style="background-image: url({{_src}});"
                      {%- endif -%}
                    >
                      {%- if buy_button.content -%}
                        {%- content content=buy_button.content -%}
                      {%- endif -%}
                    </div>
                    <div class="p14 mar_t-16">
                      <a class="bold" href="{{ buy_button.content.parent.url }}">
                        {{ product.title }}
                      </a>
                      <div>{{ product.price }}</div>
                    </div>
                  </div>
                </div>
              {%- endfor -%}
            </div>
          </div>

        </main>
        {% include "footer" %}
      </div>
    </div>
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "template-tools" %}


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
                  "title": "Featured product",
                  "tooltip": "This product is rendered in featured products lists",
                  "type": "checkbox",
                  "key": "{{productPageFeaturedKey}}",
                  "states": {
                    "on": true,
                    "off": false
                  }
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
</body>
</html>
