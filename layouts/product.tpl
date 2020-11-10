<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign productPageSettings = 'product_page_settings_' | append: page.id -%}
</head>

<body class="product-page js-bg-picker-area flex_box{% include 'semimodal-class-names' %}">
  {% include "template-svg-spritesheet" %}
  {% include "header" %}
  {% if editmode %}
    <div class="bg-picker-top">
      <button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
    </div>
  {% endif %}
  <div class="background-color js-background-color"></div>

  <div class="container js-bg-picker-area">
    {% include 'menu-level-2' %}

    <main class="content" role="main" data-search-indexing-allowed="true">
      {% if editmode %}
        <button disabled class="js-product-page-settings-btn">Product page settings</button>
      {% endif %}
      <div class="flex_row flex_row-2 mar_0-16-neg flex_a-center">
        <div class="flex_row-2--item">
          <div class="mar_0-16 p-rel">
            {%- if page.data[productPageSettings].product_label != blank -%}
              <div class="product_label">
                {{page.data[productPageSettings].product_label}}
              </div>
            {%- endif -%}
            {%- if page.data.item_image != blank or editmode -%}
              {% include 'content-item', _entityData: page, _itemType: 'page', _id: page.id, _staticItem: true %}
            {%- endif -%}
          </div>
        </div>

        <div class="flex_row-2--item">
          <div class="mar_0-16 flex_col flex_a-center flex_j-center">
            <div class="content-body content-formatted">
              {% contentblock name="page-title" publish_default_content="true" %}
                <h3>{{page.title}}</h3>
              {% endcontentblock %}
            </div>
            <section class="content-body content-formatted">{% content %}</section>
          </div>
        </div>
      </div>

      <section class="content-body content-formatted">{% content name="product-content-1" %}</section>

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
              <div class="mar_0-8 mar_b-32 content-formatted">
              <a class="product_item-link" href="{{ buy_button.content.parent.url }}">
                <div class="content-item-box">
                  <div class="item-top mar_b-32 p-rel">
                    {%- if page.data[productPageSettings].product_label != blank -%}
                      <div class="product_label">
                        {{page.data[productPageSettings].product_label}}
                      </div>
                    {%- endif -%}
                    <div class="top-inner of-hidden js-zoom">
                      {% include "lazy-image", _data: buy_button.content.parent.data.item_image, _targetWidth: '300', _className: "item-image is-cropped" %}
                    </div>
                    <div class="custom-btn p-abs">Look closer</div>
                  </div>
                </div>

                <div class="p14 mar_t-16">
                  <p class="bold">
                    {{ buy_button.content.parent.title }}
                  </p>
                  <p>{{ product.price_with_tax | money_with_currency: "EUR" }}</p>
                </div>
              </a>
              </div>
            </div>
          {%- endfor -%}
        </div>
      </div>

    </main>
    {% include "footer" %}
  </div>
  {% include 'site-components' %}
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "template-tools" %}
  {% include 'product-page-scripts' %}
</body>
</html>
