<script>
  window.addEventListener('DOMContentLoaded', function(event) {
    {%- if _footerSettings -%}
      var valuesObj = {{ _footerSettings | json }};
    {%- else -%}
      var valuesObj = {};
    {%- endif -%}

    if (!('block_count' in valuesObj)) {
      valuesObj.block_count = {{ _defaultFooterSettings.block_count }};
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
            "key": "block_count",
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
            $('footer .flex_row-{{ _defaultFooterSettings.block_count }} .flex_row-{{ _defaultFooterSettings.col_count }}--item:nth-child(n+' + (data.col_count + 1) + ')').addClass('d-none');
            $('footer .flex_row-{{ _defaultFooterSettings.block_count }} .flex_row-{{ _defaultFooterSettings.col_count }}--item:nth-child(-n+' + data.col_count + ')').removeClass('d-none');
          }

          if (data.block_count >= 1) {
            $('footer .flex_row-{{ _defaultFooterSettings.block_count }}:nth-of-type(n+' + (data.block_count + 1) + ')').addClass('d-none');
            $('footer .flex_row-{{ _defaultFooterSettings.block_count }}:nth-of-type(-n+' + data.block_count + ')').removeClass('d-none');
          }
        }
      }
    )
  })
</script>
