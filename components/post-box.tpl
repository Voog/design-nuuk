{% if article_year == current_year %}
  {% assign article_date_format = "long_without_year" %}
{% else %}
  {% assign article_date_format = "long" %}
{% endif %}

<article class="post_wrapper post">
  <header class="post_header">

    {% if post-box == "article" %}
      {%- assign titleTag = 'h2' -%}
    {% else %}
      {%- assign titleTag = 'h3' -%}
    {% endif %}
    {% capture post_title %}
      <{{titleTag}} class="post_title{%- unless article.data[itemImageKey] != blank or editmode %} mar_t-0{%- endunless -%}">
        {% if post-box == "article" %}
          {% editable article.title %}
        {% else %}
          {{ article.title }}
        {% endif %}
      </{{titleTag}}>
    {% endcapture %}

    {%- capture post_details -%}
      <div class="post_details mar_b-32 mar_t-16 content-formatted">
        <time class="post_date{% if show_article_date == false %} hide-post-date{% endif %}{% if article_data_show_date_defined != true %} site-data{% endif %}"
          datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}
        </time>
        <span class="date-separator{% if show_article_author == false or show_article_date == false %} hide-separator{% endif %}"> - </span>

        <div class="post_author{% if show_article_author == false %} hide-post-author{% endif %}{% if article_data_show_author_defined != true %} site-data{% endif %}">
          {{ article.author.name }}
        </div>
      </div>
    {%- endcapture -%}

    {% if post-box == "article" %}
      <div class="post_narrow mar_b-56">
        {{ post_title }}
        {{ post_details }}
      </div>
    {% endif %}
    {% if post-box == "article" and editmode == true %}
      {%- assign isPostImageStatic = false -%}
    {% else %}
      {%- assign isPostImageStatic = true -%}
    {% endif %}
    {%- if article.data[itemImageKey] != blank or editmode -%}
      {% include 'content-item', _imageData: article.data[itemImageKey], _entityData: article, _itemType: 'article', _id: article.id, _staticItem: isPostImageStatic, _targetWidth: '2999' %}
    {%- endif -%}

    {% if post-box != "article" %}
      {{ post_title }}
    {% endif %}
  </header>

  <div class="post_content{% if post-box == "article" %} post_narrow{% endif %}">
    {% unless post-box == "article" %}
      <div class="post_excerpt content-formatted">{{ article.excerpt }}</div>
    {% endunless %}

    {% if post-box == "article" %}
      <div class="post_excerpt content-formatted mar_b-32" {{ edy_intro_edit_text }}>{% editable article.excerpt %}</div>
      <div class="post_body content-formatted mar_b-32">{% editable article.body %}</div>
      <div class="post_body content-formatted">{% content name="additional_body" bind="Article" %}</div>
    {% endif %}

    {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

    {% if post-box != "article" %}
      {{ post_details }}
    {% endif %}
  </div>
</article>
