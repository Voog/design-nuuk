<!DOCTYPE html>
{% assign blog_article_page = true %}
{% include "template-settings" %}
{% include "template-variables" with "article" %}
{% include "blog-article-variables" %}
{% include "article-settings-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %} {% include 'semimodal-class-names' %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign articleSettingsData = article.data.article_settings -%}
</head>

<body class="post_page body-bg_picker--area {{ body_bg_type }}">
  {% include "template-svg-spritesheet" %}
  <div class="body-bg_color"></div>

  <div class="container_wrap">
    {% include "header" %}
    <div class="container">
      {% if editmode %}
        <div class="bg-picker-top">
          <button
            class="voog-bg-picker-btn body_bg-picker--btn bg-picker {{bodyBgKey}}-picker"
            data-bg_key="{{bodyBgKey}}"
            data-type_picture="false"
            data-type_color="true"
            data-color_elem=".body-bg_color"
            data-picker_area_elem=".body-bg_picker--area"
            data-picker_elem =".{{bodyBgKey}}-picker"
            data-bg-color="{{ body_bg_color }}"
            data-entity="articleData"
          ></button>
        </div>
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
                      <span class="comment_author bold">{{ comment.author }}</span>
                      <span class="comment_date mar_l-8">{{ comment.created_at | format_date: "long" }}</span>
                    </div>
                    <span class="comment_body">{{ comment.body_html }}</span>
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
          <div class="post_nav content-formatted">
            <div class="post_nav-inner">
              {% if article.older %}
              {%- if article.older.data[itemImageKey] != blank -%}
                {%- assign isOldArticleImage = true -%}
              {% endif %}
                <a class="post_nav-link{% if article.newer %} post_nav-link--older{% else %} post_nav-link--one{% endif %}" href="{{ article.older.url }}">
                  <div class="post_nav-link--inner{%- if isOldArticleImage != true %} without-image{%- endif -%}">
                    <h4 class="post_nav-direction">{{ "previous" | lc }}</h4>
                    {%- if isOldArticleImage == true -%}
                      <div class="post_nav-image">
                        {% include 'content-item', _imageData: article.older.data[itemImageKey], _staticItem: true, _entityData: article.older, _itemType: 'article', _id: article.older.id, _targetWidth: '600' %}
                        <div class="p14 post_nav-title">{{ article.older.title }}</div>
                      </div>
                    {%- else -%}
                      <div class="p14 post_nav-title">{{ article.older.title }}</div>
                    {%- endif -%}
                  </div>
                </a>
              {% endif %}
              {% if article.newer and article.older %}
                <div class="post_nav-separator"></div>
              {% endif %}
              {% if article.newer %}
                {%- if article.newer.data[itemImageKey] != blank -%}
                  {%- assign isNewArticleImage = true -%}
                {% endif %}
                <a class="post_nav-link{% if article.older %} post_nav-link--newer{% else %} post_nav-link--one{% endif %}" href="{{ article.newer.url }}">
                  <div class="post_nav-link--inner{%- if isNewArticleImage != true %} without-image{%- endif -%}">
                    <h4 class="post_nav-direction">{{ "next" | lc }}</h4>
                    {%- if isNewArticleImage == true -%}
                      <div class="post_nav-image">
                        {% include 'content-item', _imageData: article.newer.data[itemImageKey], _staticItem: true, _entityData: article.newer, _itemType: 'article', _id: article.newer.id, _targetWidth: '600' %}
                        <div class="p14 post_nav-title">{{ article.newer.title }}</div>
                      </div>
                    {%- else -%}
                      <div class="p14 post_nav-title">{{ article.newer.title }}</div>
                    {%- endif -%}
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
</body>
</html>
