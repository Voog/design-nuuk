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
    <div class="pad_container p-rel">
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
      <div class="container">
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

                {%- if productImage != blank or editmode -%}
                  <div class="js-product-page-image">
                    {% include 'content-item', _isProductImage: isProductImage, _imageData: productImage, _entityData: page, _itemType: 'page', _id: page.id, _staticItem: isPostImageStatic, _targetWidth: '1280' %}
                  </div>
                {%- endif -%}
              </div>
              <section class="content-body content-formatted mar_0-24 mar_t-32" data-search-indexing-allowed="true">
                {% content name="gallery" %}
              </section>
            </div>

            <div class="flex_row-2--item">
              <div class="mar_0-24 flex_col">
                <div class="content-body content-formatted" data-search-indexing-allowed="true">
                  {% contentblock name="page_title" publish_default_content="true" %}
                    <h3>{{page.title}}</h3>
                  {% endcontentblock %}
                  {%- assign productSettingsData = page.data[productLayoutSettingsKey] -%}
                  {%- assign isBoxLabel = productSettingsData.is_product_label_box -%}


                  {%- if buy_button.product.out_of_stock? -%}
                    <div class="product_item-box--label mar_t-32">OUT OF STOCK</div>
                  {%- elsif productSettingsData.product_label != blank and isBoxLabel != true -%}
                    <div class="mar_t-32{% if productSettingsData.is_product_label_line_through == true %} td-lt{% endif %}">
                      {{productSettingsData.product_label}}
                    </div>
                  {%- elsif productSettingsData.product_label != blank and isBoxLabel == true -%}
                    <div class="product_item-box--label mar_t-32">
                      {{productSettingsData.product_label}}
                    </div>
                  {%- endif -%}
                </div>
                <section class="content-body content-formatted js-buy-btn-content mar_32-0" data-search-indexing-allowed="true">
                  {% contentblock %}{{ "write_product_description_here" | lc: editor_locale }}{% endcontentblock %}
                </section>
              </div>
            </div>
          </div>

          <section class="content-body content-formatted" data-search-indexing-allowed="true">{% content name="content" %}</section>

          <div>
            {%- assign pageIdsArr = "" | split: ',' -%}
            {%- for i in (1..3) -%}
              {%- assign relatedProductKey = 'is_related_product_' | append: i -%}
              {%- assign relatedProductPageId = page.data[productLayoutSettingsKey][relatedProductKey] -%}
              {%- assign pageIdsArr = pageIdsArr | push: relatedProductPageId -%}
              {%- assign pageIdCompactArr = pageIdsArr | compact -%}
            {%- endfor -%}

            <h3 class="visits-title mar_t-48"{% if pageIdCompactArr.size <= 0 %} style="display: none;"{% endif %}>
              {{ "related_products" | lc }}
            </h3>

            <div class="product_list content-formatted flex_row flex_row-3 mar_0-8-neg mar_t-48">
              {%- for id in pageIdCompactArr -%}
                <div class="product_item js-product-item flex_row-3--item" data-path="{{page.path}}">
                  <div class="mar_0-8">
                    <div class="product_item-wrap">
                      {%- load buy_button to "buy_button" q.content.parent_id=id q.content.parent_type="page" -%}
                      {% include 'product-item', _buyButton: buy_button, _entityData: _buyButton.content.parent %}
                    </div>
                  </div>
                </div>
              {%- endfor -%}
            </div>
          </div>
        </main>
      </div>
    </div>
    {% include "footer" %}
  </div>

  {% include "site-signout" %}
  {% include "javascripts", _productPage: true %}
  {% include 'settings-popover', _productPage: true %}
</body>
</html>
