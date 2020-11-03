<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {%- assign swiperSettingsData = page.data.swiper_settings -%}
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

<body class="front-page js-bg-picker-area flex_box">
  {% include "header" %}
  {% if editmode %}
    <button class="voog-bg-picker-btn js-background-settings l-64 t-32" data-bg-key="body_bg" data-bg-picture-boolean="false" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
  {% endif %}
  <div class="background-color js-background-color"></div>


  <div class="flex_col w-100p">
    {%- if swiperSettingsData.is_slider == true -%}
      <div class="swiper-container">
        <div class="swiper-wrapper">
          {%- for i in (1..swiperSettingsData.slides_count) -%}
            {% assign headerImageKey = 'front_header_bg_' | append: i %}
            {% assign contentKey = 'front_header_content_' | append: i %}
            {% include 'image_src_variable', _data: page.data[headerImageKey], _targetWidth: "1400" %}
            <div
              class="swiper-slide {%- if page.data[headerImageKey] != blank %} image_header{%- endif -%}"
            >
              {%- assign imageClass = "image_fit-cover swiper-lazy front_header-image-" | append: i -%}

              {% include "lazy-image", _data: page.data[headerImageKey], _targetWidth: '1400', _className: imageClass, disableLazyLoad: true  %}
              <div class="front_header-color-{{i}} bg_color-absolute"
                {% if site.data[headerImageKey].color != blank %}
                  style="background-color: {{ site.data[headerImageKey].color }};"
                {% endif %}
              >
                {%- if swiperSettingsData.is_content_by_slide == true -%}
                  <div class="swiper-content content-formatted" data-swiper-parallax="-300">
                    {% contentblock name=contentKey publish_default_content="true" %}
                      <h1>Shop</h1>
                    {% endcontentblock %}
                  </div>
                {%- endif -%}
              </div>
              {% if editmode %}
                <button class="bg-picker r-32 t-32" data-type="img" data-picture="true" data-color="true" data-image_elem=".front_header-image-{{i}}" data-color_elem=".front_header-color-{{i}}" data-name="{{headerImageKey}}" data-bg="{{ page.data[headerImageKey] | json | escape }}"></button>
              {% endif %}
            </div>
          {%- endfor -%}
        </div>
      <!-- If we need pagination -->
        <div class="swiper-pagination"></div>

        <!-- If we need navigation buttons -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>

        {%- if swiperSettingsData.is_content_by_slide != true -%}
          <div class="swiper-content swiper-content-absolute content-formatted">
            {% contentblock name="front_header_content" publish_default_content="true" %}
              <h1>Shop</h1>
            {% endcontentblock %}
          </div>
        {%- endif -%}
      </div>
    {%- else -%}
      {% include 'image_src_variable', _data: page.data.front_header_bg_1, _targetWidth: "1800" %}
      <div
        class="{%- if page.data.front_header_bg_1 != blank %} image_header{%- endif -%}"
      >
      {%- assign imageClass = "image_fit-cover front_header-image-1" -%}
      {% include "lazy-image", _data: page.data.front_header_bg_1, _targetWidth: '1400', _className: imageClass  %}
        <div class="front_header-color-1 bg_color-absolute"
          {% if site.data.front_header_bg_1.color != blank %}
            style="background-color: {{ site.data.front_header_bg_1.color }};"
          {% endif %}
        ></div>
        {% if editmode %}
          <button class="bg-picker r-32 t-32" data-type="img" data-picture="true" data-color="true" data-image_elem=".front_header-image-1" data-color_elem=".front_header-color-1" data-name="front_header_bg_1" data-bg="{{ page.data.front_header_bg_1 | json | escape }}"></button>
        {% endif %}
      </div>
    {%- endif -%}

    {%- if editmode -%}
      <div style="position: absolute;top: 96px;right: 39px; z-index: 1000;">
        <button disabled class="js-front-page-settings-btn">Front page settings</button>
      </div>
    {%- endif -%}

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
  {% include 'swiper-js' %}
  {% include "template-tools" %}
  <script>
    site.initFrontPage();
    {% if editmode %}
      window.addEventListener('DOMContentLoaded', (event) => {
        {% if swiperSettingsData %}
          var valuesObj = {{ swiperSettingsData | json }};
        {% else %}
          var valuesObj = {};
        {% endif %}


        initSettingsEditor(
          {
            settingsBtn: document.querySelector('.js-front-page-settings-btn'),
            menuItems: [
              {
                "title": "Use slider for header images",
                "type": "checkbox",
                "key": "is_slider",
                "states": {
                  "on": true,
                  "off": false
                }
              },
              {
                "title": "Use different content areas for every slide",
                "type": "checkbox",
                "key": "is_content_by_slide",
                "states": {
                  "on": true,
                  "off": false
                }
              },
              {
                "title": "Use fade effect in slider",
                "type": "checkbox",
                "key": "is_fade_effect",
                "states": {
                  "on": true,
                  "off": false
                }
              },
              {
                "title": "Number of header images",
                "type": "number",
                "key": "slides_count",
                "placeholder": "Number of header images",
                "step": 1,
                "min": 1
              }
            ],
            dataKey: 'swiper_settings',
            values: valuesObj
          }
        );
      });
    {% endif %}
  </script>
</body>
</html>
