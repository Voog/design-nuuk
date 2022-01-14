{%- assign blogLayoutSetting = page.data[blogLayoutKey] -%}
{% include 'settings-editor-button',
  _titleKey: "blog_layout",
  _descriptionKey: "edit_blog_layout",
  _className: "js-blog-layout-settings-editor",
  _wrapClassName: "content_settings-btn"
%}

<script>
  window.addEventListener('DOMContentLoaded', function(event) {
    {%- if blogLayoutSetting -%}
      var valuesObj = {{ blogLayoutSetting | json }};
    {%- else -%}
      var valuesObj = {};
    {%- endif -%}

    if (!('blog_layout' in valuesObj)) {
      valuesObj.blog_layout = "highlight_with_popout";
    }

    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-blog-layout-settings-editor'),
        menuItems: [
          {
            "title": "Blog layout",
            "type": "radio",
            "key": "blog_layout",
            "list": [
              {
                "title": "Popout article shown",
                "value": "highlight_with_popout"
              },
              {
                "title": "Popout article hidden",  
                "value": "highlight"
              },
              {
                "title": "List view",              
                "value": "list"
              },
              {
                "title": "List view (2 cols)",              
                "value": "list_2"
              },
              {
                "title": "List view (3 cols)",              
                "value": "list_3"
              },
            ]
          }
        ],
        dataKey: '{{blogLayoutKey}}',
        containerClass: ['bottom-settings-popover', 'first', 'editor_default'],
        values: valuesObj,
        noReload: true,
        prevFunc: function(data) {
          var $articleSize = $('.blog_listing-item');
          if (data.blog_layout == "highlight_with_popout") {
            $articleSize.removeClass('list list-cols-2 list-cols-3')
            $articleSize.addClass('highlight-with-popout');

          } else if (data.blog_layout == "highlight") {
            $articleSize.removeClass('highlight-with-popout list list-cols-2 list-cols-3');

          } else if (data.blog_layout == "list") {
            $articleSize.removeClass('highlight-with-popout list-cols-2 list-cols-3');
            $articleSize.addClass('list');
          } else if (data.blog_layout == "list_2") {
            $articleSize.removeClass('highlight-with-popout list list-cols-3');
            $articleSize.addClass('list-cols-2');
          } else if (data.blog_layout == 'list_3') {
            $articleSize.removeClass('highlight-with-popout list list-cols-2');
            $articleSize.addClass('list-cols-3');
          }
        }
      }
    )
  });
</script>
