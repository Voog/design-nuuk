<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {%- assign swiperSettingsData = page.data.swiper_settings -%}
  {% include "html-head" %}
  {% include "template-styles" %}
  {% capture front_slogan_html %}{% unless editmode %}{% content name="front-slogan" %}{% endunless %}{% endcapture %}
  {% capture front_slogan_size %}{{ front_slogan_html | size | minus : 1 }}{% endcapture %}
  {% unless front_slogan_size contains "-" %}
    {% assign front_slogan_has_content = true %}
  {% endunless %}

  {% capture front_main_html %}{% unless editmode %}{% content name="front-main" %}{% endunless %}{% endcapture %}
  {% capture front_main_size %}{{ front_main_html | size | minus : 1 }}{% endcapture %}
  {% unless front_main_size contains "-" %}
    {% assign front_main_has_content = true %}
  {% endunless %}
</head>

<body class="front-page js-bg-picker-area{% include 'semimodal-class-names' %}">
  <div class="background-color js-background-color"></div>

  <div class="container_wrap js-background-type {{ body_bg_type }}">

    <div class="flex_col content_wrap">
      {% capture header_content %}
        <div class="swiper-content content-formatted">
          {% contentblock name="front_header_content" publish_default_content="true" %}
            <h1>Shop</h1>
          {% endcontentblock %}
        </div>
      {% endcapture %}

      {%- if swiperSettingsData.slides_count >= 2 -%}
        <div class="swiper-container">
          {% include "header" %}

          <div class="swiper-wrapper{%- if swiperSettingsData.is_content_by_slide != true %} p-abs{% endif -%}">
            {%- for i in (1..swiperSettingsData.slides_count) -%}
              {% assign headerImageKey = 'front_header_bg_' | append: i %}
              {% assign contentKey = 'front_header_content_' | append: i %}

              {%- if forloop.index == 1 -%}
                {%- assign imagedata = front_header_bg_1 -%}
              {%- else -%}
                {%- assign imagedata = page.data[headerImageKey] -%}
              {%- endif -%}

              <div
                class="swiper-slide{%- if imagedata != blank or editmode %} image_header{%- endif -%}"
              >
                {%- assign imageClass = "image_fit-cover img-absolute swiper-lazy front_header-image-" | append: i -%}

                {% include "lazy-image", _data: imagedata, _targetWidth: '1400', _className: imageClass, disableLazyLoad: true  %}
                <div class="front_header-color-{{i}}"
                  {% if page.data[headerImageKey].color != blank %}
                    style="background-color: {{ page.data[headerImageKey].color }};"
                  {% endif %}
                >
                  {%- if swiperSettingsData.is_content_by_slide == true -%}
                    <div class="swiper-content content-formatted" data-swiper-parallax="-300">
                      {% contentblock name=contentKey publish_default_content="true" %}
                        <h1>Shop</h1>
                      {% endcontentblock %}
                    </div>
                  {%- endif -%}

                  {% if editmode %}
                    <button
                      class="bg-picker r-32 t-32" data-type="img" data-picture="true"
                      data-color="true" data-image_elem=".front_header-image-{{i}}"
                      data-color_elem=".front_header-color-{{i}}" data-name="{{headerImageKey}}"
                      data-bg="{{ imagedata | json | escape }}">
                    </button>
                  {% endif %}
                </div>

              </div>
            {%- endfor -%}
          </div>
        <!-- If we need pagination -->
          {%- if editmode -%}
            <!-- If we need navigation buttons -->
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
          {%- endif -%}
          {%- if swiperSettingsData.is_content_by_slide != true -%}
            {{header_content}}
          {%- endif -%}
        </div>
      {%- else -%}
        <div
          class="swiper-container js-bg-wrapper image_header"
        >
          {% include "header" %}

          {%- assign imageClass = "image_fit-cover img-absolute front_header-image-1" -%}
          {% include "lazy-image", _data: front_header_bg_1, _targetWidth: '1400', _className: imageClass  %}

          {% if editmode %}
            <button
              class="bg-picker" data-type="img" data-picture="true" data-color="true"
              data-image_elem=".front_header-image-1" data-color_elem=".front_header-color-1"
              data-name="front_header_bg_1" data-bg="{{ front_header_bg_1 | json | escape }}"
              data-wrapper_class="image_header"
            ></button>
          {% endif %}

          {{header_content}}

          <div class="front_header-color-1 bg_color-absolute"
            {% if page.data.front_header_bg_1.color != blank %}
              style="background-color: {{ page.data.front_header_bg_1.color }};"
            {% endif %}
          ></div>
        </div>
      {%- endif -%}

      <div class="container flex_col flex_j-space-between h-100p">
        <main class="content" role="main" data-search-indexing-allowed="true">
          {% if editmode %}
            <div class="bg-picker-top">
              <button class="voog-bg-picker-btn js-background-settings" data-bg-key="body_bg" data-bg-picture-boolean="false" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
            </div>
          {% endif %}

          <div class="content-slogan content-formatted js-content-optional{% if front_slogan_has_content or editmode %} mar_t-32{% endif %}">
            {% contentblock name="front-slogan" publish_default_content="false" %}
              <h1>Welcome to<br>our fancy<br>vanilla website</h1>
            {% endcontentblock %}
          </div>
          <section class="content-body content-formatted{% if front_main_has_content or editmode %} mar_t-32{% endif %}">{% content name="front-main" %}</section>
        </main>

        {% include "footer" %}

      </div>
    </div>
  </div>

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
