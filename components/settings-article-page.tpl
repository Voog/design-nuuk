<div class="content_settings-btn layout_settings-btn js-prevent-sideclick">
  <button disabled class="js-article-settings-btn js-settings-editor-btn">
    <div class="bold">{{"article" | lce }}</div><div class="grey">{{"edit_article_settings" | lce }}</div>
  </button>
</div>

<script>
  window.addEventListener('DOMContentLoaded', function(event) {
    {% if articleSettingsData %}
      var articleDataValues = {{ articleSettingsData | json }};
    {% else %}
      var articleDataValues = {}
    {% endif %};
    {% if site.data.article_settings %}
      var globalDataValues = {{ site.data.article_settings | json }};
    {% else %}
      var globalDataValues = {}
    {% endif %};

    var show_comments, show_date, show_author;
    if (articleDataValues.show_comments != null && articleDataValues.show_comments !== '') {
      show_comments = Boolean(articleDataValues.show_comments)
    } else if (globalDataValues.show_comments != null && globalDataValues.show_comments !== '') {
      show_comments = Boolean(globalDataValues.show_comments)
    } else {
      show_comments = true;
    }
    if (articleDataValues.show_date != null && articleDataValues.show_date !== '') {
      show_date = Boolean(articleDataValues.show_date)
    } else if (globalDataValues.show_dates != null && globalDataValues.show_dates !== '') {
      show_date = Boolean(globalDataValues.show_dates)
    } else {
      show_date = true;
    }

    if (articleDataValues.show_author != null && articleDataValues.show_author !== '') {
      show_author = Boolean(articleDataValues.show_author)
    } else if (globalDataValues.show_authors != null && globalDataValues.show_authors !== '') {
      show_author = Boolean(globalDataValues.show_authors)
    } else {
      show_author = true;
    }
    var valuesObj = {
      show_comments: show_comments,
      show_date: show_date,
      show_author: show_author,
      has_share_on_facebook_btn: {%- if articleSettingsData.has_share_on_facebook_btn == true -%}true{%- else -%}false{%- endif -%},
      has_share_on_twitter_btn: {%- if articleSettingsData.has_share_on_twitter_btn == true -%}true{%- else -%}false{%- endif -%},
      has_share_on_linkedin_btn: {%- if articleSettingsData.has_share_on_linkedin_btn == true -%}true{%- else -%}false{%- endif -%},
      show_related_articles: {%- if articleSettingsData.show_related_articles == true -%}true{%- else -%}false{%- endif -%}
    }

    initSettingsEditor(
      {
        settingsBtn: document.querySelector('.js-article-settings-btn'),
        menuItems: [
          {
            "title": {{"add_share_facebook_button" | lce | json }},
            "type": "checkbox",
            "key": "has_share_on_facebook_btn",
            "tooltip": {{"visible_live_preview_visuals" | lce | json }},
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": {{"add_share_twitter_button" | lce | json }},
            "type": "checkbox",
            "key": "has_share_on_twitter_btn",
            "tooltip": {{"visible_live_preview_visuals" | lce | json }},
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": {{"add_share_linkedin_button" | lce | json }},
            "type": "checkbox",
            "key": "has_share_on_linkedin_btn",
            "tooltip": {{"visible_live_preview_visuals" | lce | json }},
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": {{"show_related_articles_by_tags" | lce | json }},
            "type": "checkbox",
            "key": "show_related_articles",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "titleI18n": "comments",
            "type": "toggle",
            "key": "show_comments",
            "tooltipI18n": "toggle_current_article_comments",
            "states": {
              "on": true,
              "off": false
            },
          },
          {
            "titleI18n": "publishing_date",
            "type": "toggle",
            "key": "show_date",
            "tooltipI18n": "toggle_current_article_date",
            "states": {
              "on": true,
              "off": false
            },
          },
          {
            "titleI18n": "article_author",
            "type": "toggle",
            "key": "show_author",
            "tooltipI18n": "toggle_all_authors",
            "states": {
              "on": true,
              "off": false
            },
          }
        ],
        dataKey: 'article_settings',
        values: valuesObj,
        entityData: 'articleData',
        containerClass: ['bottom-settings-popover', 'first', 'editor_default'],
        noReload: true,
        prevFunc: function(data) {
          var $articleComment = $('.comments'),
            $articleDate = $('.post_date'),
            $articleAuthor = $('.post_author'),
            $dateSeparator = $('.date-separator');

          if (data.show_date == true) {
            $articleDate.removeClass('hide-post-date');
            $articleDate.addClass('show-post-date');
          } else if (data.show_date == false) {
            $articleDate.removeClass('show-post-date');
            $articleDate.addClass('hide-post-date');
            $dateSeparator.addClass('hide-separator');
          }

          if (data.show_author == true) {
            $articleAuthor.removeClass('hide-post-author');
            $articleAuthor.addClass('show-post-author');
          } else if (data.show_author == false) {
            $articleAuthor.removeClass('show-post-author');
            $articleAuthor.addClass('hide-post-author');
            $dateSeparator.addClass('hide-separator');
          }

          if (data.show_comments == true) {
            $articleComment.removeClass('hide-post-comments');
            $articleComment.addClass('show-post-comments');
          } else if (data.show_comments == false) {
            $articleComment.removeClass('show-post-comments');
            $articleComment.addClass('hide-post-comments');
          }

          if (data.show_author == true && data.show_date == true) {
            $dateSeparator.removeClass('hide-separator');
          }

          // Share buttons script

          if (data.has_share_on_facebook_btn == true) {
            if (data.has_share_on_linkedin_btn == true || data.has_share_on_twitter_btn == true) {
              $('.js-article-shared .facebook').next('span').removeClass('d-none');
            }

            $('.js-article-shared .facebook').removeClass('d-none');
          } else {
            $('.js-article-shared .facebook').next('span').addClass('d-none');
            $('.js-article-shared .facebook').addClass('d-none');
          }

          if (data.has_share_on_twitter_btn == true) {
            if (data.has_share_on_linkedin_btn == true) {
              $('.js-article-shared .twitter').next('span').removeClass('d-none');
            }

            $('.js-article-shared .twitter').removeClass('d-none');
          } else {
            if (data.has_share_on_facebook_btn != true) {
              $('.js-article-shared .twitter').next('span').addClass('d-none');
            }

            $('.js-article-shared .twitter').addClass('d-none');
          }

          if (data.has_share_on_linkedin_btn == true) {
            if (data.has_share_on_twitter_btn != true) {
              $('.js-article-shared .twitter').next('span').addClass('d-none');
            } else if (data.has_share_on_twitter_btn == true) {
              $('.js-article-shared .twitter').next('span').removeClass('d-none');
            }

            $('.js-article-shared .linkedin').removeClass('d-none');
          } else {
            $('.js-article-shared .twitter').next('span').addClass('d-none');
            $('.js-article-shared .linkedin').addClass('d-none');
          }

          if (data.has_share_on_facebook_btn != true && data.has_share_on_twitter_btn != true && data.has_share_on_linkedin_btn != true ) {
            $('.js-article-shared').addClass('d-none');
          } else {
            $('.js-article-shared').removeClass('d-none');
          }

          // Related article script

          if (data.show_related_articles != true) {
            $('.js-related-articles').addClass('d-none');
          } else if (data.show_related_articles == true) {
            $('.js-related-articles').removeClass('d-none');
          }
        }
      }
    );
  });
</script>