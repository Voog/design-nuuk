<div class="content_settings-btn layout_settings-btn js-prevent-sideclick">
  <button class="js-blog-settings-editor js-settings-editor-btn">
    <div class="bold">Blog{{ "blog" | lc }}</div>
    <div class="grey">{{ "edit_blog_settings" | lc }}</div>
  </button>
</div>

<script>
  window.addEventListener('DOMContentLoaded', (event) => {
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
    var valuesObj = {
      show_comments: show_comments,
      show_dates: show_dates,
      show_authors: show_authors
    }

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
        ],
        dataKey: 'article_settings',
        values: valuesObj,
        entityData: 'siteData',
        noReload: true,
        containerClass: ['bottom-settings-popover', 'first', 'editor_default'],
        prevFunc: function(data) {
          var $articleDate = $('.post_date.site-data'),
            $dateSeparator = $('.post_date.site-data + .date-separator'),
            $articleAuthor = $('.post_author.site-data');

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
        },
      }
    );
  });
</script>