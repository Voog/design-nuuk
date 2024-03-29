{%- assign blogLayoutSetting = page.data[blogLayoutKey] -%}
{%- assign defaultBlogLayoutSetting = template_settings.page.blog_settings.value -%}
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
      valuesObj.blog_layout = '{{ defaultBlogLayoutSetting.blog_layout }}';
    }

    if (!('show_older_articles_as_list' in valuesObj)) {
      valuesObj.show_older_articles_as_list = {{ defaultBlogLayoutSetting.show_older_articles_as_list }};
    }

    if (!('no_of_unarchived_articles' in valuesObj)) {
      valuesObj.no_of_unarchived_articles = {{ defaultBlogLayoutSetting.no_of_unarchived_articles }};
    }

    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-blog-layout-settings-editor'),
        menuItems: [
          {
            "title": {{ "blog_layout" | lce | json }},
            "type": "radio",
            "key": "blog_layout",
            "list": [
              {
                "title": {{ "highlight_with_popout" | lce | json }},
                "value": "highlight_with_popout"
              },
              {
                "title": {{ "highlight" | lce | json }},
                "value": "highlight"
              },
              {
                "title": "{{ "list" | lce }} ({{ "cols_n" | lcce: 1 }})",
                "value": "list"
              },
              {
                "title": "{{ "list" | lce }} ({{ "cols_n" | lcce: 2 }})",
                "value": "list_cols_2"
              },
              {
                "title": "{{ "list" | lce }} ({{ "cols_n" | lcce: 3 }})",
                "value": "list_cols_3"
              },
            ]
          },
          {
            "titleI18n": {{ "show_older_articles_as_list" | lce | json }},
            "type": "toggle",
            "key": "show_older_articles_as_list",
            "states": {
              "on": true,
              "off": false
            },
          },
          {
            "titleI18n": {{ "no_of_unarchived_articles" | lce | json }},
            "type": "number",
            "key": "no_of_unarchived_articles",
            "step": 1,
            "min": 3,
            "class": "blog-list-opt"
          }
        ],
        dataKey: '{{blogLayoutKey}}',
        containerClass: ['bottom-settings-popover', 'first', 'editor_default'],
        values: valuesObj,
        prevFunc: function(data) {
          var $articleSize = $('.blog_listing-item');
          if (data.blog_layout === 'highlight_with_popout') {
            $articleSize.removeClass('highlight list list_cols_2 list_cols_3')
            $articleSize.addClass('highlight_with_popout');
          } else if (data.blog_layout === 'highlight') {
            $articleSize.removeClass('highlight_with_popout list list_cols_2 list_cols_3');
            $articleSize.addClass('highlight')
          } else if (data.blog_layout === 'list') {
            $articleSize.removeClass('highlight highlight_with_popout list_cols_2 list_cols_3');
            $articleSize.addClass('list');
          } else if (data.blog_layout === 'list_cols_2') {
            $articleSize.removeClass('highlight highlight_with_popout list list_cols_3');
            $articleSize.addClass('list_cols_2');
          } else if (data.blog_layout === 'list_cols_3') {
            $articleSize.removeClass('highlight highlight_with_popout list list_cols_2');
            $articleSize.addClass('list_cols_3');
          }

          if (data.show_older_articles_as_list) {
            $('.blog-list-opt').show();
          } else {
            $('.blog-list-opt').hide();
          }
        }
      });
    {%- if blogLayoutSetting.show_older_articles_as_list != true -%}
      $('.blog-list-opt').hide();
    {%- endif -%}
  });
</script>
