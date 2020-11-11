<!DOCTYPE html>
{% include "template-variables" with "article" %}
{% include "blog-article-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_article_page = true %}
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign articleSettingsKey = 'article_settings_' | append: article.id -%}
  {%- assign articleSettingsData = article.data[articleSettingsKey] -%}
</head>

<body class="post-page js-bg-picker-area {% include 'semimodal-class-names' %}">
  {% include "template-svg-spritesheet" %}
  {% if editmode %}
    <div class="bg-picker-top"><button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button></div>
  {% endif %}
  <div class="background-color js-background-color"></div>

  <div class="flex_box">
    {% include "header" %}
    <div class="container">
      {% if editmode %}
        <div class="mar_b-32">
          <button disabled class="js-article-settings-btn">Article settings</button>
        </div>
      {% endif %}
      {% include "tags-post" %}

      <main class="content" role="main" data-search-indexing-allowed="true">

        {% include "post-box" with "article" %}

        {% if article.older or article.newer %}
          <div class="post-nav">
            <div class="post-nav-inner">
              {% if article.older %}
                <a class="post-nav-link post-nav-link-older" href="{{ article.older.url }}">
                  <div class="post-nav-link-inner">
                    <div class="post-nav-direction">{{ "previous" | lc }}</div>
                    <div class="post-nav-title">{{ article.older.title }}</div>
                  </div>
                </a>
              {% endif %}

              {% if article.newer %}
                <a class="post-nav-link post-nav-link-newer" href="{{ article.newer.url }}">
                  <div class="post-nav-link-inner">
                    <div class="post-nav-direction">{{ "next" | lc }}</div>
                    <div class="post-nav-title">{{ article.newer.title }}</div>
                  </div>
                </a>
              {% endif %}
            </div>
          </div>
        {% endif %}

        <section id="comments" class="comments content-formatted" data-search-indexing-allowed="false">
          {% if article.comments_count > 0 %}
            <h2 class="comments-title">{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h2>

            <div class="comment-messages content-formatted">
              {% for comment in article.comments reversed %}
                <div class="comment edy-site-blog-comment">
                  <span class="comment-body">{{ comment.body_html }}</span>
                  <span class="comment-author">({{ comment.author }},</span>
                  <span class="comment-date">{{ comment.created_at | format_date: "long" }})</span>
                  <span class="comment-delete">{% removebutton %}</span>
                </div>
              {% endfor %}
            </div>
          {% endif %}

          {% include "comment-form" %}
        </section>

        {%- if articleSettingsData.show_related_articles -%}
          {%- if articleSettingsData.is_settings_published or previewmode or editmode -%}
            {% assign current_article_id = article.id %}

            <h3>Continue reading</h3>
            <div>
              <div class="flex_row flex_row-3 mar_0-8-neg">
                {%- load articles to "articles" q.article.tag$in=article.tags -%}
                {% for article in articles %}
                  {%- if article.id != current_article_id -%}
                    <div class="flex_row-3--item">
                      <div class="mar_0-8">
                        {% include "post-box" %}
                      </div>
                    </div>
                    {%- if forloop.index == 3 -%}
                      {% break %}
                    {%- endif -%}
                  {%- endif -%}
                {% endfor %}
              </div>
            </div>
          {%- endif -%}
        {%- endif -%}

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
        {% if article.data[articleSettingsKey] %}
          var valuesObj = {{ article.data[articleSettingsKey] | json }};
        {% else %}
          var valuesObj = {};
        {% endif %}

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
                "title": "Publish settings changes",
                "type": "checkbox",
                "key": "is_settings_published",
                "states": {
                  "on": true,
                  "off": false
                }
              }
            ],
            dataKey: '{{articleSettingsKey}}',
            values: valuesObj,
            entityData: 'articleData'
          }
        );
      });
    {% endif %}
  </script>
</body>
</html>
