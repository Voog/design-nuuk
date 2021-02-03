<!DOCTYPE html>
{% include "template-settings" %}
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {%- if editmode -%}editmode{%- else -%}publicmode{%- endif -%} {% include 'semimodal-class-names' %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {%- include "html-head" -%}
  {%- include "template-styles" -%}
</head>

<body class="product_list-page body-bg_picker--area {{ body_bg_type }}">
  {% include "template-svg-spritesheet" %}
  <div class="body-bg_color"></div>
  <div class="container_wrap">
    {%- include "header" -%}
    <div class="pad_container p-rel">
      {%- if editmode -%}
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
      {%- endif -%}
      <div class="container flex_col flex_j-space-between">
        {% if editmode %}

          <div class="edit-btn mar_b-16">
            {% assign add_product_label = 'add_product' | lc %}
            {% assign add_product_title = 'add_product_page' | lc %}
            {% menuadd parent="item" label=add_product_label lable=add_product_title layout_title="Product" %}
          </div>
        {% endif %}

        <main class="content" role="main">
          <div class="content-body content-formatted" data-search-indexing-allowed="true">
            {% contentblock name="page_title" publish_default_content="true" %}
              <h1>{{page.title}}</h1>
            {% endcontentblock %}
          </div>

          {% include 'product-list-filter' %}
          {% include 'product-list-block' %}
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
