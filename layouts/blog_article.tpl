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
    <div class="pad_container p-rel">
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
      <div class="container">
        <main class="content" role="main" data-search-indexing-allowed="true">

          {% include "post-box", _isArticle: true, _targetWidth: '2048', _showImage: true %}

          <div class="post_narrow">
            {% include "tags-post" %}
            <div id="comments" class="comments content-formatted{% if show_article_comments == false %} hide-post-comments{% endif %}" data-search-indexing-allowed="false">
              <h4 class="comment_title js-comments">
                {{ "comments_for_count" | lc }}
                {% if article.comments_count > 0 %}
                  <span class="comment_count-separator">&#9642;</span>
                  <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span>
                {% endif %}
              </h4>
              {% if article.comments_count > 0 %}
                <div class="comment_messages content-formatted">
                  {% for comment in article.comments reversed limit: 2 %}
                    <div class="comment edy-site-blog-comment">
                      <div class="flex_box">
                        <span class="comment_author bold">{{ comment.author }}</span>
                        <span class="comment_date mar_l-8">{{ comment.created_at | format_date: "long" }}</span>
                      </div>
                      <span class="comment_body">{{ comment.body_html }}</span>
                      <span class="comment_delete">{% removebutton %}</span>
                    </div>
                  {% endfor %}

                  <div class="comments_secondary comments_hidden">
                    {% for comment in article.comments reversed  offset: 2 %}
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

                  {%- if article.comments.size >= 3 -%}
                    <div class="comment_more-btn js-read-more-comments">{{ "read_more" | lc }} </div>
                  {%- endif -%}
                </div>
              {% endif %}

              {% include "comment-form" %}
            </div>
          </div>

          {%- load articles to "articles" tag=article.tag_names q.article.published_at.$not_eq="" q.article.id.$not_eq=article.id limit=3 -%}
          {% if articles.size >= 1 %}
            <div class="mar_t-48 js-related-articles{%- if articleSettingsData.show_related_articles != true %} d-none{%- endif -%}">
              <h4 class="post_narrow">{{ "continue_reading" | lc }}</h4>

              <div class="flex_row flex_row-3 mar_0-16-neg related_posts mar_t-32">
                {% for article in articles %}
                  <div class="flex_row-3--item">
                    <div class="mar_0-16">
                      <a class="blog_listing-link animate_wrap" href="{{ article.url }}">
                        {% include "post-box", _targetWidth: '600' %}
                      </a>
                    </div>
                  </div>
                {% endfor %}
              </div>
            </div>
          {% endif %}

          <div class="post_nav content-formatted">
            <div class="post_nav-inner">
              {% if article.older %}
                {%- if article.older.data[itemImageKey] != blank -%}
                  {%- assign isOldArticleImage = true -%}
                {% endif %}
                <a class="post_nav-link post_nav-link--older" href="{{ article.older.url }}">
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
              {% else %}
                <div class="post_nav-link post_nav-link--older">
                  <div class="post_nav-link--inner static without-image">
                    <h4 class="post_nav-direction">{{ "previous" | lc }}</h4>
                  </div>
                </div>
              {% endif %}

              <div class="post_nav-separator"></div>

              {% if article.newer %}
                {%- if article.newer.data[itemImageKey] != blank -%}
                  {%- assign isNewArticleImage = true -%}
                {% endif %}
                <a class="post_nav-link post_nav-link--newer" href="{{ article.newer.url }}">
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
              {% else %}
                <div class="post_nav-link post_nav-link--newer">
                  <div class="post_nav-link--inner static without-image">
                    <h4 class="post_nav-direction">{{ "next" | lc }}</h4>
                  </div>
                </div>
              {% endif %}
            </div>
          </div>

          {%- if previewmode or editmode or article.published? != true -%}
            {%- assign sharerTag = 'div' -%}
          {%- else -%}
            {%- assign sharerTag = 'a' -%}
          {%- endif -%}
          <div class="post_narrow">
            <div class="js-article-shared tags mar_t-32{%- if articleSettingsData.has_share_on_facebook_btn != true and articleSettingsData.has_share_on_twitter_btn != true and articleSettingsData.has_share_on_linkedin_btn != true %} d-none{%- endif -%}">
              <h4>{{ "share_this_article" | lc }}</h4>
              <nav class="post_tags menu-sub mar_t-16">
                <ul class="menu">
                  <li class="menu-item">
                    <{{sharerTag}} class="menu-link facebook{%- if articleSettingsData.has_share_on_facebook_btn != true %} d-none{%- endif -%}"{% unless previewmode %} href="#" onclick="window.open('https://www.facebook.com/sharer/sharer.php?u=' + location.href, 'sharer', 'width=626,height=436');"{% endunless %}>
                      Facebook
                    </{{sharerTag}}>
                      <span class="mar_l-8 mar_r-8{%- if articleSettingsData.has_share_on_facebook_btn != true and articleSettingsData.has_share_on_twitter_btn != true or articleSettingsData.has_share_on_linkedin_btn == true %} d-none{%- endif -%}">
                        &bull;
                      </span>
                    <{{sharerTag}} class="menu-link twitter{%- if articleSettingsData.has_share_on_twitter_btn != true %} d-none{%- endif -%}"{% unless previewmode %} href="#" onclick="javascript:popup_share('https://twitter.com/home?status={{ article.title }} {{ site.url }}{{ article.url }}',800,320)"{% endunless %}>
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
      </div>
    </div>
    {% include "footer" %}
  </div>

  {% include 'template-tooltips' %}
  {% include "site-signout" %}
  {% include 'settings-popover', _articlePage: true %}
  {% include "javascripts" %}
</body>
</html>
