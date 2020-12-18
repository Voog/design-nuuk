<div class="content_settings-btn js-prevent-sideclick layout_settings-btn">
  <button disabled class="js-content-area-settings-btn js-settings-editor-btn">
    <div class="p14 bold">Block settings</div><div class="p14 grey">Edit the number of blocks</div>
  </button>
</div>

<script>
  window.addEventListener('DOMContentLoaded', (event) => {
    {%- if _blockSettings %}
      var valuesObj = {{ _blockSettings | json }};
    {%- else %}
      var valuesObj = {};
    {%- endif %}

    if (!('block_count' in valuesObj)) {
      valuesObj.block_count = {{_blockCount}};
    }

    {% for id in (1.._blockCount) %}
      {%- assign columnKey = id | append: '_block_columns' -%}
      {%- if id >= 3 -%}
        {%- assign columnCount = _defaultcolumnCount -%}
      {%- else -%}
        {%- assign columnCount = id -%}
      {%- endif -%}

      if (!('{{columnKey}}' in valuesObj)) {
        valuesObj['{{columnKey}}'] = {{id}};
      }
    {% endfor %}

    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-content-area-settings-btn'),
        menuItems: [
          {
            "title": "Number of block",
            "type": "select",
            "key": "block_count",
            "list": [
              {"title": "1", "value": 1},
              {"title": "2", "value": 2},
              {"title": "3", "value": 3},
              {"title": "4", "value": 4},
              {"title": "5", "value": 5}
            ]
          },
          {% for id in (1.._blockCount) %}
          {
            "title": "Number of columns in block {{id}}",
            "type": "select",
            "key": "{{id}}_block_columns",
            "list": [
              {"title": "1", "value": 1},
              {"title": "2", "value": 2},
              {"title": "3", "value": 3},
              {"title": "4", "value": 4},
              {"title": "5", "value": 5}
            ]
          },
          {% endfor %}
        ],
        dataKey: 'block_settings',
        values: valuesObj
      }
    )



    {% for id in (1.._blockCount) %}
      {%- assign blockColumnsSettingsKey = 'block_columns_settings' | append: id | append: _blockId -%}

      {%- if page.data[blockColumnsSettingsKey] %}
        var valuesObj = {{ page.data[blockColumnsSettingsKey] | json }};
      {%- else %}
        var valuesObj = {};
      {%- endif %}

      if (!('block_count' in valuesObj)) {
        valuesObj.padding = {{_padding}};
      }

      if (!('min_width' in valuesObj)) {
        valuesObj.min_width = {{_minWidth}};
      }

      initSettingsEditor(
        {
          settingsBtn: document.querySelector('.js-column-settings-btn-{{ id }}'),
          menuItems: [
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
          dataKey: '{{blockColumnsSettingsKey}}',
          values: valuesObj,
          noReload: true,
          prevFunc: function(data) {
            {%- assign rowSettingsKey = id | append: '_block_columns' -%}
            {%- assign rowSettings = _blockSettings[rowSettingsKey] -%}

            if (data.padding) {
              var padding = '0 ' + data.padding + 'px ' + data.padding + 'px';

              $('.column-container-{{ id }} .col-item').css({
                padding: padding, width: 'calc(100% / {{rowSettings.block_count}} - ' + data.padding * 2 + 'px)'
              });

              $('.column-container-{{ id }}').css({
                margin: '0 -' + data.padding + 'px'
              });
            } else {
              $('.column-container-{{ id }} .col-item').css({
                padding: 'initial', width: 'calc(100% / {{rowSettings.block_count}})'
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

    $(window).resize(function() {
      $(".col-item").each(function() {
        if  ({{_minWidth}} >= $(this).closest(".content-body").width()) {
          $(this).css('min-width', '100%');
        } else {
          $(this).css('min-width', {{_minWidth}});
        }
      });
    });
  });
</script>
