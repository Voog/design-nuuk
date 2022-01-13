<!DOCTYPE html>
{% include "template-settings" %}
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %} {% include 'semimodal-class-names' %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {%- assign swiperSettingsData = page.data[swiperSettingsKey] -%}
  {% include "html-head" %}
  {% include "template-styles" %}
  {% capture front_slogan_html %}{% unless editmode %}{% content name="slogan" %}{% endunless %}{% endcapture %}
  {% capture front_slogan_size %}{{ front_slogan_html | size | minus: 1 }}{% endcapture %}
  {% unless front_slogan_size contains "-" %}
    {% assign front_slogan_has_content = true %}
  {% endunless %}

  {% capture front_main_html %}{% unless editmode %}{% content %}{% endunless %}{% endcapture %}
  {% capture front_main_size %}{{ front_main_html | size | minus: 1 }}{% endcapture %}
  {% unless front_main_size contains "-" %}
    {% assign front_main_has_content = true %}
  {% endunless %}
</head>

<body class="front-page body-bg_picker--area {{ body_bg_type }}">
  <div class="body-bg_color"></div>
  <div class="container_wrap">
    {% include "header" %}

    <div class="flex_col content_wrap">
      {% capture header_content %}
        <div class="swiper-content content-formatted" data-search-indexing-allowed="true">
          <div class="swiper-content-area">
            {% content name="slaider_content-1" %}
          </div>
        </div>
      {% endcapture %}

      {%- if swiperSettingsData.slides_count >= 2 -%}
        <div class="swiper-container">
          <div class="swiper-wrapper{%- if swiperSettingsData.is_content_by_slide != true %} p-abs{% endif -%}">
            {%- for i in (1..swiperSettingsData.slides_count) -%}
              {% assign swiperDataKey = swiperBgKey | append: i %}
              {% assign contentKey = 'slaider_content-' | append: i %}

              {%- if forloop.index == 1 -%}
                {%- assign imagedata = swiper_bg_1 -%}
              {%- else -%}
                {%- assign imagedata = page.data[swiperDataKey] -%}
              {%- endif -%}

              <div
                class="swiper-slide front-header-bg_picker--area--{{i}}{%- if imagedata != blank or editmode %} image_header{%- endif -%}"
              >
                {%- assign imageClass = "image_fit-cover img-absolute swiper-lazy front_header-image-" | append: i -%}

                {% include "lazy-image", _data: imagedata, _targetWidth: '2048', _className: imageClass, disableLazyLoad: true  %}
                <div class="w-100p h-100p front_header-color-{{i}}"
                  {% if page.data[swiperDataKey].color != blank %}
                    style="background-color: {{ page.data[swiperDataKey].color }};"
                  {% endif %}
                >
                  {%- if swiperSettingsData.is_content_by_slide == true -%}
                    <div class="swiper-content content-formatted swiper-content-{{ swiperSettingsData.content_position }}" data-swiper-parallax="-100%" data-search-indexing-allowed="true">
                      <div class="swiper-content-area">
                        {% content name=contentKey %}
                      </div>
                    </div>
                  {%- endif -%}

                  {% if editmode %}
                    <button
                      class="bg-picker r-32 t-32"
                      data-type="img"
                      data-type_picture="true"
                      data-type_color="true"
                      data-image_elem=".front_header-image-{{i}}"
                      data-color_elem=".front_header-color-{{i}}"
                      data-picker_area_elem=".front-header-bg_picker--area--{{i}}"
                      data-picker_elem=".front-header-bg_picker-{{i}}"
                      data-bg_key="{{swiperDataKey}}"
                      data-bg="{{ imagedata | json | escape }}"
                    ></button>
                  {% endif %}
                </div>

              </div>
            {%- endfor -%}
          </div>

          {%- if swiperSettingsData.are_navigation_bullets == true -%}
            <div class="swiper-pagination"></div>
          {%- endif -%}

          {%- if swiperSettingsData.are_navigation_arrows == true or editmode -%}
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
          {%- endif -%}

          {%- if swiperSettingsData.is_content_by_slide != true -%}
            {{header_content}}
          {%- endif -%}
        </div>
      {%- else -%}
        <div
          class="swiper-container image_header flex_box front-header-bg_picker--area-1"
        >
          {%- assign imageClass = "image_fit-cover img-absolute front_header-image-1" -%}
          {% include "lazy-image", _data: swiper_bg_1, _targetWidth: '2048', _className: imageClass  %}
          {% assign swiperDataKey = swiperBgKey | append: 1 %}

          {% if editmode %}
            <button
              class="bg-picker"
              data-type_picture="true"
              data-type_color="true"
              data-image_elem=".front_header-image-1"
              data-color_elem=".front_header-color-1"
              data-picker_area_elem=".front-header-bg_picker--area-1"
              data-picker_elem=".front-header-bg_picker-1"
              data-bg_key="{{swiperDataKey}}"
              data-bg="{{ swiper_bg_1 | json | escape }}"
              data-wrapper_class="image_header"
            ></button>
          {% endif %}

          <div class="w-100p h-100p front_header-color-1 bg_color-absolute js-background-type"
            {% if page.data[swiperDataKey].color != blank %}
              style="background-color: {{ page.data[swiperDataKey].color }};"
            {% endif %}
          ></div>

          {{header_content}}
        </div>
      {%- endif -%}

      <div class="pad_container p-rel">
        {% if editmode %}
          <div class="mar_t-32 p-rel">
            <button
              class="voog-bg-picker-btn body_bg-picker--btn bg-picker {{bodyBgKey}}-picker"
              data-bg_key="{{bodyBgKey}}"
              data-type_picture="false"
              data-type_color="true"
              data-color_elem=".body-bg_color"
              data-picker_area_elem=".body-bg_picker--area"
              data-picker_elem=".{{bodyBgKey}}-picker"
              data-bg-color="{{ body_bg_color }}"
            ></button>
          </div>
        {% endif %}
        <div class="container flex_col flex_j-space-between h-100p">
          <main class="content" role="main" data-search-indexing-allowed="true">
            <div class="content-slogan content-formatted js-content-optional{% if front_main_has_content or editmode %} mar_b-32{% endif %}" data-search-indexing-allowed="true">
              {% content name="slogan" %}
            </div>
            {% include 'modular-blocks',
              _blockSettings: page.data[blockSettingsKey],
              _frontPage: true,
              _defaultBlockObj: template_settings.page.block_columns_settings_front_page.value
            %}
          </main>
        </div>
      </div>
    </div>
    {% include "footer" %}
  </div>

  {% include 'template-tooltips' %}
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include 'swiper-js' %}
</body>
</html>
