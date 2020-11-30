<!DOCTYPE html>
{% include "template-variables" with "article" %}
{% include "blog-article-variables" %}
{% include "article-settings-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_article_page = true %}
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign articleSettingsData = article.data.article_settings -%}
</head>

<body class="post-page js-bg-picker-area {% include 'semimodal-class-names' %}">
  {% include "template-svg-spritesheet" %}
  {% if editmode %}
    <div class="bg-picker-top"><button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button></div>
  {% endif %}
  <div class="background-color js-background-color"></div>

  <div class="flex_box js-background-type {{ body_bg_type }}">
    {% include "header" %}
    {% if editmode %}
      <div class="content_settings-btn layout_settings-btn js-prevent-sideclick">
        <button disabled class="js-article-settings-btn js-settings-editor-btn">Article settings</button>
      </div>
    {% endif %}
    <div class="container">
      {% include "tags-post" %}

      <main class="content" role="main" data-search-indexing-allowed="true">

        {% include "post-box" with "article" %}

        <section id="comments" class="comments content-formatted{% if show_article_comments == false %} hide-post-comments{% endif %}" data-search-indexing-allowed="false">
          {% if article.comments_count > 0 %}
            <h4 class="comment_title js-comments">{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h4>

            <div class="comment_messages content-formatted">
              {% for comment in article.comments reversed %}
                <div class="comment edy-site-blog-comment">
                  <span class="comment_body">{{ comment.body_html }}</span>
                  <span class="comment_author">({{ comment.author }},</span>
                  <span class="comment_date">{{ comment.created_at | format_date: "long" }})</span>
                  <span class="comment_delete">{% removebutton %}</span>
                </div>
              {% endfor %}
            </div>
          {% endif %}

          {% include "comment-form" %}
        </section>

        <div class="content-formatted">
          {%- if articleSettingsData.show_related_articles -%}
            {% assign current_article_id = article.id %}
            <h4>Continue reading</h4>

            <div class="flex_row flex_row-3 mar_0-16-neg related_posts mar_t-32">
              {%- load articles to "articles" q.article.tag$in=article.tags -%}
              {% for article in articles %}
                {%- if article.id != current_article_id -%}
                  <div class="flex_row-3--item">
                    <div class="mar_0-16">
                      {% include "post-box" %}
                    </div>
                  </div>
                  {%- if forloop.index == 3 -%}
                    {% break %}
                  {%- endif -%}
                {%- endif -%}
              {% endfor %}
            </div>
          {%- endif -%}
        </div>

        {% if article.older or article.newer %}
          <div class="post-nav">
            <div class="post-nav-inner">
              {% if article.older %}
                <a class="post-nav-link post-nav-link-older" href="{{ article.older.url }}">
                  <div class="post-nav-link-inner">
                    <h4 class="post-nav-direction">{{ "previous" | lc }}</h4>
                    <div class="post-nav-image">
                      {% include 'content-item', _staticItem: true, _entityData: article.older, _itemType: 'article', _id: article.older.id %}
                      <h4 class="post-nav-title">{{ article.older.title }}</h4>
                    </div>
                  </div>
                </a>
              {% endif %}
              {% if article.newer and article.older %}
                <div class="post-nav-separator"></div>
              {% endif %}
              {% if article.newer %}
                <a class="post-nav-link post-nav-link-newer" href="{{ article.newer.url }}">
                  <div class="post-nav-link-inner">
                    <h4 class="post-nav-direction">{{ "next" | lc }}</h4>

                    <div class="post-nav-image">
                      {% include 'content-item', _staticItem: true, _entityData: article.newer, _itemType: 'article', _id: article.newer.id %}
                      <h4 class="post-nav-title">{{ article.newer.title }}</h4>
                    </div>
                  </div>
                </a>
              {% endif %}
            </div>
          </div>
        {% endif %}

        {%- unless editmode -%}
          {%- if articleSettingsData.is_settings_published or previewmode -%}
            {%- if articleSettingsData.has_share_on_facebook_btn == true or articleSettingsData.has_share_on_twitter_btn == true or articleSettingsData.has_share_on_linkedin_btn == true -%}
              <h3>Share this article</h3>
              <div>
                {%- if articleSettingsData.has_share_on_facebook_btn == true -%}
                  <a href="#" onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=' + location.href, 'sharer', 'width=626,height=436');">Facebook </a>
                {%- endif -%}
                {%- if articleSettingsData.has_share_on_twitter_btn == true -%}
                  <a href="#" onclick="javascript:popup_share('http://twitter.com/home?status={{ article.title }} {{ site.url }}{{ article.url }}',800,320)">Twitter </a>
                {%- endif -%}
                {%- if articleSettingsData.has_share_on_linkedin_btn == true -%}
                  <a target="_blank" href="https://www.linkedin.com/shareArticle?mini=true&url={{ site.url }}{{ article.url | remove_first:'/' }}&title={{ article.title | remove:'&' }}">LinkedIn</a>
                {%- endif -%}
              </div>
            {%- endif -%}
          {%- endif -%}
        {%- endunless -%}
      </main>

      {% include "footer" %}
    </div>
  </div>
  {% include 'site-components' %}
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "template-tools" with 'article' %}
  <script>
    site.initPostPage();
    {% if editmode %}
      window.addEventListener('DOMContentLoaded', (event) => {
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
                "title": "Add share on Facebook button",
                "tooltip": "Visible in live & preview mode.",
                "type": "checkbox",
                "key": "has_share_on_facebook_btn",
                "states": {
                  "on": true,
                  "off": false
                }
              },
              {
                "title": "Add share on Twitter button",
                "tooltip": "Visible in live & preview mode.",
                "type": "checkbox",
                "key": "has_share_on_twitter_btn",
                "states": {
                  "on": true,
                  "off": false
                }
              },
              {
                "title": "Add share on LinkedIn button",
                "tooltip": "Visible in live & preview mode.",
                "type": "checkbox",
                "key": "has_share_on_linkedin_btn",
                "states": {
                  "on": true,
                  "off": false
                }
              },
              {
                "title": "Show related articles by tags",
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
            buttonTitleI18n: "article_settings",
            dataKey: 'article_settings',
            values: valuesObj,
            entityData: 'articleData',
            prevFunc: function(data) {
              var $articleComment = $('.comments'),
                $articleDate = $('.post-date'),
                $articleAuthor = $('.post-author'),
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
            }
          }
        );
      });
    {% endif %}
  </script>
</body>
</html>
