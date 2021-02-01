<!DOCTYPE html>
{% include "template-settings" %}
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %} {% include 'semimodal-class-names' %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign product_page = true -%}
</head>

<body class="product-page body-bg_picker--area {{ body_bg_type }}">
  {% include "template-svg-spritesheet" %}
  <div class="body-bg_color"></div>

  <div class="container_wrap">
    {% include "header" %}
    <div class="container">
      {% if editmode %}
        <div class="bg-picker-top">
          <button
            class="voog-bg-picker-btn body_bg-picker--btn bg-picker {{bodyBgKey}}-picker"
            data-bg_key="{{bodyBgKey}}"
            data-type_picture="false"
            data-type_color="true"
            data-color_elem=".body-bg_color"
            data-picker_area_elem=".body-bg_picker--area"
            data-picker_elem =".{{bodyBgKey}}-picker"
            data-bg-color="{{ body_bg_color }}"
          ></button>
        </div>
      {% endif %}

      <div class="mar_t-32 mar_b-32">
        {% include 'menu-breadcrumbs' %}
      </div>

      <main class="content" role="main" data-search-indexing-allowed="true">
        {% if editmode %}
          {%- assign isPostImageStatic = false -%}
        {% else %}
          {%- assign isPostImageStatic = true -%}
        {% endif %}
        <div class="flex_row flex_row-2 mar_0-24-neg mar_b-32">
          <div class="flex_row-2--item">
            <div class="mar_0-24 p-rel">
              {%- load buy_button to "buy_button" q.content.parent_id=page.id q.content.parent_type="page" -%}
              {% if buy_button.product != blank %}
                {%- assign buyButtonImage = buy_button.product.image -%}
              {% endif %}

              {%- if buyButtonImage != blank -%}
                {%- assign productImage = buyButtonImage -%}
                {%- assign isProductImage = true -%}
              {%- else -%}
                {%- assign productImage = page.data[itemImageKey] -%}
                {%- assign isProductImage = false -%}
              {%- endif -%}

              {%- if page.data.item_image != blank or editmode -%}
                <div class="js-product-page-image">
                  {% include 'content-item', _isProductImage: isProductImage, _imageData: productImage, _entityData: page, _itemType: 'page', _id: page.id, _staticItem: isPostImageStatic, _targetWidth: '1280' %}
                </div>
              {%- endif -%}
            </div>
          </div>

          <div class="flex_row-2--item">
            <div class="mar_0-24 flex_col">
              <div class="content-body content-formatted" data-search-indexing-allowed="true">
                {% contentblock name="page-title" publish_default_content="true" %}
                  <h3>{{page.title}}</h3>
                {% endcontentblock %}
                {%- assign productSettingsData = page.data[productLayoutSettingsKey] -%}
                {%- assign isBoxLabel = productSettingsData.is_product_label_box -%}


                {%- if buy_button.product.out_of_stock? -%}
                  <div class="product_item-box--label mar_32-0">OUT OF STOCK</div>
                {%- elsif productSettingsData.product_label != blank and isBoxLabel != true -%}
                  <div class="mar_32-0{% if productSettingsData.is_product_label_line_through == true %} td-lt{% endif %}">
                    {{productSettingsData.product_label}}
                  </div>
                {%- elsif productSettingsData.product_label != blank and isBoxLabel == true -%}
                  <div class="product_item-box--label mar_32-0">
                    {{productSettingsData.product_label}}
                  </div>
                {%- endif -%}
              </div>
              <section class="content-body content-formatted js-buy-btn-content" data-search-indexing-allowed="true">{% content %}</section>
            </div>
          </div>
        </div>

        <section class="content-body content-formatted" data-search-indexing-allowed="true">{% content name="product-content-1" %}</section>

        <div>
          {%- assign pageIdsArr = "" | split: ',' -%}
          {%- for i in (1..3) -%}
            {%- assign relatedProductKey = 'is_related_product_' | append: i -%}
            {%- assign relatedProductPageId = page.data[productLayoutSettingsKey][relatedProductKey] -%}
            {%- assign pageIdsArr = pageIdsArr | push: relatedProductPageId -%}
            {%- assign pageIdCompactArr = pageIdsArr | compact -%}
          {%- endfor -%}

          <h3 class="visits-title"{% if pageIdCompactArr.size <= 0 %} style="display: none;"{% endif %}>Related products</h3>

          <div class="product_list content-formatted flex_row flex_row-3 mar_0-8-neg pad_40-0">
            {%- for id in pageIdCompactArr -%}
              <div class="product_item js-product-item flex_row-3--item" data-path="{{page.path}}">
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
  </div>

  {% include "site-signout" %}
  {% include "javascripts", _productPage: true %}
  {% include 'settings-popover', _productPage: true %}
</body>
</html>
