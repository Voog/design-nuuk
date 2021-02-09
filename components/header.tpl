
{% include "site-search" %}
{% include 'header-fixed' %}

{%- assign menuSettings = site.data[menuSettingsKey] -%}

{%- if menuSettings.max_width >= 1 -%}
  <style>
    @media screen and (min-width: 901px) {
      html.semimodal-open:not(.semimodal-relative) .semimodal,
      html.semimodal-relative .semimodal {
        min-width: {{menuSettings.max_width}}px;
        max-width: {{menuSettings.max_width}}px;
      }

      .semimodal-relative body {
        padding-left: {{menuSettings.max_width}}px;
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
    <button class="menu-btn js-menu-btn js-prevent-sideclick{% if menuTop == true %} hidden-desktop{% endif %}">
      <div>
        <span class="menu-stripe"></span>
        <span class="menu-stripe"></span>
      </div>
      <label>{{ 'menu' | lc }}</label>
    </button>

    <div class="site_title content-formatted">
      {% contentblock name="site_title" xpage="true"  publish_default_content="true" %}
        {{site.header}}
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

      {%- include "menu-main", _semimodalMenu: true -%}
      {%- comment -%}
        <div class="content-formatted semimodal_bottom-content">
          {% content name="menu_bottom" xpage="true" %}
        </div>
      {%- endcomment -%}
    </div>
  </header>
</div>
