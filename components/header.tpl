
{%- assign menuSettings = site.data[menuSettingsKey] -%}
{%- assign menuPos = menuSettings.positioning -%}
{%- if menuPos == 'is_top' or menuPos == 'is_top_fixed' -%}
  {%- assign menuTop = true -%}
{%- else -%}
  {%- assign menuTop = false -%}
{%- endif -%}

{%- if menuSettings.indicator -%}
  {%- assign indicatorStyle = menuSettings.indicator -%}
{%- else -%}
  {%- assign indicatorStyle = template_settings.site.menu_settings.value.indicator -%}
{%- endif -%}

{%- include 'menu-main-iteration', _indicatorStyle: indicatorStyle -%}
{%- include "site-search" %}
{% include 'header-fixed', _menuTop: menuTop, _menuPos: menuPos, _indicatorStyle: indicatorStyle -%}
{% include 'cart-popover' %}

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

<div class="semimodal js-prevent-sideclick {%- if menuTop == true %} hidden-desktop{% endif -%}">
  {%- assign imageClass = "image_fit-cover image_abs semimodal-bg_image" -%}
  {%- include "lazy-image", _data: semimodal_bg, _className: imageClass -%}

  <div class="semimodal-bg_color bg_color-absolute"
    {%- if semimodal_bg.color != blank %}
      style="background-color: {{ semimodal_bg.color }};"
    {%- endif -%}
  ></div>

  <header class="semimodal_inner semimodal-bg_picker--area {{ semimodal_bg_type }}">
    <div class="flex_box">
      <button class="menu-btn js-menu-btn js-prevent-sideclick{% if menuTop == true %} hidden-desktop{% endif %}">
        <div>
          <span class="menu-stripe"></span>
          <span class="menu-stripe"></span>
        </div>
        <label>{{ 'menu' | lc }}</label>
      </button>

      {%- if show_language_menu_popover -%}
        <div class="header_components-semimodal"></div>
      {%- endif -%}
    </div>

    <div class="site_title content-formatted">
      {%- if menuSettings.positioning ==  "is_side_always_open" -%}
        {% assign isReadOnly = false %}
      {%- else -%}
        {% assign isReadOnly = true %}
      {%- endif -%}
      {% contentblock name="site_title" xpage="true"  publish_default_content="true" readonly=isReadOnly %}
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

      {%- include "menu-main", _renderSemimodalMenu: true, _indicatorStyle: indicatorStyle -%}
    </div>
  </header>
</div>
