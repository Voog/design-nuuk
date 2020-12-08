<div class="content_settings-btn js-prevent-sideclick layout_settings-btn">
  <button disabled class="js-content-area-settings-btn js-settings-editor-btn">
    <div class="p14 bold">Content columns</div><div class="p14 grey">Change content columns count</div>
  </button>
</div>

<script>
  window.addEventListener('DOMContentLoaded', (event) => {
    {%- if page.data.content_area_settings %}
      var valuesObj = {{ page.data.content_area_settings | json }};
    {%- else %}
      var valuesObj = {};
    {%- endif %}

    if (!('items_count' in valuesObj)) {
      valuesObj.items_count = 3;
    }

    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-content-area-settings-btn'),
        menuItems: [
          {
            "title": "Select content area column count",
            "type": "select",
            "key": "items_count",
            "list": [
              {"title": "1", "value": "1"},
              {"title": "2", "value": "2"},
              {"title": "3", "value": "3"},
              {"title": "4", "value": "4"},
              {"title": "5", "value": "5"}
            ]
          }
        ],
        dataKey: 'content_area_settings',
        values: valuesObj
      }
    )

    {% if _contentAreaCount <= 0 %}
      {%- assign areaCount = 1 -%}
    {% else %}
      {%- assign areaCount = _contentAreaCount -%}
    {% endif %}

    {% for id in (1..areaCount) %}
      {%- assign columnSettingsKey = 'column_settings' | append: id -%}

      {%- if page.data[columnSettingsKey] %}
        var valuesObj = {{ page.data[columnSettingsKey] | json }};
      {%- else %}
        var valuesObj = {};
      {%- endif %}

      if (!('items_count' in valuesObj)) {
        valuesObj.items_count = 1;
      }

      initSettingsEditor(
        {
          settingsBtn: document.querySelector('.js-column-settings-btn-{{ id }}'),
          menuItems: [
            {
              "title": "Select content area row count",
              "type": "select",
              "key": "items_count",
              "list": [
                {"title": "1", "value": "1"},
                {"title": "2", "value": "2"},
                {"title": "3", "value": "3"},
                {"title": "4", "value": "4"},
                {"title": "5", "value": "5"}
              ]
            },
            {
              "title": "Min column item width in px",
              "type": "number",
              "min": 1,
              "key": "min_width",
              "placeholder": "Set min row item width in px"
            },
            {
              "title": "Max column item width in px",
              "type": "number",
              "min": 1,
              "key": "max_width",
              "placeholder": "Set max row item width in px"
            },
            {
              "title": "Column item padding in px",
              "type": "number",
              "min": 1,
              "key": "padding",
              "placeholder": "Set item padding in px"
            }
          ],
          dataKey: '{{columnSettingsKey}}',
          values: valuesObj,
          prevFunc: function(data) {
            if (data.padding) {
              var padding = '0 ' + data.padding + 'px ' + data.padding + 'px';

              $('.column-container-{{ id }} .col-item').css({
                padding: padding, width: 'calc(100% / {{page.data[columnSettingsKey].items_count}} - ' + data.padding * 2 + 'px)'
              });

              $('.column-container-{{ id }}').css({
                margin: '0 -' + data.padding + 'px'
              });
            } else {
              $('.column-container-{{ id }} .col-item').css({
                padding: 'initial', width: 'calc(100% / {{page.data[columnSettingsKey].items_count}})'
              });

              $('.column-container-{{ id }}').css({
                margin: 'initial'
              });
            }

            if (data.max_width) {
              $('.column-container-{{ id }} .col-item').css({
                'max-width': data.max_width + 'px'
              });
            } else {
              $('.column-container-{{ id }} .col-item').css({
                'max-width': 'initial'
              });
            }

            if (data.min_width) {
              $('.column-container-{{ id }} .col-item').css({
                'min-width': data.min_width + 'px'
              });
            } else {
              $('.column-container-{{ id }} .col-item').css({
                'min-width': 'initial'
              });
            }
          }
        }
      );
    {%- endfor -%}
  });
</script>
