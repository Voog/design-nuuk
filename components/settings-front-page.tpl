<div class="content_settings-btn js-prevent-sideclick layout_settings-btn">
  <button disabled class="js-front-page-settings-btn js-settings-editor-btn">
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
        dataKey: '{{swiperSettingsKey}}',
        values: valuesObj
      }
    );
  });
</script>