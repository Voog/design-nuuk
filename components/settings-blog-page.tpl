{% include 'settings-editor-button',
  _titleKey: "blog",
  _descriptionKey: "edit_blog_settings",
  _className: "js-blog-settings-editor",
  _wrapClassName: "content_settings-btn"
%}

<script>
  window.addEventListener('DOMContentLoaded', function(event) {
    {% if site.data.article_settings %}
      var globalDataValues = {{ site.data.article_settings | json }};
    {% else %}
      var globalDataValues = {}
    {% endif %};

    var show_comments, show_dates, show_authors;
    if (globalDataValues.show_comments != null && globalDataValues.show_comments !== '') {
      show_comments = Boolean(globalDataValues.show_comments)
    } else {
      show_comments = true;
    }
    if (globalDataValues.show_dates != null && globalDataValues.show_dates !== '') {
      show_dates = Boolean(globalDataValues.show_dates)
    } else {
      show_dates = true;
    }
    if (globalDataValues.show_authors != null && globalDataValues.show_authors !== '') {
      show_authors = Boolean(globalDataValues.show_authors)
    } else {
      show_authors = true;
    }

    

    var blogLayouts = [{"title": "Secondary shown", "value": 1},
                      {"title": "Secondary hidden", "value": 0},
                      {"title": "List view", "value": 2}];

    // For switching between 2 layouts (true or false)
    /*if (globalDataValues.blog_layout != null && globalDataValues.blog_layout !== '') {
      blog_layout = Boolean(globalDataValues.blog_layout)
    } else {
      blog_layout = true;
    }*/

    if (globalDataValues.blog_layout != null && globalDataValues.blog_layout !== '') {
      blog_layout = globalDataValues.blog_layout;
    } else {
      blog_layout = 1;
    }

    var valuesObj = {
      show_comments: show_comments,
      show_dates: show_dates,
      show_authors: show_authors,
      blog_layout: blog_layout
    }

    /*if (!('blog_layout' in valuesObj)) {
      valuesObj.blog_layout = 1;
    }*/

    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-blog-settings-editor'),
        menuItems: [
          {
            "titleI18n": "comments",
            "type": "toggle",
            "key": "show_comments",
            "tooltipI18n": "toggle_all_articles_comments",
            "states": {
              "on": true,
              "off": false
            },
          },
          {
            "titleI18n": "publishing_date",
            "type": "toggle",
            "key": "show_dates",
            "tooltipI18n": "toggle_all_dates",
            "states": {
              "on": true,
              "off": false
            },
          },
          {
            "titleI18n": "article_author",
            "type": "toggle",
            "key": "show_authors",
            "tooltipI18n": "toggle_all_authors",
            "states": {
              "on": true,
              "off": false
            },
          },
          {
            "titleI18n": "Blog Layout",
            "type": "select",
            "key": "blog_layout",
            "tooltipI18n": "Blog Layout",
            "list": blogLayouts,
            /*"states": {
              "on": true,
              "off": false
            },*/
          },
        ],
        dataKey: 'article_settings',
        values: valuesObj,
        entityData: 'siteData',
        noReload: true,
        containerClass: ['bottom-settings-popover', 'first', 'editor_default'],
        prevFunc: function(data) {
          var $articleDate = $('.post_date.site-data'),
            $dateSeparator = $('.post_date.site-data + .date-separator'),
            $articleAuthor = $('.post_author.site-data'),
            $articleSize = $('.blog_listing-item');

          if (data.show_dates == true) {
            $articleDate.removeClass('hide-post-date');
            $articleDate.addClass('show-post-date');
          } else if (data.show_dates == false) {
            $articleDate.removeClass('show-post-date');
            $articleDate.addClass('hide-post-date');
            $dateSeparator.addClass('hide-separator');
          }

          if (data.show_authors == true) {
            $articleAuthor.removeClass('hide-post-author');
            $articleAuthor.addClass('show-post-author');
          } else if (data.show_authors == false) {
            $articleAuthor.removeClass('show-post-author');
            $articleAuthor.addClass('hide-post-author');
            $dateSeparator.addClass('hide-separator');
          }

          if (data.show_authors == true && data.show_dates == true) {
            $dateSeparator.removeClass('hide-separator');
          }

          if (data.blog_layout == 0) {
            $articleSize.removeClass('secondary');
            $articleSize.removeClass('list')
          } else if (data.blog_layout == 1) {
            $articleSize.removeClass('list')
            $articleSize.addClass('secondary');
            
          }
          else if (data.blog_layout == 2) {
            $articleSize.removeClass('secondary');
            $articleSize.addClass('list');
          }
        },
      }
    );
  });
</script>