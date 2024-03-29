{%- assign menuSettings = site.data[menuSettingsKey] -%}
{%- assign menuSettingsDefault = template_settings.site.menu_settings.value -%}
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
        valuesObj.max_width = {{ menuSettingsDefault.max_width }};
      }

      if (!('indicator' in valuesObj)) {
        valuesObj.indicator = '{{ menuSettingsDefault.indicator }}';
      }

      if (!('positioning' in valuesObj)) {
        valuesObj.positioning = '{{ menuSettingsDefault.positioning }}';
      }

      if (!('is_product_page_visible' in valuesObj)) {
        valuesObj.is_product_page_visible = {{ menuSettingsDefault.is_product_page_visible }};
      }

      if (!('is_product_list_page_visible' in valuesObj)) {
        valuesObj.is_product_list_page_visible = true;
      }

      if (!('max_elements' in valuesObj)) {
        valuesObj.max_elements = {{ menuSettingsDefault.max_elements }};
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
            {
              "title": {{ "active_page_indicator" | lce | json }},
              "type": "radio",
              "key": "indicator",
              "list": [
                {
                  "title": {{ "square" | lce | json }},
                  "value": "square"
                },
                {
                  "title": {{ "stripe" | lce | json }},
                  "value": "stripe"
                }
              ],
              "class": "menu-indicator-opt"
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
              "title": {{ "max_no_of_menu_pages" | lce | json }},
              "type": "number",
              "key": "max_elements",
              "placeholder": {{ "max_no_of_menu_pages" | lce | json }},
              "step": 1,
              "min": 1,
              "max": 10,
              "class": "menu-elements-opt"
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
          dataKey: '{{ menuSettingsKey }}',
          values: valuesObj,
          entityData: 'siteData',
          noReload: true,
          containerClass: ['bottom-settings-popover', 'second', 'editor_default'],
          prevFunc: function(data) {
            if (data.positioning === 'is_top' || data.positioning === 'is_top_fixed') {
              $('.js-menu-btn, .semimodal').addClass('hidden-desktop');
              $('.js-menu-main-wrapper').addClass('hidden-tablet');
              $('.js-menu-main').addClass('menu_top');
              $('li[data-arrow="active"], li[data-arrow="inactive"]').addClass('dd-arrow');
              $('.menu-indicator-opt').addClass('d-none');

              $('.js-menu-main-wrapper').removeClass('hidden-desktop');
              $('.js-menu-popover, .js-menu-popover').removeClass('d-none');
              $('html').removeClass('semimodal-open');
              $('.header_fixed_picker-btn').removeClass('d-none');
              $('.menu-elements-opt').removeClass('d-none');
            } else {
              $('.js-menu-main-wrapper').addClass('hidden-tablet');
              $('.js-menu-main-wrapper').addClass('hidden-desktop');
              $('.js-menu-popover, .js-menu-popover').addClass('d-none');
              $('.header_fixed_picker-btn').addClass('d-none');
              $('.menu-elements-opt').addClass('d-none');

              $('.dd-arrow').data('arrow', 'inactive');

              $('.js-menu-btn, .semimodal').removeClass('hidden-desktop');
              $('.js-menu-main').removeClass('menu_top');
              $('li.dd-arrow, div.dd-arrow').removeClass('dd-arrow');
              $('.menu-indicator-opt').removeClass('d-none');
            }

            if (data.positioning === 'is_side_always_open') {
              $('.header_fixed .semimodal-bg_color').addClass('hidden-desktop');
            } else {
              $('.header_fixed .semimodal-bg_color').removeClass('hidden-desktop');
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
              $.each($('.dd-arrow'), function () {
                let popoverDiv = $(this).children()[1];
                if ($(popoverDiv).find('.menu').children(':visible').length === 0) {
                  $(this).attr('data-arrow', 'inactive');
                } else {
                  $(this).attr('data-arrow', 'active');
                }
              })
              if ($('.menu_popover-list').children(':visible').length == 0) {
                $('.menu_popover-list').css('padding', '0');
              } else {
                $('.menu_popover-list').css('padding', '16px 0');
              }
            }

            if (data.is_product_page_visible == true) {
              replaceElementTag('.menu-item-product', '<li></li>');
              $('.menu-item-product').attr('data-visible', true);
              checkIfDropdownEmpty();
            } else {
              replaceElementTag('.menu-item-product', '<div></div>');
              $('.menu-item-product').attr('data-visible', false);
              checkIfDropdownEmpty();
            }

            if (data.is_product_list_page_visible == true) {
              replaceElementTag('.menu-item-product-list', '<li></li>');
              $('.menu-item-product-list').attr('data-visible', true);
              checkIfDropdownEmpty();
            } else {
              replaceElementTag('.menu-item-product-list', '<div></div>');
              $('.menu-item-product-list').attr('data-visible', false);
              checkIfDropdownEmpty();
            }

            if (data.positioning === 'is_side_absolute' || data.positioning === 'is_side_always_open') {
              if (data.indicator === 'stripe') {
                $('.menu-main:not(.menu_top) .menu .menu-item').removeClass('square');
                $('.menu-main:not(.menu_top) .menu .menu-item').addClass('stripe');
              } else {
                $('.menu-main:not(.menu_top) .menu .menu-item').removeClass('stripe');
                $('.menu-main:not(.menu_top) .menu .menu-item').addClass('square');
              }
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
              var otherElements = data.max_elements + 1;
              if (data.max_elements > 1) {
                $('.semimodal_bottom .menu .menu-item.lvl-1:nth-of-type(n+' + data.max_elements + 1 + ')').clone().appendTo('.menu_popover-list');
              }

              $('.menu-main .menu .menu-item').removeClass('top-menu-element');
              $('.menu-main .menu .menu-item:nth-of-type(-n+' + data.max_elements + ')').addClass('top-menu-element');

              if (menuCount <= data.max_elements) {
                $('.js-menu-popover-btn').addClass('d-none');
              } else {
                $('.js-menu-popover-btn').removeClass('d-none');
              }
            }
          }
        }
      );
      {%- if menuSettings.positioning == 'is_top_fixed' or menuSettings.positioning == 'is_top' -%}
        $('.menu-indicator-opt').addClass('d-none');
      {%- else -%}
        $('.menu-elements-opt').addClass('d-none');
      {%- endif -%}
    });

  {%- endif -%}
</script>
