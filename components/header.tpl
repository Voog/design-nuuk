
{% include "site-search" %}
{% include 'header-fixed' %}

{%- include 'image_src_variable', _data: site.data.semimodal_image, _targetWidth: "1000" -%}
<div class="
  semimodal js-prevent-sideclick
  {% if isSemimodalBorder %} semimodal-border{% endif %}
  {% if site.data.semimodal_settings.is_top_menu == true %} hidden-desktop{% endif %}
  "
>
  {%- assign imageClass = "image_fit-cover semimodal_bg-image image_abs" -%}
  {%- include "lazy-image", _data: site.data.semimodal_image, _targetWidth: '600', _className: imageClass -%}
  <div class="semimodal_bg-color bg_color-absolute"
      {%- if site.data.semimodal_image.color != blank -%}
        style="background-color: {{ site.data.semimodal_image.color }};"
    {%- endif -%}
  ></div>

  <header class="header_wrapper">
    {%- if editmode -%}
      <div class="semimodal_picker-btn js-prevent-sideclick hidden-mobile">
        <button class="bg-picker" data-type="img" data-entity="siteData" data-picture="true" data-color="true" data-image_elem=".semimodal_bg-image" data-color_elem=".semimodal_bg-color" data-name="semimodal_image" data-bg="{{ site.data.semimodal_image | json | escape }}"></button>
      </div>
    {%- endif -%}
    <div class="header_bottom">
      {%- include "menu-main" -%}
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
              "title": "Use top menu",
              "type": "checkbox",
              "key": "is_top_menu",
              "states": {
                "on": true,
                "off": false
              }
            },
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
          entityData: 'siteData',
          noReload: true,
          prevFunc: function(data) {
            if (data.is_top_menu == true) {
              $('.js-menu-btn, .semimodal').addClass('hidden-desktop');
              $('.js-menu-main-wrapper').addClass('hidden-mobile');
              $('.js-menu-main-wrapper').removeClass('hidden-desktop');
              $('.js-menu-main').addClass('menu_top');
              $('.js-menu-popover, .js-menu-popover').removeClass('d-none');
              $('.js-menu-sub').addClass('d-none');
            } else {
              $('.js-menu-btn, .semimodal').removeClass('hidden-desktop');
              $('.js-menu-main-wrapper').removeClass('hidden-mobile');
              $('.js-menu-main-wrapper').addClass('hidden-desktop');
              $('.js-menu-main').removeClass('menu_top');
              $('.js-menu-popover, .js-menu-popover').addClass('d-none');
              $('.js-menu-sub').removeClass('d-none');
            }

            if (data.is_relative_position == true) {
              $('.js-semimodal-toggle').addClass('semimodal-relative');
              $('.js-semimodal-toggle').removeClass('semimodal-open-state');
            }

            if (data.is_open == true) {
              $('.js-semimodal-toggle').addClass('semimodal-open-state semimodal-relative');
            }

            if (data.is_relative_position == false && data.is_open == false) {
              $('.js-semimodal-toggle').removeClass('semimodal-relative');
              $('.js-semimodal-toggle').addClass('semimodal-open-state');
            }

            if (data.is_open == false && data.is_relative_position == false) {
              $('.js-semimodal-toggle').removeClass('semimodal-open-state semimodal-relative');
            }

            if (data.is_border == true) {
              $('.semimodal').addClass('semimodal-border');
            } else {
              $('.semimodal').removeClass('semimodal-border');
            }
          }
        }
      );
    });
  {%- endif -%}
</script>
