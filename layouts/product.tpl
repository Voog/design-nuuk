<!DOCTYPE html>
{% include "template-settings" %}
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %} {% include 'semimodal-class-names' %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign product_page = true -%}
</head>

{% capture bottom_content_html %}{% unless editmode %}{% content name="content" %}{% endunless %}{% endcapture %}
{% capture bottom_content_size %}{{ bottom_content_html | size | minus: 1 }}{% endcapture %}
{% unless bottom_content_size contains "-" %}
  {% assign bottom_content_has_content = true %}
{% endunless %}

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
          <div class="flex_row flex_row-2 reverse-col-tablet mar_0-32-neg">
            <div class="flex_row-2--item-60">
              <div class="mar_0-32 p-rel js-product-page-image-wrap">
                {%- load buy_button to "buy_button" q.content.parent_id=page.id q.content.parent_type="page" q.content.name="body" s="content.position" -%}
                {% if buy_button.product != blank %}
                  {%- assign buyButtonImage = buy_button.product.image -%}
                {% endif %}

                {%- if page.data[itemImageKey] != blank -%}
                  {%- assign productImage = page.data[itemImageKey] -%}
                  {%- assign isProductImage = false -%}
                {%- elsif buyButtonImage != blank -%}
                  {%- assign productImage = buyButtonImage -%}
                  {%- assign isProductImage = true -%}
                {%- else -%}
                  {%- assign productImage = page.image -%}
                  {%- assign isProductImage = false -%}
                {%- endif -%}

                {%- if productImage != blank or editmode -%}
                  <div class="js-product-page-image  mar_b-32">
                    {% include 'content-item', _isProductImage: isProductImage, _imageData: productImage, _entityData: page, _itemType: 'page', _id: page.id, _staticItem: isPostImageStatic, _targetWidth: '1280' %}
                  </div>
                {%- endif -%}
              </div>
              <section class="content-body content-formatted mar_0-32" data-search-indexing-allowed="true">
                {%- assign gallery_title = "gallery" | lce -%}
                {%- assign gallery_title_tooltip = "content_tooltip_additional_images" | lce -%}
                {% content name="gallery" title=gallery_title title_tooltip=gallery_title_tooltip %}
              </section>
            </div>

            <div class="flex_row-2--item-40">
              <div class="mar_0-32 flex_col t-sticky">
                <div class="flex_row flex_a-center flex_j-space-between mar_b-64">
                  <div class="content-body content-formatted" data-search-indexing-allowed="true">

                    {% contentblock name="page_title" publish_default_content="true" %}
                      <h3>{{page.title}}</h3>
                    {% endcontentblock %}
                    {%- assign productSettingsData = page.data[productLayoutSettingsKey] -%}
                    {%- assign isBoxLabel = productSettingsData.is_product_label_box -%}
                    {%- assign isLabelLineThrough = productSettingsData.is_product_label_line_through -%}

                    {%- if buy_button.product.out_of_stock? -%}
                      <div class="product_item-box--label mar_t-32">{{ "out_of_stock" | lc | escape_once }}</div>
                    {%- elsif productSettingsData.product_label != blank -%}
                      <div class="mar_t-16{% if isBoxLabel == true %} product_item-box--label{% endif %}{% if isLabelLineThrough == true %} td-lt{% endif %}">
                        {{productSettingsData.product_label}}
                      </div>
                    {%- endif -%}

                  </div>
                  <div>
                    {% include 'product-page-nav' %}
                  </div>
                </div>
                <section class="content-body content-formatted js-buy-btn-content mar_32-0" data-search-indexing-allowed="true">
                  {%- assign content_title = "content" | lce -%}
                  {%- assign content_title_tooltip = "content_tooltip_specific_page" | lce -%}
                  {% contentblock title=content_title title_tooltip=content_title_tooltip %}{{ "write_product_description_here" | lc: editor_locale }}{% endcontentblock %}
                </section>
              </div>
            </div>
          </div>

          {%- if bottom_content_has_content == true or editmode -%}
            {%- assign bottom_content_title = "additional_content" | lce -%}
            {%- assign bottom_content_title_tooltip = "content_tooltip_additional_information" | lce -%}
            <section class="content-body content-formatted content-formatted--overflowed-images mar_b-32" data-search-indexing-allowed="true">{% content name="content" title=bottom_content_title title_tooltip=bottom_content_title_tooltip %}</section>
          {%- endif -%}

          <div>
            {%- assign pageIdsArr = "" | split: ',' -%}
            {%- for i in (1..3) -%}
              {%- assign relatedProductKey = 'is_related_product_' | append: i -%}
              {%- assign relatedProductPageId = page.data[productLayoutSettingsKey][relatedProductKey] | plus: 0 -%}
              {%- if relatedProductPageId >= 1 -%}
                {%- assign pageIdsArr = pageIdsArr | push: relatedProductPageId -%}
                {%- assign pageIdCompactArr = pageIdsArr | compact -%}
              {%- endif -%}
            {%- endfor -%}

            {% if pageIdCompactArr != blank or pageIdCompactArr.size >= 1 %}
              <h3 class="visits-title mar_t-48">
                {{ "related_products" | lc | escape_once }}
              </h3>

              <div class="product_list flex_row flex_row-3 mar_0-8-neg mar_t-48">
                {%- for id in pageIdCompactArr -%}
                  <div class="product_item js-product-item flex_row-3--item" data-path="{{page.path}}">
                    <div class="mar_0-8">
                      <div class="product_item-wrap">
                        {%- load buy_button to "buy_button" q.content.parent_id=id q.content.parent_type="page" q.content.name="body" s="content.position" -%}
                        {% include 'product-item', _buyButton: buy_button, _entityData: _buyButton.content.parent %}
                      </div>
                    </div>
                  </div>
                {%- endfor -%}
              </div>
            {% endif %}
          </div>
        </main>
      </div>
    </div>
    {% include "footer" %}
  </div>

  {% include 'template-tooltips' %}
  {% include "site-signout" %}
  {% include "javascripts", _productPage: true %}
  <script>
    site.handleProductPageContent();
  </script>
  {% include 'settings-popover', _productPage: true %}
</body>
</html>
