<article class="post{% if blog_listing_page %} translated-y--100{% endif %}">
  <header class="post-header">
    {% unless article.data.item_image %}
      {% assign article_image_state = "without-image" %}
    {% else %}
      {% assign article_image_state = "with-image" %}
      {% if article.data.image_crop_state %}
        {% assign article_image_crop_state = article.data.image_crop_state %}
      {% else %}
        {% assign article_image_crop_state = "not-cropped" %}
      {% endif %}
    {% endunless %}

    {% if editmode %}
      <div class="content-item-box {{ article_image_state }} js-content-item-box not-loaded" data-item-type="article" data-item-id="{{ article.id }}">
        <div class="item-top mar_b-32">
          <button class="btn bg-crop-btn {% if article.data.item_image == blank %}is-hidden{% else %}is-visible{% endif %} js-toggle-crop-state">
            <svg width="20" height="20" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg">
              <use xlink:href="#ico-toggle"></use>
            </svg>
          </button>
          <div class="top-inner aspect-ratio-inner image-drop-area {{ article_image_crop_state }} js-content-item-img-drop-area js-lazyload" data-image="{{ article.data.item_image.url }}"></div>
        </div>
      </div>
    {% else %}
      <a class="content-item-box {{ article_image_state }} js-content-item-box not-loaded" href="{{ article.url }}">
        <div class="item-top mar_b-32">
          <div class="top-inner of-hidden">
            {% if article.data.item_image != blank %}
              <div class="loader js-loader"></div>
              {%- assign imageClass = "item-image " | append: article_image_crop_state -%}
              {% include "lazy-image", _data: article.data.item_image, _targetWidth: '1400', _className: imageClass  %}
            {% else %}
              <div class="item-placeholder">{{ article.title | truncate: 50 }}</div>
            {% endif %}
          </div>
        </div>
      </a>
    {% endif %}

    <h2 class="post-title">{% if post-box == "article" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h2>
    {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

    {% if article_year == current_year %}
      {% assign article_date_format = "long_without_year" %}
    {% else %}
      {% assign article_date_format = "long" %}
    {% endif %}

    <time class="post-date" datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}</time>
    <div class="post-author">{{ article.author.name }}</div>
  </header>

  <div class="post-content">
    {% unless post-box == "article" %}
      <div class="post-excerpt content-formatted">{{ article.excerpt }}</div>
      <a class="post-read-more-btn" href="{{ article.url }}">{{ "read_more" | lc }}</a>
    {% endunless %}

    {% if post-box == "article" %}
      <div class="post-excerpt content-formatted" {{ edy_intro_edit_text }}>{% editable article.excerpt %}</div>
      <div class="post-body content-formatted">{% editable article.body %}</div>
      <div class="post-body content-formatted">{% content name="additional_body" bind="Article" %}</div>
    {% endif %}
  </div>

  <footer class="post-footer">
    {% unless post-box == "article" %}
      <div class="post-comments-count">
        <a href="{{ article.url }}#comments">{% case article.comments_count %}{% when 0 %}{{ "no_comments" | lc }}{% else %}{{ "comments_for_count" | lc}}: <span class="edy-site-blog-comments-count">{{ article.comments_count }}</span>{% endcase %}</a>
      </div>
    {% endunless %}
  </footer>
</article>
