<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign product_page = true -%}
  {%- assign productPageSettingsKey = 'product_layout_settings' -%}
</head>

<body class="product-page js-bg-picker-area{% include 'semimodal-class-names' %}">
  {% include "template-svg-spritesheet" %}
  {% if editmode %}
    <div class="bg-picker-top">
      <button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
    </div>
  {% endif %}
  <div class="background-color js-background-color"></div>

  <div class="flex_box js-background-type {{ body_bg_type }}">
    {% include "header" %}
    <div class="container">
      <div class="mar_t-32">
        {% include 'menu-breadcrumbs' %}
      </div>

      <main class="content" role="main" data-search-indexing-allowed="true">
        {% if editmode %}
        {% endif %}
        <div class="flex_row flex_row-2 mar_0-24-neg mar_b-32">
          <div class="flex_row-2--item">
            <div class="mar_0-24 p-rel">
              {%- if page.data.item_image != blank or editmode -%}
                {% include 'content-item', _entityData: page, _itemType: 'page', _id: page.id %}
              {%- endif -%}
            </div>
          </div>

          <div class="flex_row-2--item">
            <div class="mar_0-24 flex_col">
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
            {%- assign relatedProductPageId = page.data[productPageSettingsKey][relatedProductKey] -%}
            {%- assign pageIdsArr = pageIdsArr | push: relatedProductPageId -%}
            {%- assign pageIdCompactArr = pageIdsArr | compact -%}
          {%- endfor -%}

          <h3 class="visits-title"{% if pageIdCompactArr.size <= 0 %} style="display: none;"{% endif %}>Related products</h3>

          <div class="product_list flex_row flex_row-3 mar_0-8-neg pad_40-0">
            {%- for id in pageIdCompactArr -%}
              <div class="product_item js-product-item flex_row-3--item scale-up" data-path="{{page.path}}">
                <div class="mar_0-8 mar_b-32">
                  <div class="product_item-wrap">
                    {%- load buy_button to "buy_button" q.content.parent_id=id q.content.parent_type="page" -%}
                    {%- assign product = buy_button.product -%}
                    {% include 'product-item', _buyButton: buy_button, _entityData: _buyButton.content.parent %}
                    {%- assign product = null -%}
                  </div>
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
  {% include 'settings-popover', _productPage: true %}
  {% include "javascripts" %}
  {% include "template-tools" %}
  {% include 'product-page-scripts' %}
</body>
</html>
