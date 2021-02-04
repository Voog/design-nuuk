{%- assign menuSettings = site.data[menuSettingsKey] -%}

<div class="menu_settings-btn layout_settings-btn js-prevent-sideclick">
  <button disabled class="js-menu-settings-btn js-settings-editor-btn">
    <div class="bold">{{ "navigation" | lce }}</div>
    <div class="grey">{{ "change_menu_settings" | lce }}</div>
  </button>
</div>
<script>
  {%- if editmode -%}
    window.addEventListener('DOMContentLoaded', function(event) {
      {%- if menuSettings -%}
        var valuesObj = {{ menuSettings | json }};
      {%- else -%}
        var valuesObj = {};
      {%- endif -%}

      if (!('max_width' in valuesObj)) {
        valuesObj.max_width = 320;
      }

      if (!('positioning' in valuesObj)) {
        valuesObj.positioning = 'is_side_absolute';
      }

      {%- assign sideMenuTr = value -%}

      initSettingsEditor(
        {
          settingsBtn: document.querySelector('.js-menu-settings-btn'),
          menuItems: [
            {
              "title": {{ "menu_alignment" | lce | json }},
              "type": "radio",
              "key": "positioning",
              "list": [
                {
                  "title": {{ "top_always_visible" | lce | json }},
                  "value": "is_top"
                },
                {
                  "title": {{ "top_fixed_header" | lce | json }},
                  "value": "is_top_fixed"
                },
                {
                  "title": {{ "side_always_open" | lce | json }},
                  "value": "is_side_always_open"
                },
                {
                  "title": {{ "side_opens_on_click" | lce | json }},
                  "value": "is_side_absolute"
                }
              ]
            },
            {%- assign sideMenuWidthTr = "side_menu_width" | lce -%}
            {%- assign pxTr = "units.px" | lce -%}
            {%- assign sideMenuCombinedTr = sideMenuWidthTr | append: ' (' | append: pxTr | append: ')' -%}
            {
              "title": {{ sideMenuCombinedTr | json }},
              "type": "number",
              "min": 1,
              "key": "max_width",
              "placeholder": {{ sideMenuCombinedTr | json }}
            },
            {
              "titleI18n": {{ "hide_product_pages_in_menu" | lce | json }},
              "type": "toggle",
              "key": "product_page_hidden",
              "states": {
                "on": true,
                "off": false
              },
            },
          ],
          dataKey: '{{menuSettingsKey}}',
          values: valuesObj,
          entityData: 'siteData',
          noReload: true,
          containerClass: ['bottom-settings-popover', 'second', 'editor_default'],
          prevFunc: function(data) {
            if (data.positioning === 'is_top' || data.positioning === 'is_top_fixed') {
              $('.js-menu-btn, .semimodal').addClass('hidden-desktop');
              $('.js-menu-main-wrapper').addClass('hidden-tablet');
              $('.js-menu-main-wrapper').removeClass('hidden-desktop');
              $('.js-menu-main').addClass('menu_top');
              $('.js-menu-popover, .js-menu-popover').removeClass('d-none');
              $('.js-menu-sub').addClass('d-none');
              $('html').removeClass('semimodal-open');
            } else {
              $('.js-menu-btn, .semimodal').removeClass('hidden-desktop');
              $('.js-menu-main-wrapper').addClass('hidden-tablet');
              $('.js-menu-main-wrapper').addClass('hidden-desktop');
              $('.js-menu-main').removeClass('menu_top');
              $('.js-menu-popover, .js-menu-popover').addClass('d-none');
              $('.js-menu-sub').removeClass('d-none');
            }

            if (data.positioning === 'is_top') {
              $('.header_fixed').removeClass('relative');
              $('.js-menu-popover-btn').removeClass('d-none');
            } else if (data.positioning === 'is_top_fixed') {
              $('.header_fixed').addClass('relative');
              $('.js-menu-popover-btn').removeClass('d-none');
            }

            if (data.positioning === 'is_side_always_open') {
              $('.header_fixed').removeClass('relative');
              $('.js-semimodal-toggle').addClass('semimodal-relative');
              $('.js-semimodal-toggle').addClass('semimodal-open');
            } else {
              $('.js-semimodal-toggle').removeClass('semimodal-relative');
              $('.js-semimodal-toggle').removeClass('semimodal-relative');
            }

            if (data.positioning === 'is_side_absolute') {
              $('.header_fixed').removeClass('relative');
              $('.js-semimodal-toggle').addClass('semimodal-absolute');
              $('.js-semimodal-toggle').addClass('semimodal-open');
            } else {
              $('.js-semimodal-toggle').removeClass('semimodal-absolute');
            }

            if ($( window ).width() >= 900) {
              var topPos = $('.header_fixed').height() + 80;

              if ($('.semimodal-relative').length <= 0) {
                $('.semimodal_bottom').css({'top': topPos, 'margin-top': topPos});
              }
            }

            if (data.product_page_hidden == true) {
              $('.menu-item-product').addClass('hidden');
            } else {
              $('.menu-item-product').removeClass('hidden');
            }

            {%- if menuSettings.max_width != blank -%}
              if (data.max_width >= 1 && data.max_width != {{menuSettings.max_width}}) {
                $('.semimodal-open:not(.semimodal-relative) .semimodal,.semimodal_inner,.semimodal-relative .semimodal').css(
                  {'max-width': data.max_width + 'px', 'min-width': data.max_width + 'px'}
                );
              }
            {%- endif -%}
          }
        }
      );
    });
  {%- endif -%}
</script>