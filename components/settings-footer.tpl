<script>
  window.addEventListener('DOMContentLoaded', function(event) {
    {%- if _footerSettings -%}
      var valuesObj = {{ _footerSettings | json }};
    {%- else -%}
      var valuesObj = {};
    {%- endif -%}

    if (!('row_count' in valuesObj)) {
      valuesObj.row_count = {{ _defaultFooterSettings.row_count }};
    }

    if (!('col_count' in valuesObj)) {
      valuesObj.col_count = {{ _defaultFooterSettings.col_count }};
    }

    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-footer-settings-btn'),
        menuItems: [
          {
            "title": {{ "rows" | lce | json }},
            "type": "select",
            "key": "row_count",
            "list": [
              {"title": "1", "value": 1},
              {"title": "2", "value": 2}
            ]
          },
          {
            "title": {{ "columns" | lce | json }},
            "type": "select",
            "key": "col_count",
            "list": [
              {"title": "1", "value": 1},
              {"title": "2", "value": 2},
              {"title": "3", "value": 3},
              {"title": "4", "value": 4}
            ]
          }
        ],
        dataKey: '{{ footerSettingsKey }}',
        containerClass: ['footer-settings-popover', 'editor_default'],
        values: valuesObj,
        entityData: 'siteData',
        noReload: true,
        prevFunc: function(data) {
          if (data.col_count >= 1) {
            $('footer .flex_row-{{ _defaultFooterSettings.row_count }} .flex_row-{{ _defaultFooterSettings.col_count }}--item:nth-child(n+' + (data.col_count + 1) + ')').addClass('d-none');
            $('footer .flex_row-{{ _defaultFooterSettings.row_count }} .flex_row-{{ _defaultFooterSettings.col_count }}--item:nth-child(-n+' + data.col_count + ')').removeClass('d-none');
          }

          if (data.row_count >= 1) {
            $('footer .flex_row-{{ _defaultFooterSettings.row_count }}:nth-of-type(n+' + (data.row_count + 1) + ')').addClass('d-none');
            $('footer .flex_row-{{ _defaultFooterSettings.row_count }}:nth-of-type(-n+' + data.row_count + ')').removeClass('d-none');
          }
        }
      }
    )
  })
</script>
