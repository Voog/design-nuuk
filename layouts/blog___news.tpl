<!DOCTYPE html>
{% include "template-variables" %}
{% include "blog-article-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign blog_listing_page = true -%}
</head>

<body class="blog-page js-bg-picker-area{% include 'semimodal-class-names' %}">
  {% include "template-svg-spritesheet" %}
  {% if editmode %}
    <div class="bg-picker-top"><button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button></div>
    <div class="content_settings-btn layout_settings-btn js-prevent-sideclick">
      <button class="js-blog-settings-editor js-settings-editor-btn"></button>
    </div>
  {% endif %}
  <div class="background-color js-background-color"></div>

  <div class="flex_box js-background-type {{ body_bg_type }}">
    {% include "header" %}

    <div class="container">
      {% include "tags-blog" %}

      <main class="content" role="main" data-search-indexing-allowed="true">
        <section class="content-body content-formatted post-intro-content" {{ edy_intro_edit_text }}>{% content %}</section>

        <div class="mar_b-16">{% addbutton %}</div>
        <div class="blog_listing-wrapper">
          {% for article in articles %}
            <div class="blog_listing-item">
            {% include "article-settings-variables" %}
            {% include "post-box" %}
            </div>
          {% endfor %}
        </div>
      </main>

      {% include "footer" %}
    </div>
  </div>
  {% include 'site-components' %}
  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "template-tools" %}
  <script>
    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = "{{ site.url }}{{ page.path }}";
      if (currentUrl === blogUrl) {
        $(".js-tags-all").addClass("active");
      };
    });
    site.initBlogPage();

    {% if editmode %}
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
            buttonTitleI18n: "blog_settings",
            dataKey: 'article_settings',
            values: valuesObj,
            entityData: 'siteData',
            prevFunc: function(data) {
              var $articleDate = $('.post-date.site-data'),
                $dateSeparator = $('.post-date.site-data + .date-separator'),
                $articleAuthor = $('.post-author.site-data');

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
    {% endif %}
  </script>
</body>
</html>
