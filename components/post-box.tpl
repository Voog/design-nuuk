<article class="post{% if blog_listing_page %} translated-y--100{% endif %}">
  <header class="post-header">
    {% include 'content-item', _entityData: article, _itemType: 'article', _id: article.id %}
    <h3 class="post-title">{% if post-box == "article" %}{% editable article.title %}{% else %}<a href="{{ article.url }}">{{ article.title }}</a>{% endif %}</h3>
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

    {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

    {% if article_year == current_year %}
      {% assign article_date_format = "long_without_year" %}
    {% else %}
      {% assign article_date_format = "long" %}
    {% endif %}

    <div class="post-details">
      <time class="post-date{% if show_article_date == false %} hide-post-date{% endif %}{% if article_data_show_date_defined != true %} site-data{% endif %}"
        datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}
      </time>
      <span class="date-separator{% if show_article_author == false or show_article_date == false %} hide-separator{% endif %}"> - </span>
      <div class="post-author{% if show_article_author == false %} hide-post-author{% endif %}{% if article_data_show_author_defined != true %} site-data{% endif %}">
        {{ article.author.name }}
      </div>
    </div>
  </div>
</article>
