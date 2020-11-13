<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign product_page = true -%}
  {%- assign productPageSettingsKey = 'product_page_settings_' | append: page.id -%}
</head>

<body class="product-page js-bg-picker-area{% include 'semimodal-class-names' %}">
  {% include "template-svg-spritesheet" %}
  {% if editmode %}
    <div class="bg-picker-top">
      <button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
    </div>
  {% endif %}
  <div class="background-color js-background-color"></div>

  <div class="flex_box">
    {% include "header" %}
    <div class="container js-bg-picker-area">
      <div class="mar_t-32">
        {% include 'menu-breadcrumbs' %}
      </div>

      <main class="content" role="main" data-search-indexing-allowed="true">
        {% if editmode %}
          <div class="mar_b-32">
            <button disabled class="js-product-page-settings-btn js-settings-editor-btn">Product page settings</button>
          </div>
        {% endif %}
        <div class="flex_row flex_row-2 mar_0-24-neg mar_b-32">
          <div class="flex_row-2--item">
            <div class="mar_0-24 p-rel">
              {%- if page.data[productPageSettingsKey].product_label != blank -%}
                <div class="product_label">
                  {{page.data[productPageSettingsKey].product_label}}
                </div>
              {%- endif -%}
              {%- if page.data.item_image != blank or editmode -%}
                {% include 'content-item', _entityData: page, _itemType: 'page', _id: page.id, _staticItem: true %}
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
                  <div class="product_item-wrap" href="{{ buy_button.content.parent.url }}">
                    {% include 'product-item', _parentId: id, _parentType: "page", _entityData: page %}
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
  {% include "javascripts" %}
  {% include "template-tools" %}
  {% include 'product-page-scripts' %}
</body>
</html>
