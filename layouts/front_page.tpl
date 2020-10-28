<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

<body class="front-page js-bg-picker-area flex_box">
  {% include "header" %}
  <div class="background-image js-background-image"></div>
  <div class="background-color js-background-color"></div>
  {% if editmode %}
    <button class="voog-bg-picker-btn js-background-settings l-64 t-32" data-bg-key="body_bg" data-bg-picture-boolean="false" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
  {% endif %}


  <div class="flex_col w-100p">
    {% include 'image_src_variable', _data: page.data.front_header_bg, _targetWidth: "1200" %}
    <div
      class="front_header-image mar_b-56 bg_img-cover{%- if _src != blank %} image_header{%- endif -%}"
      {% if _src != blank -%}
        style="background-image: url({{_src}});"
      {%- endif -%}
    >
      <div class="front_header-color bg_color-absolute"
        {% if site.data.front_header_bg.color != blank %}
          style="background-color: {{ site.data.front_header_bg.color }};"
        {% endif %}
      ></div>
      {% if editmode %}
        <button class="bg-picker r-32 t-32" data-picture="true" data-color="true" data-image_elem=".front_header-image" data-color_elem=".front_header-color" data-name="front_header_bg" data-bg="{{ page.data.front_header_bg | json | escape }}"></button>
      {% endif %}
    </div>
    <div class="container flex_col flex_j-space-between h-100p">
      <main class="content" role="main" data-search-indexing-allowed="true">
        <div class="content-slogan content-formatted js-content-optional">{% content name="slogan" %}</div>
        <section class="content-body content-formatted">{% content %}</section>
      </main>

      {% include "footer" %}

    </div>
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "template-tools" %}
  <script>site.initFrontPage();</script>
</body>
</html>
