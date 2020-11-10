
{% include "site-search" %}
<div class="header_fixed">
  <button class="menu-btn js-menu-btn js-prevent-sideclick">
    <span class="menu-stripe"></span>
    <span class="menu-stripe"></span>
  </button>
  <div class="header_title content-formatted">
    {%- unless editmode -%}
      <a href="{{ site.root_item.url }}">
    {%- endunless -%}
      {%- editable site.header -%}
    {%- unless editmode -%}
      </a>
    {%- endunless -%}
  </div>
  <div class="header_components">
    {%- if site.search.enabled -%}{%- include "search" -%}{%- endif -%}
    {%- if editmode or site.has_many_languages? -%}
      <nav class="menu-lang">
        {%- include "menu-lang" -%}
      </nav>
    {%- endif -%}
  </div>
</div>

{%- include 'image_src_variable', _data: site.data.semimodal_image, _targetWidth: "1000" -%}
<div class="semimodal js-prevent-sideclick{% if isSemimodalBorder %} semimodal-border{% endif %}">
  {%- assign imageClass = "image_fit-cover semimodal_bg-image image_abs" -%}
  {%- include "lazy-image", _data: site.data.semimodal_image, _targetWidth: '600', _className: imageClass -%}

  {%- if editmode -%}
    <div class="semimodal_settings-btn">
      <button disabled class="js-semimodal-settings-btn">Semimodal settings</button>
    </div>
  {%- endif -%}

  <div class="semimodal_bg-color bg_color-absolute"
    {%- if site.data.semimodal_image.color != blank -%}
      style="background-color: {{ site.data.semimodal_image.color }};"
    {%- endif -%}
  ></div>
  {%- if editmode -%}
    <div class="semimodal_picker-btn">
      <button class="bg-picker" data-type="img" data-entity="siteData" data-picture="true" data-color="true" data-image_elem=".semimodal_bg-image" data-color_elem=".semimodal_bg-color" data-name="semimodal_image" data-bg="{{ site.data.semimodal_image | json | escape }}"></button>
    </div>
  {%- endif -%}
  <header class="header_wrapper">
    <div class="header_bottom">
      <nav class="menu-main js-menu-main js-popover js-prevent-sideclick">
        {%- include "menu-level-1" -%}
      </nav>
    </div>
  </header>
</div>

<script>
  {%- if editmode -%}
    window.addEventListener('DOMContentLoaded', (event) => {
      {%- if site.data.semimodal_settings -%}
        var valuesObj = {{ site.data.semimodal_settings | json }};
      {%- else -%}
        var valuesObj = {};
      {%- endif -%}


      initSettingsEditor(
        {
          settingsBtn: document.querySelector('.js-semimodal-settings-btn'),
          menuItems: [
            {
              "title": "Use ralative position for semimodal",
              "type": "checkbox",
              "key": "is_relative_position",
              "states": {
                "on": true,
                "off": false
              }
            },
            {
              "title": "Semimodal always open",
              "type": "checkbox",
              "key": "is_open",
              "states": {
                "on": true,
                "off": false
              }
            },
            {
              "title": "Use border instead of shadow",
              "type": "checkbox",
              "key": "is_border",
              "states": {
                "on": true,
                "off": false
              }
            }
          ],
          dataKey: 'semimodal_settings',
          values: valuesObj,
          entityData: 'siteData'
        }
      );
    });
  {%- endif -%}
</script>
