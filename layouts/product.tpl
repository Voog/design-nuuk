<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign productPageSettings = 'product_page_settings_' | append: page.id -%}
  {%-  assign productPageCategoryKey = 'product_page_category' -%}
  {%-  assign productPageFeaturedKey = 'product_page_featured' -%}
</head>

<body class="product-page js-bg-picker-area">
  {% if editmode %}
    <button class="voog-bg-picker-btn js-background-settings" data-bg-key="body_bg" data-bg-picture-boolean="true" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
  {% endif %}

  <div class="background-image js-background-image"></div>
  <div class="background-color js-background-color"></div>

  <div class="container js-bg-picker-area">
    <div class="js-background-type {{ container_bg_type }}">
      <div class="background-color js-background-color">
        {% if editmode %}
          <button class="voog-bg-picker-btn js-background-settings" data-bg-key="container_bg" data-bg-picture-boolean="false" data-bg-color="{{ container_bg_color }}" data-bg-color-data="{{ container_bg_color_data_str | escape }}"></button>
        {% endif %}

        {% include "header" %}

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
                    <button class="bg-picker" data-picture="true" data-color="false" data-elem=".product_image" data-name="product_image" data-bg="{{ page.data.product_image | json | escape }}"></button>
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

          <h3 class="visits-title" style="display: none;">Related products</h3>
          <div class="product_list flex_row flex_row-3 mar_0-8-neg pad_40-0">
            {%- for i in (1..4) -%}
              {%- assign level_str = 'menuitems_on_level_' | append: i -%}
              {%- for item in site[level_str] -%}
                {%- for item_child in item.visible_children_with_data -%}
                  {%- if item_child.layout_title == product_layout and page.id != item_child.page_id -%}

                    {%- assign childProductPageSettingsKey = 'product_page_settings_' | append: item_child.page_id -%}
                    {% assign childProductPageCategoryArray = item_child.data[childProductPageSettingsKey][productPageCategoryKey] | split: "," %}
                    {% assign productPageCategoryArray = page.data[productPageSettings][productPageCategoryKey] | split: "," %}
                    {%- assign relatedProduct = false -%}

                    {% for category in productPageCategoryArray %}
                      {%- if childProductPageCategoryArray contains category -%}
                        {%- assign relatedProduct = true -%}
                        {% break %}
                      {%- endif -%}
                    {% endfor %}

                    {%- if relatedProduct == true -%}
                      {%- load buy_button to "buy_button" q.content.parent_id=item_child.page_id q.content.parent_type="page" -%}
                      {%- assign product = buy_button.product -%}
                      <div class="product_item js-product-item flex_row-3--item scale-up" data-path="{{item_child.path}}">
                        {% include 'image_src_variable', _data: item_child.data.product_image, _targetWidth: "500" %}
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
                            <a class="bold" href="{{ item.url }}">
                              {{ item.title }}
                            </a>
                            <div>{{ product.price }}</div>
                          </div>
                        </div>
                      </div>
                    {%- endif -%}
                  {%- endif -%}
                {%- endfor -%}
              {%- endfor -%}
            {%- endfor -%}
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

    if ($('.product_list .product_item').length >= 1) {
      $('.visits-title').show();
    }
    {% if editmode %}
      window.addEventListener('DOMContentLoaded', (event) => {
        {% if page.data[productPageSettings] %}
          var valuesObj = {{ page.data[productPageSettings] | json }};
        {% else %}
          var valuesObj = {};
        {% endif %}

        initSettingsEditor(
          {
            settingsBtn: document.querySelector('.js-product-page-settings-btn'),
            menuItems: [
              {
                "title": "Add category",
                "tooltip": "Multiple categories must me separated with comma for example chairs,lamps,tables",
                "type": "text",
                "key": "{{productPageCategoryKey}}",
                "placeholder": "Featured product (are rendered in featured products lists)"
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
        );
      });
    {% endif %}
  </script>
</body>
</html>
