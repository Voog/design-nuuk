<!DOCTYPE html>
{% include "template-variables" with "article" %}
{% include "template-settings" %}
{% include "blog-article-variables" %}
{% include "article-settings-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% assign blog_article_page = true %}
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign articleSettingsData = article.data.article_settings -%}
</head>

<body class="post_page js-bg-picker-area {% include 'semimodal-class-names' %}">
  {% include "template-svg-spritesheet" %}
  <div class="background-color js-background-color"></div>

  <div class="container_wrap js-background-type {{ body_bg_type }}">
    {% include "header" %}
    <div class="container">
      {% if editmode %}
        <div class="bg-picker-top"><button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button></div>
      {% endif %}

      <main class="content" role="main" data-search-indexing-allowed="true">

        {% include "post-box" with "article" %}

        <div class="post_narrow">
          {% include "tags-post" %}
          <div id="comments" class="comments content-formatted{% if show_article_comments == false %} hide-post-comments{% endif %}" data-search-indexing-allowed="false">
            {% if article.comments_count > 0 %}
              <h4 class="comment_title js-comments">{{ "comments_for_count" | lc }}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span></h4>

              <div class="comment_messages content-formatted">
                {% for comment in article.comments reversed %}
                  <div class="comment edy-site-blog-comment">
                    <div class="flex_box">
                      <span class="p16 comment_author bold">{{ comment.author }}</span>
                      <span class="p16 comment_date mar_l-8 grey">{{ comment.created_at | format_date: "long" }}</span>
                    </div>
                    <span class="p16 comment_body">{{ comment.body_html }}</span>
                    <span class="comment_delete">{% removebutton %}</span>
                  </div>
                {% endfor %}
              </div>
            {% endif %}

            {% include "comment-form" %}
          </div>
        </div>

        <div class="content-formatted mar_t-48 js-related-articles{%- if articleSettingsData.show_related_articles != true %} d-none{%- endif -%}">
          {% assign current_article_id = article.id %}
          <h4 class="post_narrow">Continue reading</h4>

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
        </div>

        {% if article.older or article.newer %}
          <div class="post_nav">
            <div class="post_nav-inner">
              {% if article.older %}
                <a class="post_nav-link{% if article.newer %} post_nav-link--older{% else %} post_nav-link--one{% endif %}" href="{{ article.older.url }}">
                  <div class="post_nav-link--inner">
                    <h4 class="post_nav-direction">{{ "previous" | lc }}</h4>
                    <div class="post_nav-image">
                      {% include 'content-item', _staticItem: true, _entityData: article.older, _itemType: 'article', _id: article.older.id %}
                      <h4 class="post_nav-title">{{ article.older.title }}</h4>
                    </div>
                  </div>
                </a>
              {% endif %}
              {% if article.newer and article.older %}
                <div class="post_nav-separator"></div>
              {% endif %}
              {% if article.newer %}
                <a class="post_nav-link{% if article.older %} post_nav-link--newer{% else %} post_nav-link--one{% endif %}" href="{{ article.newer.url }}">
                  <div class="post_nav-link--inner">
                    <h4 class="post_nav-direction">{{ "next" | lc }}</h4>

                    <div class="post_nav-image">
                      {% include 'content-item', _staticItem: true, _entityData: article.newer, _itemType: 'article', _id: article.newer.id %}
                      <h4 class="post_nav-title">{{ article.newer.title }}</h4>
                    </div>
                  </div>
                </a>
              {% endif %}
            </div>
          </div>
        {% endif %}

        {%- if previewmode or editmode -%}
          {%- assign sharerTag = 'div' -%}
        {%- else -%}
          {%- assign sharerTag = 'a' -%}
        {%- endif -%}
        <div class="post_narrow">
          <div class="js-article-shared tags mar_t-32{%- if articleSettingsData.has_share_on_facebook_btn != true and articleSettingsData.has_share_on_twitter_btn != true and articleSettingsData.has_share_on_linkedin_btn != true %} d-none{%- endif -%}">
            <h4>Share this article</h4>
            <nav class="post_tags menu-sub mar_t-16">
              <ul class="menu">
                <li class="menu-item">
                  <{{sharerTag}} class="menu-link facebook{%- if articleSettingsData.has_share_on_facebook_btn != true %} d-none{%- endif -%}"{% unless previewmode %} href="#" onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=' + location.href, 'sharer', 'width=626,height=436');"{% endunless %}>
                    Facebook
                  </{{sharerTag}}>
                    <span class="mar_l-8 mar_r-8{%- if articleSettingsData.has_share_on_facebook_btn != true and articleSettingsData.has_share_on_twitter_btn != true or articleSettingsData.has_share_on_linkedin_btn == true %} d-none{%- endif -%}">
                      &bull;
                    </span>
                  <{{sharerTag}} class="menu-link twitter{%- if articleSettingsData.has_share_on_twitter_btn != true %} d-none{%- endif -%}"{% unless previewmode %} href="#" onclick="javascript:popup_share('http://twitter.com/home?status={{ article.title }} {{ site.url }}{{ article.url }}',800,320)"{% endunless %}>
                    Twitter
                  </{{sharerTag}}>
                    <span class="mar_l-8 mar_r-8{%- if articleSettingsData.has_share_on_twitter_btn != true and articleSettingsData.has_share_on_linkedin_btn != true %} d-none{%- endif -%}">
                      &bull;
                    </span>
                  <{{sharerTag}} class="menu-link linkedin{%- if articleSettingsData.has_share_on_linkedin_btn != true %} d-none{%- endif -%}"{% unless previewmode %} target="_blank" href="https://www.linkedin.com/shareArticle?mini=true&url={{ site.url }}{{ article.url | remove_first:'/' }}&title={{ article.title | remove:'&' }}"{% endunless %}>
                    LinkedIn
                  </{{sharerTag}}>
                </li>
              </ul>
            </nav>
          </div>
        </div>

      </main>

      {% include "footer" %}
    </div>
  </div>

  {% include "site-signout" %}
  {% include 'settings-popover', _articlePage: true %}
  {% include "javascripts" %}
  {% include "template-tools" with 'article' %}
  <script>
    site.initPostPage();
  </script>
</body>
</html>
