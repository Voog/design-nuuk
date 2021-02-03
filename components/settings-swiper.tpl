<div class="content_settings-btn js-prevent-sideclick layout_settings-btn">
  <button disabled class="js-swiper-settings-btn js-settings-editor-btn">
    <div class="bold">{{ "front_page_header" | lce | escape_once }}</div>
    <div class="grey">{{ "change_slider_settings" | lce | escape_once }}</div>
  </button>
</div>

<script>
  window.addEventListener('DOMContentLoaded', (event) => {
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

    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-swiper-settings-btn'),
        menuItems: [
          {
            "title": '{{ "no_of_slides" | lce | escape_once }}',
            "type": "number",
            "key": "slides_count",
            "placeholder": '{{ "no_of_slides" | lce | escape_once }}',
            "step": 1,
            "min": 1
          },
          {
            "title": '{{ "use_different_titles_on_slides" | lce | escape_once }}',
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
            "title": '{{ "use_fade_effect_on_changing_slides" | lce | escape_once }}',
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
            "title": '{{ "use_autoplay_for_changing_slides" | lce | escape_once }}',
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
            "title": '{{ "autoplay_interval" | lce | escape_once }} ({{ "units.ms" | lce | escape_once }})',
            "type": "number",
            "key": "autoplay_interval",
            "step": 1,
            "min": 1,
            "class": [
              'swiper-settings-opt-interval'
            ]
          },
          {
            "title": '{{ "use_arrows_in_live_view" | lce | escape_once }}',
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
            "title": '{{ "use_navigation_bullets" | lce | escape_once }}',
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

    {%- if page.data[swiperSettingsKey].slides_count == blank or page.data[swiperSettingsKey].slides_count < 2 -%}
      $('.swiper-settings-opt').hide();
      $('.swiper-settings-opt-interval').hide();
    {%- endif -%}
  });
</script>