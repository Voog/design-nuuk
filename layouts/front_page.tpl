<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {%- assign swiperSettingsData = page.data.swiper_settings -%}
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

<body class="front-page js-bg-picker-area{% include 'semimodal-class-names' %}">
  {% if editmode %}
    <div class="bg-picker-top"
      {%- if page.data.front_header_bg_1.image != blank %}
        style="top: 500px"
      {%- endif -%}
    >
      <button class="voog-bg-picker-btn js-background-settings l-64 t-32" data-bg-key="body_bg" data-bg-picture-boolean="false" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
    </div>
  {% endif %}
  <div class="background-color js-background-color"></div>

  <div class="flex_box js-background-type {{ body_bg_type }}">
    {% include "header" %}
    <div class="flex_col content_wrap">

      {% capture header_content %}
        <div class="swiper-content swiper-content-absolute content-formatted">
          {% contentblock name="front_header_content" publish_default_content="true" %}
            <h1>Shop</h1>
          {% endcontentblock %}
        </div>
      {% endcapture %}

      {%- if swiperSettingsData.is_slider == true -%}
        <div class="swiper-container">
          <div class="swiper-wrapper">
            {%- for i in (1..swiperSettingsData.slides_count) -%}
              {% assign headerImageKey = 'front_header_bg_' | append: i %}
              {% assign contentKey = 'front_header_content_' | append: i %}
              {% include 'image_src_variable', _data: page.data[headerImageKey], _targetWidth: "1400" %}
              <div
                class="swiper-slide{%- if page.data[headerImageKey].image != blank %} image_header{%- endif -%}"
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
                    {% if editmode %}
                      <button
                        class="bg-picker r-32 t-32" data-type="img" data-picture="true"
                        data-color="true" data-image_elem=".front_header-image-{{i}}"
                        data-color_elem=".front_header-color-{{i}}" data-name="{{headerImageKey}}"
                        data-bg="{{ page.data[headerImageKey] | json | escape }}">
                      </button>
                    {% endif %}
                  {%- endif -%}
                </div>

              </div>
            {%- endfor -%}
          </div>
        <!-- If we need pagination -->
          {%- if swiperSettingsData.are_navigation_bullets == true -%}
            <div class="swiper-pagination"></div>
          {%- endif -%}
          {%- if swiperSettingsData.are_navigation_arrows == true or editmode -%}
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
          {%- endif -%}

          {%- if swiperSettingsData.is_content_by_slide != true -%}
            {{header_content}}
          {%- endif -%}
        </div>
      {%- else -%}
        {% include 'image_src_variable', _data: page.data.front_header_bg_1, _targetWidth: "1800" %}
        <div
          class="js-bg-wrapper {%- if page.data.front_header_bg_1.image != blank %} image_header{%- endif -%}"
        >
        {%- assign imageClass = "image_fit-cover front_header-image-1" -%}
        {% include "lazy-image", _data: page.data.front_header_bg_1, _targetWidth: '1400', _className: imageClass  %}
          <div class="front_header-color-1 bg_color-absolute"
            {% if site.data.front_header_bg_1.color != blank %}
              style="background-color: {{ site.data.front_header_bg_1.color }};"
            {% endif %}
          ></div>
          {% if editmode %}
            <button
              class="bg-picker r-32 t-32" data-type="img" data-picture="true" data-color="true"
              data-image_elem=".front_header-image-1" data-color_elem=".front_header-color-1"
              data-name="front_header_bg_1" data-bg="{{ page.data.front_header_bg_1 | json | escape }}"
              data-wrapper_class="image_header"
            ></button>
          {% endif %}

          {{header_content}}
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
  </div>
  {% include 'site-components' %}
  {% include "site-signout" %}
  {% include 'settings-popover', _frontPage: true %}
  {% include "javascripts" %}
  {% include 'swiper-js' %}
  {% include "template-tools" %}
  <script>
    site.initFrontPage();
  </script>
</body>
</html>
