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
      {%- assign blockColumnsSettingsKey = 'block_columns_settings' | append: id -%}

      {%- if page.data[blockColumnsSettingsKey] %}
        var valuesObj = {{ page.data[blockColumnsSettingsKey] | json }};
      {%- else %}
        var valuesObj = {};
      {%- endif %}

      if (!('h_padding' in valuesObj)) {
        valuesObj.h_padding = {{_hPadding}};
      }

      if (!('v_padding' in valuesObj)) {
        valuesObj.v_padding = {{_vPadding}};
      }

      if (!('min_width' in valuesObj)) {
        valuesObj.min_width = {{_minWidth}};
      }

      if (!('justify' in valuesObj)) {
        valuesObj.justify = "{{_justify}}";
      }

      initSettingsEditor(
        {
          settingsBtn: document.querySelector('.js-column-settings-btn-{{ id }}'),
          menuItems: [
            {
              "title": "Minimum width of column (px)",
              "type": "number",
              "min": 1,
              "key": "min_width",
              "placeholder": "Minimum width of column (px)"
            },
            {
              "title": "Maximum width of column (px)",
              "type": "number",
              "min": 1,
              "key": "max_width",
              "placeholder": "Maximum width of column (px)"
            },
            {
              "title": "Space between columns (px)",
              "type": "number",
              "min": 1,
              "key": "h_padding",
              "placeholder": "Space between columns (px)"
            },
            {
              "title": "Block top & bottom spacing (px)",
              "type": "number",
              "min": 1,
              "key": "v_padding",
              "placeholder": "Block top & bottom spacing (px)"
            },
            {
              "title": "Justification of columns",
              "type": "select",
              "key": "justify",
              "list": [
                {
                  "title": "Space between columns",
                  "value": "between"
                },
                {
                  "title": "Space around columns",
                  "value": "around"
                },
                {
                  "title": "Columns are evenly distributed",
                  "value": "evenly"
                }
              ]
            }
          ],
          dataKey: '{{blockColumnsSettingsKey}}',
          values: valuesObj,
          noReload: true,
          prevFunc: function(data) {
            {%- assign rowSettingsKey = id | append: '_block_columns' -%}
            {%- assign rowSettings = _blockSettings[rowSettingsKey] -%}

            if (data.h_padding) {
              var h_padding = '0 ' + data.h_padding + 'px ';

              $('.column-container-{{ id }} .col-item').css({
                padding: h_padding, width: 'calc(100% / {{rowSettings.block_count}} - ' + data.h_padding * 2 + 'px)'
              });

              $('.column-container-{{ id }}').css({
                margin: '0 -' + data.h_padding + 'px'
              });
            } else {
              $('.column-container-{{ id }} .col-item').css({
                padding: 'initial', width: 'calc(100% / {{rowSettings.block_count}})'
              });

              $('.column-container-{{ id }}').css({
                margin: 'initial'
              });
            }

            if (data.v_padding) {
              $('.column-container-{{ id }}').css({
                padding: data.v_padding + 'px 0'
              });
            }
            console.log(data);
            if (data.justify) {
              console.log(data.justify);
              $('.column-container-{{ id }}').css({
                "justify-content": 'space-' + data.justify
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
