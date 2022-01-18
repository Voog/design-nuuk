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

    if (!('show_articles_as_list' in valuesObj)) {
      valuesObj.show_articles_as_list = false;
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
                "value": "list_cols_2"
              },
              {
                "title": "List view (3 cols)",              
                "value": "list_cols_3"
              },
            ]
          },
          {
            "titleI18n": "show_articles_as_list",
            "type": "toggle",
            "key": "show_articles_as_list",
            "tooltipI18n": "show_articles_as_list",
            "states": {
              "on": true,
              "off": false
            },
          }
        ],
        dataKey: '{{blogLayoutKey}}',
        containerClass: ['bottom-settings-popover', 'first', 'editor_default'],
        values: valuesObj,
        noReload: true,
        prevFunc: function(data) {
          var $articleSize = $('.blog_listing-item');
          if (data.blog_layout == "highlight_with_popout") {
            $articleSize.removeClass('highlight list list_cols_2 list_cols_3')
            $articleSize.addClass('highlight_with_popout');

          } else if (data.blog_layout == "highlight") {
            $articleSize.removeClass('highlight_with_popout list list_cols_2 list_cols_3');
            $articleSize.addClass('highlight')
          } else if (data.blog_layout == "list") {
            $articleSize.removeClass('highlight highlight_with_popout list_cols_2 list_cols_3');
            $articleSize.addClass('list');
          } else if (data.blog_layout == "list_cols_2") {
            $articleSize.removeClass('highlight highlight_with_popout list list_cols_3');
            $articleSize.addClass('list_cols_2');
          } else if (data.blog_layout == 'list_cols_3') {
            $articleSize.removeClass('highlight highlight_with_popout list list_cols_2');
            $articleSize.addClass('list_cols_3');
          }

          if (data.show_articles_as_list == true) {
            $('.over-limit.blog_listing-item-list').removeClass('d-none');
            $('.over-limit.blog_listing-item').addClass('d-none');
          } else {
            $('.over-limit.blog_listing-item-list').addClass('d-none');
            $('.over-limit.blog_listing-item').removeClass('d-none');
          }
        }
      }
    )
  });
</script>
