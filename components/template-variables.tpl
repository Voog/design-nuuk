{%- capture swiper_bg_json -%}
  {
    "image": "//static.voog.com/voogstock/arch-door-couch-00095.jpg",
    "width": 1333,
    "height": 1999,
    "imageSizes": [
      {
        "url": "//static.voog.com/voogstock/arch-door-couch-00095.jpg",
        "height": 1999,
        "width": 1333
      },
      {
        "url": "//static.voog.com/voogstock/arch-door-couch-00095_large.jpg",
        "height": 1280,
        "width": 854
      },
      {
        "url": "//static.voog.com/voogstock/arch-door-couch-00095_block.jpg",
        "height": 600,
        "width": 400
      },
      {
        "url": "//static.voog.com/voogstock/arch-door-couch-00095_medium.jpg"
      }
    ]
  }
{%- endcapture -%}
{%- assign swiper_bg = swiper_bg_json | json_parse -%}
{% capture dont_render %}
  {% comment %}Page data keys{% endcomment %}
  {%- assign bodyBgKey = template_settings.page.body_bg.key -%}
  {%- assign blockSettingsKey = template_settings.page.block_settings.key -%}
  {%- assign itemImageKey = template_settings.page.item_image.key -%}
  {%- assign itemImageCropStateKey = template_settings.page.image_crop_state.key -%}
  {%- assign itemImageAltAttrKey = template_settings.page.image_alt_attr.key -%}
  {%- assign productLayoutSettingsKey = template_settings.page.product_layout_settings.key -%}
  {%- assign swiperBgKey = template_settings.page.swiper_bg.key -%}
  {%- assign swiperSettingsKey = template_settings.page.swiper_settings.key -%}

  {% comment %}Site data keys{% endcomment %}
  {%- assign languageMenuSettingsKey = template_settings.site.language_menu_settings.key -%}
  {%- assign menuSettingsKey = template_settings.site.menu_settings.key -%}
  {%- assign semimodalBgKey = template_settings.site.semimodal_bg.key -%}

  {%- assign swiperBg1Key = swiperBgKey | append: 1 -%}
  {% assign swiper_bg_1 = page.data[swiperBg1Key] %}
  {%- if swiper_bg_1 == blank -%}
    {% assign swiper_bg_1 = swiper_bg %}
  {%- endif -%}

  {% assign semimodal_bg = site.data[semimodalBgKey] %}
  {% assign semimodal_bg_combined_lightness = semimodal_bg.combinedLightness %}

  {% if semimodal_bg %}
    {% if semimodal_bg_combined_lightness %}
      {% if semimodal_bg_combined_lightness > 0.6 %}
        {% assign semimodal_bg_type = "light-background" %}
      {% else %}
        {% assign semimodal_bg_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if semimodal_bg_color_data.a >= 0.6 %}
        {% if semimodal_bg_color_data.lightness >= 0.6 %}
          {% assign semimodal_bg_type = "light-background" %}
        {% else %}
          {% assign semimodal_bg_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign semimodal_bg_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign semimodal_bg_type = "light-background" %}
  {% endif %}

  {% comment %}SITE BODY RELATED VARIABLES.{% endcomment %}
  {% comment %}Assign variables based on page type.{% endcomment %}
  {% if blog_article_page %}
    {% assign body_bg = article.data[bodyBgKey] %}
  {% else %}
    {% assign body_bg = page.data[bodyBgKey] %}
  {% endif %}

  {% comment %}Assign variables based on page type.{% endcomment %}
  {% assign body_bg_color = body_bg.color %}
  {%- if body_bg_color == blank -%}
    {%- assign body_bg_color = 'none' -%}
  {%- endif -%}
  {% assign body_bg_color_data = body_bg.colorData %}
  {% assign body_bg_combined_lightness = body_bg.combinedLightness %}

  {% if body_bg %}
    {% if body_bg_combined_lightness %}
      {% if body_bg_combined_lightness > 0.6 %}
        {% assign body_bg_type = "light-background" %}
      {% else %}
        {% assign body_bg_type = "dark-background" %}
      {% endif %}
    {% else %}
      {% if body_bg_color_data.a >= 0.6 %}
        {% if body_bg_color_data.lightness >= 0.6 %}
          {% assign body_bg_type = "light-background" %}
        {% else %}
          {% assign body_bg_type = "dark-background" %}
        {% endif %}
      {% else %}
        {% assign body_bg_type = "light-background" %}
      {% endif %}
    {% endif %}
  {% else %}
    {% assign body_bg_type = "light-background" %}
  {% endif %}

  {% comment %}Detects language flags visibility setting.{% endcomment %}
  {% if site.data[languageMenuSettingsKey].item_state == "names_only" %}
    {% assign language_flags_mode = "language-flags-disabled" %}
    {% assign language_names_mode = "language-names-enabled" %}
  {% elsif site.data[languageMenuSettingsKey].item_state == "flags_only" %}
    {% assign language_flags_mode = "language-flags-enabled" %}
    {% assign language_names_mode = "language-names-disabled" %}
  {% else %}
    {% assign language_names_mode = "language-names-enabled" %}
    {% assign language_flags_mode = "language-flags-disabled" %}
  {% endif %}

  {% comment %}Detects language menu mode setting.{% endcomment %}
  {% assign language_menu_mode = "language-menu-mode-popover" %}

  {% if editmode %}
    {% assign show_language_menu_popover = true %}
  {% else %}
    {% if language_menu_mode == "language-menu-mode-popover" and site.has_many_languages? %}
      {% assign show_language_menu_popover = true %}
    {% else %}
      {% assign show_language_menu_popover = false %}
    {% endif %}
  {% endif %}

  {% comment %}Sets current language title variable.{% endcomment %}
  {% for language in site.languages %}
    {% if language.selected? %}
      {% assign current_language_title = language.title %}
    {% endif %}
  {% endfor %}

  {% assign product_list_layout = "Product list" %}
  {% assign product_layout = "Product" %}

  {% comment %}=================================================================
  | Design editor variables.
  ============================================================= {% endcomment %}
  {% capture base_font_set %}
    [
      {
        "type": "group",
        "title": "Sans Serif",
        "list": [
          {
            "title": "Avenir Next",
            "value": "\"Avenir Next\", sans-serif"
          },
          {
            "title": "Fira Sans",
            "value": "\"Fira Sans\", sans-serif"
          },
          {
            "title": "Lato",
            "value": "\"Lato\", sans-serif"
          },
          {
            "title": "Montserrat",
            "value": "\"Montserrat\", sans-serif"
          },
          {
            "title": "Open Sans",
            "value": "\"Open Sans\", sans-serif"
          },
          {
            "title": "PT Sans",
            "value": "\"PT Sans\", sans-serif"
          },
          {
            "title": "Raleway",
            "value": "\"Raleway\", sans-serif"
          },
          {
            "title": "Roboto",
            "value": "\"Roboto\", sans-serif"
          },
          {
            "title": "Source Sans Pro",
            "value": "\"Source Sans Pro\", sans-serif"
          },
          {
            "title": "Ubuntu",
            "value": "\"Ubuntu\", sans-serif"
          }
        ]
      },
      {
        "type": "group",
        "title": "Serif",
        "list": [
          {
            "title": "Arvo",
            "value": "\"Arvo\", serif"
          },
          {
            "title": "Crimson Text",
            "value": "\"Crimson Text\", serif"
          },
          {
            "title": "Georgia",
            "value": "\"Georgia\", serif"
          },
          {
            "title": "Lora",
            "value": "\"Lora\", serif"
          },
          {
            "title": "Noto Serif",
            "value": "\"Noto Serif\", serif"
          },
          {
            "title": "Playfair Display",
            "value": "\"Playfair Display\", serif"
          },
          {
            "title": "PT Serif",
            "value": "\"PT Serif\", serif"
          },
          {
            "title": "Roboto Slab",
            "value": "\"Roboto Slab\", serif"
          }
        ]
      },
      {
        "type": "group",
        "title": "Monospace",
        "list": [
          {
            "title": "Anonymous Pro",
            "value": "\"Anonymous Pro\", monospace"
          },
          {
            "title": "Cousine",
            "value": "\"Cousine\", monospace"
          },
          {
            "title": "Roboto Mono",
            "value": "\"Roboto Mono\", monospace"
          },
          {
            "title": "Ubuntu Mono",
            "value": "\"Ubuntu Mono\", monospace"
          }
        ]
      }
    ]
  {% endcapture %}

  {% capture base_hyphens_toggle_set %}
    [
      {
        "titleI18n": "off",
        "value": "none"
      },
      {
        "titleI18n": "on",
        "value": "auto"
      }
    ]
  {% endcapture %}

  {% capture base_alignment_set %}
    [
      {
        "titleI18n": "left",
        "value": "left"
      },
      {
        "titleI18n": "center",
        "value": "center"
      },
      {
        "titleI18n": "right",
        "value": "right"
      }
    ]
  {% endcapture %}

  {% capture base_alignment_flex %}
    [
      {
        "titleI18n": "left",
        "value": "flex-start"
      },
      {
        "titleI18n": "center",
        "value": "center"
      },
      {
        "titleI18n": "right",
        "value": "flex-end"
      }
    ]
  {% endcapture %}

  {% capture base_number_of_columns_set %}
    [
      {
        "title": "3",
        "value": "33.3%"
      },
      {
        "title": "4",
        "value": "25%"
      },
      {
        "title": "5",
        "value": "20%"
      },
      {
        "title": "6",
        "value": "16.6%"
      }
    ]
  {% endcapture %}

  {% comment %}VOOG intro popover targets. Add them where applicable popovers should appear.{% endcomment %}
  {% capture edy_intro_add_page %}{% if editmode %}data-edy-intro-popover="edy-add-page"{% endif %}{% endcapture %}
  {% capture edy_intro_add_lang %}{% if editmode %}data-edy-intro-popover="edy-add-lang"{% endif %}{% endcapture %}
  {% capture edy_intro_edit_text %}{% if editmode %}data-edy-intro-popover="edy-edit-text"{% endif %}{% endcapture %}

{% endcapture %}
