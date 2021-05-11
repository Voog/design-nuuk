<!DOCTYPE html>
{% include "template-settings" %}
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %} {% include 'semimodal-class-names' %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {%- include "html-head" -%}
  {%- include "template-styles" -%}
</head>

{% capture bottom_content_html %}{% unless editmode %}{% content name="bottom_content" %}{% endunless %}{% endcapture %}
{% capture bottom_content_size %}{{ bottom_content_html | size | minus: 1 }}{% endcapture %}
{% unless bottom_content_size contains "-" %}
  {% assign bottom_content_has_content = true %}
{% endunless %}

<body class="product_list-page body-bg_picker--area {{ body_bg_type }}">
  {% include "template-svg-spritesheet" %}
  <div class="body-bg_color"></div>
  <div class="container_wrap">
    {%- include "header" -%}
    <div class="pad_container p-rel">
      {%- if editmode -%}
        <div class="mar_b-32">
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
          <div class="edit-btn add-page mar_b-16">
            {% assign add_product_label = 'add_product' | lce %}
            {% assign add_product_title = 'add_product_page' | lce %}
            {% menuadd parent="page.menuitem" label=add_product_label lable=add_product_title layout_title="Product" %}
          </div>
        </div>
      {%- endif -%}
      <div class="container flex_col flex_j-space-between">
        <main class="content" role="main">
          <div class="content-body content-formatted mar_b-48" data-search-indexing-allowed="true">
            {% contentblock name="page_title" publish_default_content="true" %}
              <h1>{{page.title}}</h1>
            {% endcontentblock %}
          </div>

          {% include 'product-list-filter' %}
          {% include 'product-list-block' %}

          {%- if bottom_content_has_content == true or editmode -%}
            <div class="content-body content-formatted content-formatted--overflowed-images mar_b-56" data-search-indexing-allowed="true">
              {% content name="bottom_content" %}
            </div>
          {%- endif -%}
        </main>
      </div>
    </div>
    {%- include "footer" -%}
  </div>

  {% include 'settings-popover' %}
  {%- include "site-signout" -%}
  {%- include "javascripts" -%}
  <script>
    site.initProductListPage();
  </script>
</body>
</html>
