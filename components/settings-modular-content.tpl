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
          }
        ],
        dataKey: 'block_settings',
        values: valuesObj
      }
    )



    {% for id in (1.._blockCount) %}
      {%- assign blockColumnsSettingsKey = 'block_columns_settings' | append: id -%}
      {%- assign blockObjKey = 'block_' | append: id -%}

      {%- if page.data[blockColumnsSettingsKey] %}
        var valuesObj = {{ page.data[blockColumnsSettingsKey] | json }};
      {%- else %}
        var valuesObj = {};
      {%- endif %}

      if (!('col_h_padding' in valuesObj)) {
        {%- if _defaultBlockObj[blockObjKey].col_h_padding -%}
          valuesObj.col_h_padding = "{{_defaultBlockObj[blockObjKey].col_h_padding}}";
        {%- else -%}
          valuesObj.col_h_padding = "{{_defaultBlockObj.default.col_h_padding}}";
        {%- endif -%}
      }
      if (!('col_min_width' in valuesObj)) {
        {%- if _defaultBlockObj[blockObjKey].col_min_width -%}
          valuesObj.col_min_width = "{{_defaultBlockObj[blockObjKey].col_min_width}}";
        {%- else -%}
          valuesObj.col_min_width = "{{_defaultBlockObj.default.col_min_width}}";
        {%- endif -%}
      }

      if (!('col_max_width' in valuesObj)) {
        {%- if _defaultBlockObj[blockObjKey].col_max_width -%}
          valuesObj.col_max_width = "{{_defaultBlockObj[blockObjKey].col_max_width}}";
        {%- else -%}
          valuesObj.col_max_width = "{{_defaultBlockObj.default.col_max_width}}";
        {%- endif -%}
      }

      if (!('col_justification' in valuesObj)) {
        {%- if _defaultBlockObj[blockObjKey].col_justification -%}
          valuesObj.col_justification = "{{_defaultBlockObj[blockObjKey].col_justification}}";
        {%- else -%}
          valuesObj.col_justification = "{{_defaultBlockObj.default.col_justification}}";
        {%- endif -%}
      }

      if (!('block_v_padding' in valuesObj)) {
      {%- if _defaultBlockObj[blockObjKey].block_v_padding -%}
        valuesObj.block_v_padding = "{{_defaultBlockObj[blockObjKey].block_v_padding}}";
      {%- else -%}
        valuesObj.block_v_padding = "{{_defaultBlockObj.default.block_v_padding}}";
      {%- endif -%}
      }

      if (!('block_max_width' in valuesObj)) {
        {%- if _defaultBlockObj[blockObjKey].block_max_width -%}
          valuesObj.block_max_width = "{{_defaultBlockObj[blockObjKey].block_max_width}}";
        {%- else -%}
          valuesObj.block_max_width = "{{_defaultBlockObj.default.block_max_width}}";
        {%- endif -%}
      }

      if (!('block_justification' in valuesObj)) {
        {%- if _defaultBlockObj[blockObjKey].block_justification -%}
            valuesObj.block_justification = "{{_defaultBlockObj[blockObjKey].block_justification}}";
        {%- else -%}
          valuesObj.block_justification = "{{_defaultBlockObj.default.block_justification}}";
        {%- endif -%}
      }

      if (valuesObj.block_max_width < 100) {
        $('.block_justification').show();
      } else {
        $('.block_justification').hide();
      }

      {%- assign blockObjKey = 'block_' | append: id -%}

      if (!('block_columns' in valuesObj)) {
        {%- if _defaultBlockObj[blockObjKey].col_count %}
          valuesObj['block_columns'] = {{_defaultBlockObj[blockObjKey].col_count}};
        {%- else %}
          valuesObj['block_columns'] = 3;
        {%- endif %}
      }

      var setMinWidth = function() {
        var colItem = $(".column-container-{{id}} .col-item");

        if (parseFloat(colItem.css('min-width')) >= colItem.closest(".editor_default-container").width()) {
          colItem.css('min-width', '100%');
        } else {
          colItem.css('min-width', valuesObj.col_min_width);
        }
      }

      setMinWidth();

      $(window).resize(function() {
        setMinWidth();

        if ($(window).width() >= 540) {
          $('.block-{{ id }}').css({
            width: valuesObj.block_max_width + '%'
          });
        } else {
          $('.block-{{ id }}').css({
            width: '100%'
          });
        }
      });

      initSettingsEditor(
        {
          settingsBtn: document.querySelector('.js-column-settings-btn-{{ id }}'),
          menuItems: [
            {
              "title": "Number of columns in block {{id}}",
              "type": "select",
              "key": "block_columns",
              "list": [
                {"title": "1", "value": 1},
                {"title": "2", "value": 2},
                {"title": "3", "value": 3},
                {"title": "4", "value": 4},
                {"title": "5", "value": 5}
              ]
            },
            {
              "title": "Block maximum width (%)",
              "type": "number",
              "min": 1,
              "key": "block_max_width",
              "placeholder": "Maximum block width (%)"
            },
            {
              "title": "Block top & bottom spacing (px)",
              "type": "number",
              "min": 1,
              "key": "block_v_padding",
              "placeholder": "Block top & bottom spacing (px)"
            },
            {
              "title": "Block justification",
              "type": "select",
              "key": "block_justification",
              "list": [
                {
                  "title": "Left",
                  "value": "flex-start"
                },
                {
                  "title": "Center",
                  "value": "center"
                },
                {
                  "title": "Right",
                  "value": "flex-end"
                }
              ],
              "class": [
                'block_justification'
              ]
            },
            {
              "title": "Column maximum width (px)",
              "type": "number",
              "min": 1,
              "key": "col_max_width",
              "placeholder": "Maximum column width (px)"
            },
            {
              "title": "Column minimum width (px)",
              "type": "number",
              "min": 1,
              "key": "col_min_width",
              "placeholder": "Minimum width of column (px)"
            },
            {
              "title": "Space between columns (px)",
              "type": "number",
              "min": 1,
              "key": "col_h_padding",
              "placeholder": "Space between columns (px)"
            },
            {
              "title": "Column justification",
              "type": "select",
              "key": "col_justification",
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
          prevFunc: function(data) {
            {%- assign rowSettingsKey = id | append: '_block_columns' -%}
            {%- assign rowSettings = _blockSettings[rowSettingsKey] -%}

            if (data.block_max_width >= 0) {
              if ($(window).width() >= 540) {
                $('.block-{{ id }}').css({
                  width: data.block_max_width + '%'
                });
              } else {
                $('.block-{{ id }}').css({
                  width: '100%'
                });
              }
            }

            if (data.block_justification) {
              $('.block-container-{{ id }}').css({
                'justify-content': data.block_justification
              });
            }

            if (data.col_h_padding >= 0) {
              var col_h_padding = '0 ' + data.col_h_padding + 'px 32px';

              $('.column-container-{{ id }} .col-item').css({
                padding: col_h_padding, width: 'calc(100% / {{rowSettings.block_count}} - ' + data.col_h_padding * 2 + 'px)'
              });

              $('.column-container-{{ id }}').css({
                'margin': '0 -' + data.col_h_padding + 'px -32px'
              });
            } else {
              $('.column-container-{{ id }} .col-item').css({
                padding: '0 0 32px', width: 'calc(100% / {{rowSettings.block_count}})'
              });

              $('.column-container-{{ id }}').css({
                'margin': '0 0 -32px'
              });
            }

            if (data.block_v_padding >= 0) {
              $('.column-container-{{ id }}').css({
                padding: data.block_v_padding + 'px 0'
              });
            }

            if (data.col_justification) {
              $('.column-container-{{ id }}').css({
                'justify-content': 'space-' + data.col_justification
              });
            }

            if (data.col_max_width >= 1) {
              $('.column-container-{{ id }} .col-item').css({
                'max-width': data.col_max_width + 'px'
              });
            } else {
              $('.column-container-{{ id }} .col-item').css({
                'max-width': 'initial'
              });
            }

            if (data.col_min_width >= 1) {
              $('.column-container-{{ id }} .col-item').css({
                'min-width': data.col_min_width + 'px'
              });
            } else {
              $('.column-container-{{ id }} .col-item').css({
                'min-width': 'initial'
              });
            }

            if (data.block_max_width < 100) {
              $('.block_justification').show();
            } else {
              $('.block_justification').hide();
            }
          }
        }
      );
    {%- endfor -%}
  });
</script>
