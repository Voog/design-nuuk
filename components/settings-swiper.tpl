{% include 'settings-editor-button',
  _titleKey: "front_page_header",
  _descriptionKey: "change_slider_settings",
  _className: "js-swiper-settings-btn",
  _wrapClassName: "content_settings-btn"
%}

<script>
  window.addEventListener('DOMContentLoaded', function(event) {
    {% if page.data[swiperSettingsKey] %}
      var valuesObj = {{ page.data[swiperSettingsKey] | json }};
    {% else %}
      var valuesObj = {};
    {% endif %}

    if (!('slides_count' in valuesObj)) {
      valuesObj.slides_count = {{template_settings.page.swiper_settings.value.slides_count}};
    }

    if (!('autoplay_interval' in valuesObj)) {
      valuesObj.autoplay_interval = {{template_settings.page.swiper_settings.value.autoplay_interval}};
    }

    if (!('content_position' in valuesObj)) {
      valuesObj.content_position = "{{template_settings.page.swiper_settings.value.content_position}}";
    }

    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-swiper-settings-btn'),
        menuItems: [
          {
            "title": {{ "no_of_slides" | lce | json }},
            "type": "number",
            "key": "slides_count",
            "placeholder": {{ "no_of_slides" | lce | json }},
            "step": 1,
            "min": 1
          },
          {
            "title": {{ "content_position" | lce | json }},
            "type": "radio",
            "key": "content_position",
            "list": [
                {
                  "title": {{ "center" | lce | json }},
                  "value": "center"
                },
                {
                  "title": {{ "bottom_left" | lce | json }},
                  "value": "b_left"
                },
                {
                  "title": {{ "bottom_right" | lce | json }},
                  "value": "b_right"
                }
              ]
          },
          {
            "title": {{ "use_different_titles_on_slides" | lce | json }},
            "type": "checkbox",
            "key": "is_content_by_slide",
            "states": {
              "on": true,
              "off": false
            },
            "class": [
              'swiper-settings-opt'
            ]
          },
          {
            "title": {{ "use_fade_effect_on_changing_slides" | lce | json }},
            "type": "checkbox",
            "key": "is_fade_effect",
            "states": {
              "on": true,
              "off": false
            },
            "class": [
              'swiper-settings-opt'
            ]
          },
          {
            "title": {{ "use_autoplay_for_changing_slides" | lce | json }},
            "type": "checkbox",
            "key": "is_autoplay",
            "states": {
              "on": true,
              "off": false
            },
            "class": [
              'swiper-settings-opt'
            ]
          },
          {%- assign autoplayIntTr = "autoplay_interval" | lce -%}
          {%- assign pxTr = "units.ms" | lce -%}
          {%- assign autoplayIntCombinedTr = autoplayIntTr | append: ' (' | append: pxTr | append: ')' -%}
          {
            "title": {{ autoplayIntCombinedTr | json }},
            "type": "number",
            "key": "autoplay_interval",
            "step": 1,
            "min": 1,
            "class": [
              'swiper-settings-opt-interval'
            ]
          },
          {
            "title": {{ "use_arrows_in_live_view" | lce | json }},
            "type": "checkbox",
            "key": "are_navigation_arrows",
            "states": {
              "on": true,
              "off": false
            },
            "class": [
              'swiper-settings-opt'
            ]
          },
          {
            "title": {{ "use_navigation_bullets" | lce | json }},
            "type": "checkbox",
            "key": "are_navigation_bullets",
            "states": {
              "on": true,
              "off": false
            },
            "class": [
              'swiper-settings-opt'
            ]
          }

        ],
        dataKey: '{{swiperSettingsKey}}',
        values: valuesObj,
        containerClass: ['bottom-settings-popover', 'third', 'editor_default'],
        prevFunc: function(data) {
          if (data.slides_count > 1) {
            $('.swiper-settings-opt').show();
          } else {
            $('.swiper-settings-opt').hide();
          }

          if (data.is_autoplay == true && data.slides_count > 1) {
            $('.swiper-settings-opt-interval').show();
          } else {
            $('.swiper-settings-opt-interval').hide();
          }

          if (data.content_position === 'b_left') {
            $('.swiper-content').removeClass('swiper-content-b_right swiper-content-center');
            $('.swiper-content').addClass('swiper-content-b_left');
          } else if (data.content_position === 'b_right') {
            $('.swiper-content').removeClass('swiper-content-b_left swiper-content-center');
            $('.swiper-content').addClass('swiper-content-b_right');
          } else {
            $('.swiper-content').removeClass('swiper-content-b_left swiper-content-b_right');
            $('.swiper-content').addClass('swiper-content-center');
          }
        }
      }
    );

    {%- if page.data[swiperSettingsKey].is_autoplay != true -%}
      $('.swiper-settings-opt-interval').hide();
    {%- endif -%}

    {%- if page.data[swiperSettingsKey].slides_count == blank or page.data[swiperSettingsKey].slides_count < 2 -%}
      $('.swiper-settings-opt').hide();
      $('.swiper-settings-opt-interval').hide();
    {%- endif -%}
  });
</script>
