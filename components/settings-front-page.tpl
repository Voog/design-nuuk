<div class="content_settings-btn js-prevent-sideclick layout_settings-btn">
  <button disabled class="js-front-page-settings-btn js-settings-editor-btn">
    <div class="p14 bold">Front page header</div><div class="p14 grey">Change slider settings</div>
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
            "title": "Different title on every slide",
            "type": "checkbox",
            "key": "is_content_by_slide",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": "Use fade effect on changing slides",
            "type": "checkbox",
            "key": "is_fade_effect",
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