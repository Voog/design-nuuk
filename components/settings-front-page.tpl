<div class="content_settings-btn js-prevent-sideclick layout_settings-btn">
  <button disabled class="js-front-page-settings-btn js-settings-editor-btn">
    <div class="p14 bold">Front page</div><div class="p14 grey">Edit front page</div>
  </button>
</div>

<script>
  window.addEventListener('DOMContentLoaded', (event) => {
    {% if page.data.swiper_settings %}
      var valuesObj = {{ page.data.swiper_settings | json }};
    {% else %}
      var valuesObj = {};
    {% endif %}


    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-front-page-settings-btn'),
        menuItems: [
          {
            "title": "Use slider for header images",
            "type": "checkbox",
            "key": "is_slider",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": "Use different content areas for every slide",
            "type": "checkbox",
            "key": "is_content_by_slide",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": "Use fade effect in slider",
            "type": "checkbox",
            "key": "is_fade_effect",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": "Add swiper navigation arrows in live view",
            "type": "checkbox",
            "key": "are_navigation_arrows",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": "Add swiper navigation bullets",
            "type": "checkbox",
            "key": "are_navigation_bullets",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": "Number of header images",
            "type": "number",
            "key": "slides_count",
            "placeholder": "Number of header images",
            "step": 1,
            "min": 1
          }
        ],
        dataKey: 'swiper_settings',
        values: valuesObj
      }
    );
  });
</script>