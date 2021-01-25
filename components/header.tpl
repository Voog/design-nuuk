
{% include "site-search" %}
{% include 'header-fixed' %}

{%- assign menuSettings = site.data[menuSettingsKey] -%}

{%- if menuSettings.max_width >= 1 -%}
  <style>
    body.semimodal-open:not(.semimodal-relative) .semimodal,
    body .semimodal_inner,
    body.semimodal-open .semimodal,
    body.semimodal-relative .semimodal {
      min-width: {{menuSettings.max_width}}px;
      max-width: {{menuSettings.max_width}}px;
    }

    @media screen and (max-width: 900px) {
      .semimodal-relative .semimodal {
        -webkit-transform: translateX(-{{menuSettings.max_width}}px);
        -ms-transform: translateX(-{{menuSettings.max_width}}px);
        transform: translateX(-{{menuSettings.max_width}}px);
      }
    }

    @media screen and (min-width: 900px) {
      .semimodal-open .header_fixed {
        -webkit-transform: translateX({{menuSettings.max_width}}px);
        -ms-transform: translateX({{menuSettings.max_width}}px);
        transform: translateX({{menuSettings.max_width}}px);
      }
    }
  </style>
{%- endif -%}

<div class="
  semimodal js-prevent-sideclick semimodal-bg_picker--area {{semimodal_bg_type}}
  {% if menuSettings.positioning == 'is_top' or menuSettings.positioning == 'is_top_fixed' %} hidden-desktop{% endif %}
  "
>
  {%- assign imageClass = "image_fit-cover image_abs semimodal-bg_image" -%}
  {%- include "lazy-image", _data: semimodal_bg, _className: imageClass -%}

  <div class="semimodal-bg_color bg_color-absolute"
    {%- if semimodal_bg.color != blank %}
      style="background-color: {{ semimodal_bg.color }};"
    {%- endif -%}
  ></div>

  <header class="semimodal_inner">
    <div class="site_title content-formatted">
      {% contentblock name="site-title" xpage="true" %}
        <h3>{{site.title}}</h3>
      {% endcontentblock %}
    </div>

    <div class="semimodal_bottom">
      {%- if editmode -%}
        <div class="semimodal_picker-btn js-prevent-sideclick hidden-tablet">
          <button class="bg-picker"
            data-picture="true"
            data-color="true"
            data-image_elem=".semimodal-bg_image"
            data-color_elem=".semimodal-bg_color"
            data-picker_area_elem=".semimodal-bg_picker--area"
            data-picker_elem=".semimodal-bg_picker"
            data-bg_key="{{semimodalBgKey}}"
            data-bg="{{ semimodal_bg | json | escape }}"
            data-entity="siteData"
          ></button>
        </div>
      {%- endif -%}

      <div class="header_components-tablet">
        {% if show_language_menu_popover %}
          <div class="js-toggle-menu-language menu-language-toggle js-prevent-sideclick" tabindex=0>
            <button class="menu-language-btn ico-flags ico-flag-{{ page.language_code }} js-menu-language-popover-btn" data-lang-code="{{ page.language_locale }}" {{ edy_intro_add_lang }}>
              <span>{{ current_language_title }}</span>
            </button>
            {% if show_language_menu_popover %}
              {% include "menu-language-popover", _semimodal: true %}
            {% endif %}
          </div>
        {% endif %}

        {% include "menu-language-list" %}
        {%- if site.search.enabled -%}<div class="js-prevent-sideclick">{%- include "search-btn" -%}</div>{%- endif -%}
      </div>

      {%- include "menu-main", _semimodalMenu: true -%}
    </div>
  </header>
</div>
