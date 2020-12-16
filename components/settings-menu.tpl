{%- assign semimodalSettings = site.data.menu_settings -%}

<script>
  {%- if editmode -%}
    window.addEventListener('DOMContentLoaded', (event) => {
      {%- if semimodalSettings -%}
        var valuesObj = {{ semimodalSettings | json }};
      {%- else -%}
        var valuesObj = {};
      {%- endif -%}

      if (!('max_width' in valuesObj)) {
        valuesObj.max_width = 320;
      }

      if (!('positioning' in valuesObj)) {
        valuesObj.positioning = 'is_side_absolute';
      }

      initSettingsEditor(
        {
          settingsBtn: document.querySelector('.js-semimodal-settings-btn'),
          menuItems: [
            {
              "title": "Menu alignment",
              "type": "radio",
              "key": "positioning",
              "list": [
                {
                  "title": "Top - always visible",
                  "value": "is_top"
                },
                {
                  "title": "Top - fixed in header",
                  "value": "is_top_fixed"
                },
                {
                  "title": "Side - always visible",
                  "value": "is_side_always_open"
                },
                {
                  "title": "Side - opens on click",
                  "value": "is_side_absolute"
                }
              ]
            },
            {
              "title": "Max semimodal width in px",
              "type": "number",
              "min": 1,
              "key": "max_width",
              "placeholder": "Max semimodal width in px"
            },
          ],
          dataKey: 'menu_settings',
          values: valuesObj,
          entityData: 'siteData',
          noReload: true,
          prevFunc: function(data) {
            if (data.positioning === 'is_top' || data.positioning === 'is_top_fixed') {
              $('.js-menu-btn, .semimodal').addClass('hidden-desktop');
              $('.js-menu-main-wrapper').addClass('hidden-mobile');
              $('.js-menu-main-wrapper').removeClass('hidden-desktop');
              $('.js-menu-main').addClass('menu_top');
              $('.js-menu-popover, .js-menu-popover').removeClass('d-none');
              $('.js-menu-sub').addClass('d-none');
            } else {
              $('.js-menu-btn, .semimodal').removeClass('hidden-desktop');
              $('.js-menu-main-wrapper').addClass('hidden-mobile');
              $('.js-menu-main-wrapper').addClass('hidden-desktop');
              $('.js-menu-main').removeClass('menu_top');
              $('.js-menu-popover, .js-menu-popover').addClass('d-none');
              $('.js-menu-sub').removeClass('d-none');
            }

            if (data.positioning === 'is_top') {
              $('.header_fixed').removeClass('p-abs');
            } else if (data.positioning === 'is_top_fixed') {
              $('.header_fixed').addClass('p-abs');
            }

            if (data.positioning === 'is_side_always_open') {
              $('.js-semimodal-toggle').addClass('semimodal-open-state semimodal-relative');
            } else {
              $('.js-semimodal-toggle').removeClass('semimodal-open-state semimodal-relative');
              $('.js-semimodal-toggle').removeClass('semimodal-relative');
              $('.js-semimodal-toggle').addClass('semimodal-open');
            }

            if (data.positioning === 'is_side_absolute') {
              $('.semimodal').removeClass('semimodal-border');
            } else {
              $('.semimodal').addClass('semimodal-border');
            }
            {%- if semimodalSettings.max_width != blank -%}
              if (data.max_width >= 1 && data.max_width != {{semimodalSettings.max_width}}) {
                $('.semimodal-open:not(.semimodal-relative) .semimodal,.semimodal_inner,.semimodal-open .semimodal,.semimodal-open-state .semimodal').css(
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