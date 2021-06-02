{% if article_year == current_year %}
  {% assign article_date_format = "long_without_year" %}
{% else %}
  {% assign article_date_format = "long" %}
{% endif %}

<article class="post_wrapper post {%- if _isArticle == true %} article_item {% else %} listing_item{%- endif -%}">
  {% if _isArticle == true %}
    {%- assign titleTag = 'h2' -%}
  {% else %}
    {%- assign titleTag = 'h3' -%}
  {% endif %}
  {% capture post_title %}
    <{{titleTag}} class="post_title{%- unless article.data[itemImageKey] != blank or editmode %} mar_t-0{%- endunless -%}">
      <span {% if post-box != "article" %}class="animate_border-bottom"{% endif %}>
        {% if _isArticle == true %}
          {% editable article.title %}
        {% else %}
          {{ article.title }}
        {% endif %}
      </span>
    </{{titleTag}}>
  {% endcapture %}

  {%- capture post_details -%}
    <div class="post_details mar_b-32">
      <time class="post_date{% if show_article_date == false %} hide-post-date{% endif %}{% if article_data_show_date_defined != true %} site-data{% endif %}"
        datetime="{{ article.created_at | date: '%Y-%m-%d' }}">{{ article.created_at | format_date: article_date_format }}
      </time>
      <span class="date-separator{% if show_article_author == false or show_article_date == false %} hide-separator{% endif %}"> &#8212; </span>

      <div class="post_author{% if show_article_author == false %} hide-post-author{% endif %}{% if article_data_show_author_defined != true %} site-data{% endif %}">
        {{ article.author.name }}
      </div>
    </div>
  {%- endcapture -%}

  {% if _isArticle == true %}
    <div class="post_narrow content-formatted{%- if article.data[itemImageKey] != blank or editmode %} mar_b-40{%- endif -%}">
      {{ post_title }}
      {{ post_details }}
    </div>
  {% endif %}

  <header class="post_header{% if _isArticle == true %} post_header-stretch{% endif %}">
    {% if _isArticle == true and editmode == true %}
      {%- assign isPostImageStatic = false -%}
    {% else %}
      {%- assign isPostImageStatic = true -%}
    {% endif %}
    {%- if article.data[itemImageKey] != blank or editmode -%}
      <div class="p-rel">
        <div {% unless article.published? or _isArticle == true %}class="post_unpublished"{%- endunless -%}>
          {% include 'content-item', _imageData: article.data[itemImageKey], _entityData: article, _itemType: 'article', _id: article.id, _staticItem: isPostImageStatic, _targetWidth: _targetWidth %}
        </div>
        {%- unless article.published? or _isArticle == true -%}
          <div class="post_unpublished-overlay">
            <div class="post_unpublished-overlay--box">
              {{ "draft" | lce  | escape_once }}
            </div>
          </div>
        {%- endunless -%}

        {%- unless _isArticle == true -%}
          <div class="post_image-overlay">
            <div class="post_image-overlay--box">
            </div>
          </div>
        {%- endunless -%}
      </div>
    {%- endif -%}

    {% if post-box != "article" %}
      {{ post_title }}
    {% endif %}
  </header>

  <div class="post_content{% if _isArticle == true %} post_narrow{% endif %}">
    {% unless _isArticle == true %}
      <div class="post_excerpt mar_b-16"><p>{{ article.excerpt }}</p></div>
    {% endunless %}

    {% if _isArticle == true %}
      <div class="post_excerpt content-formatted content-formatted--overflowed-images mar_t-48 mar_b-64" {{ edy_intro_edit_text }}>{% editable article.excerpt %}</div>
      <div class="post_body content-formatted content-formatted--overflowed-images mar_b-64">{% editable article.body %}</div>
      <div class="post_body content-formatted content-formatted--overflowed-images">{% content name="additional_body" bind="Article" %}</div>
    {% endif %}

    {% assign article_year = article.created_at | format_date: "%Y" | to_num %}

    {% if post-box != "article" %}
      {{ post_details }}
    {% endif %}
  </div>
</article>
