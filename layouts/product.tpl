<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
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
        {% include "menu-level-2" %}

        <main class="content" role="main" data-search-indexing-allowed="true">
          {% include 'image_src_variable', _data: page.data.product_image, _targetWidth: "1200" %}
          <div
            class="product_image bg_img-cover{%- if _src != blank %} image_portrait{%- endif -%}"
            {% if _src != blank -%}
              style="background-image: url({{_src}});"
            {%- endif -%}
          ></div>
          <section class="content-body content-formatted">{% content %}</section>
          {% if editmode %}
            <button class="bg-picker" data-picture="true" data-color="false" data-elem=".product_image" data-name="product_image" data-bg="{{ page.data.product_image | json | escape }}"></button>
          {% endif %}
        </main>

        {% include "footer" %}

      </div>
    </div>
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "template-tools" %}
  <script>site.initCommonPage();</script>
</body>
</html>
