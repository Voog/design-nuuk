
{% include "site-search" %}
{% include 'header-fixed' %}
{%- assign semimodalSettings = site.data.menu_settings -%}
{%- if semimodalSettings.max_width >= 1 -%}
  <style>
    body.semimodal-open:not(.semimodal-relative) .semimodal,
    body .semimodal_inner,
    body.semimodal-open .semimodal,
    body.semimodal-open-state .semimodal {
      min-width: {{semimodalSettings.max_width}}px;
      max-width: {{semimodalSettings.max_width}}px;
    }
  </style>
{%- endif -%}

{%- include 'image_src_variable', _data: site.data.semimodal_image, _targetWidth: "1000" -%}
<div class="
  semimodal js-prevent-sideclick
  {% if isSemimodalBorder %} semimodal-border{% endif %}
  {% if semimodalSettings.positioning == 'is_top' or semimodalSettings.positioning == 'is_top_fixed' %} hidden-desktop{% endif %}
  "
>
  {%- assign imageClass = "image_fit-cover semimodal_bg-image image_abs" -%}
  {%- include "lazy-image", _data: site.data.semimodal_image, _targetWidth: '600', _className: imageClass -%}
  <div class="semimodal_bg-color bg_color-absolute"
    {%- if site.data.semimodal_image.color != blank -%}
      style="background-color: {{ site.data.semimodal_image.color }};"
    {%- endif -%}
  ></div>

  <header class="semimodal_inner">
    {%- if editmode -%}
      <div class="semimodal_picker-btn js-prevent-sideclick hidden-mobile">
        <button class="bg-picker" data-type="img" data-entity="siteData" data-picture="true" data-color="true" data-image_elem=".semimodal_bg-image" data-color_elem=".semimodal_bg-color" data-name="semimodal_image" data-bg="{{ site.data.semimodal_image | json | escape }}"></button>
      </div>
    {%- endif -%}
    <div class="semimodal_bottom">
      {%- include "menu-main" -%}
      <div class="mar_t-32 content-body content-formatted">
        {% xcontent name="header-inner-content" %}
      </div>
    </div>

  </header>
</div>
