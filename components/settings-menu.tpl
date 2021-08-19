{%- assign menuSettings = site.data[menuSettingsKey] -%}
{% include 'settings-editor-button',
  _titleKey: "navigation",
  _descriptionKey: "change_menu_settings",
  _className: "js-menu-settings-btn",
  _wrapClassName: "menu_settings-btn"
%}

<script>
  {%- if editmode -%}
    window.addEventListener('DOMContentLoaded', function(event) {
      {%- if menuSettings -%}
        var valuesObj = {{ menuSettings | json }};
      {%- else -%}
        var valuesObj = {};
      {%- endif -%}

      if (!('max_width' in valuesObj)) {
        valuesObj.max_width = 270;
      }

      if (!('positioning' in valuesObj)) {
        valuesObj.positioning = 'is_side_absolute';
      }

      if (!('is_product_page_visible' in valuesObj)) {
        valuesObj.is_product_page_visible = true;
      }

      if (!('is_product_list_page_visible' in valuesObj)) {
        valuesObj.is_product_list_page_visible = true;
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
              "titleI18n": {{ "show_product_pages_in_menu" | lce | json }},
              "type": "checkbox",
              "key": "is_product_page_visible",
              "states": {
                "on": true,
                "off": false
              },
            },
            {
              "titleI18n": {{ "show_product_list_pages_in_menu" | lce | json }},
              "type": "checkbox",
              "key": "is_product_list_page_visible",
              "states": {
                "on": true,
                "off": false
              },
            }
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
              $('html').removeClass('semimodal-open');
              $('li[data-arrow="active"], li[data-arrow="inactive"]').addClass('dd-arrow');
            } else {
              $('.js-menu-btn, .semimodal').removeClass('hidden-desktop');
              $('.js-menu-main-wrapper').addClass('hidden-tablet');
              $('.js-menu-main-wrapper').addClass('hidden-desktop');
              $('.js-menu-main').removeClass('menu_top');
              $('.js-menu-popover, .js-menu-popover').addClass('d-none');
              $('.dd-arrow').data('arrow', 'inactive');
              $('li.dd-arrow, div.dd-arrow').removeClass('dd-arrow');
            }

            if (data.positioning === 'is_top') {
              $('.header_fixed').removeClass('relative');
              $('.header_fixed').addClass('menu-top');
            } else if (data.positioning === 'is_top_fixed') {
              $('.header_fixed').addClass('menu-top');
              $('.header_fixed').addClass('relative');
            }

            if (data.positioning === 'is_side_always_open') {
              $('.header_fixed').removeClass('menu-top');
              $('.header_fixed').removeClass('relative');
              $('.js-semimodal-toggle').addClass('semimodal-relative');
              $('.js-semimodal-toggle').addClass('semimodal-open');
            } else {
              $('.js-semimodal-toggle').removeClass('semimodal-relative');
              $('.js-semimodal-toggle').removeClass('semimodal-relative');
            }

            if (data.positioning === 'is_side_absolute') {
              $('.header_fixed').removeClass('menu-top');
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

            //Used for css nth-of-type() selector
            function replaceElementTag(targetSelector, newTagString) {
              $(targetSelector).each(function(){
                var newElem = $(newTagString, {html: $(this).html()});
                $.each(this.attributes, function() {
                  newElem.attr(this.name, this.value);
                });
                $(this).replaceWith(newElem);
              });
            }


            function checkIfDropdownEmpty() {
              $.each($('.dd-arrow'), function() {
                let popoverDiv = $(this).children()[1];
                if ($(popoverDiv).find('.menu').children(':visible').length === 0) {
                  $(this).attr('data-arrow', 'inactive');
                } else {
                  $(this).attr('data-arrow', 'active');
                }
              })
            }

            if (data.is_product_page_visible == true) {
              replaceElementTag('.menu-item-product', '<li></li>');
              $('.menu-item-product').attr('data-visible', true);
              checkIfDropdownEmpty()
            } else {
              replaceElementTag('.menu-item-product', '<div></div>');
              $('.menu-item-product').attr('data-visible', false);
              checkIfDropdownEmpty()
            }

            if (data.is_product_list_page_visible == true) {
              replaceElementTag('.menu-item-product-list', '<li></li>');
              $('.menu-item-product-list').attr('data-visible', true);
              checkIfDropdownEmpty()
            } else {
              replaceElementTag('.menu-item-product-list', '<div></div>');
              $('.menu-item-product-list').attr('data-visible', false);
              checkIfDropdownEmpty()
            }

            {%- if menuSettings.max_width != blank -%}
              if (data.max_width >= 1 && data.max_width != {{menuSettings.max_width}}) {
                $('.semimodal-open:not(.semimodal-relative) .semimodal,.semimodal_inner,.semimodal-relative .semimodal').css(
                  {'max-width': data.max_width + 'px', 'min-width': data.max_width + 'px'}
                );
              }
            {%- endif -%}

            var menuCount = $('.js-menu-popover-btn').data('count');

            if (data.positioning === 'is_top' || data.positioning === 'is_top_fixed') {
              if (menuCount <= 5) {
                $('.js-menu-popover-btn').addClass('d-none');
              } else {
                $('.js-menu-popover-btn').removeClass('d-none');
              }
            }
          }
        }
      );
    });
  {%- endif -%}
</script>
