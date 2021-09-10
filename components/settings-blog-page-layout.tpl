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
              }
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
            $articleSize.removeClass('list')
            $articleSize.addClass('highlight-with-popout');
          } else if (data.blog_layout == "highlight") {
            $articleSize.removeClass('highlight-with-popout');
            $articleSize.removeClass('list')
          } else if (data.blog_layout == "list") {
            $articleSize.removeClass('highlight-with-popout');
            $articleSize.addClass('list');
          }
        }
      }
    )
  });
</script>