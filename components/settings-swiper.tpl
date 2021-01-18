<div class="content_settings-btn js-prevent-sideclick layout_settings-btn">
  <button disabled class="js-swiper-settings-btn js-settings-editor-btn">
    <div class="p14 bold">Front page header</div><div class="p14 grey">Change slider settings</div>
  </button>
</div>

<script>
  window.addEventListener('DOMContentLoaded', (event) => {
    {% if page.data[swiperSettingsKey] %}
      var valuesObj = {{ page.data[swiperSettingsKey] | json }};
    {% else %}
      var valuesObj = {};
    {% endif %}

    if (!('is_content_by_slide' in valuesObj)) {
      valuesObj.is_content_by_slide = false;
    }

    if (!('is_fade_effect' in valuesObj)) {
      valuesObj.is_fade_effect = false;
    }

    if (!('slides_count' in valuesObj)) {
      valuesObj.slides_count = 1;
    }

    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-swiper-settings-btn'),
        menuItems: [
          {
            "title": "Number of header images",
            "type": "number",
            "key": "slides_count",
            "placeholder": "Number of header images",
            "step": 1,
            "min": 1
          },
          {
            "title": "Different title on every slide",
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
            "title": "Use fade effect on changing slides",
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
            "title": "Use autoplay for changing slides",
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
          {
            "title": "Autoplay interval (in ms)",
            "type": "number",
            "key": "autoplay_interval",
            "placeholder": "Number of header images",
            "step": 1,
            "min": 1,
            "class": [
              'swiper-settings-opt-interval'
            ]
          },
          {
            "title": "Use fade effect on changing slides",
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
            "title": "Use right & left arrows in live view",
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
            "title": "Use navigation bullets",
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
        containerClass: ['bottom-settings-popover', 'first', 'editor_default'],
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
        }
      }
    );

    {%- if page.data[swiperSettingsKey].is_autoplay != true -%}
      $('.swiper-settings-opt-interval').hide();
    {%- endif -%}

    {%- if page.data[swiperSettingsKey].slides_count <= 1 -%}
      $('.swiper-settings-opt').hide();
    {%- endif -%}
  });
</script>