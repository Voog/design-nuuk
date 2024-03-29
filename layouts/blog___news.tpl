<!DOCTYPE html>
{% include "template-settings" %}
{% include "template-variables" %}
{% include "blog-article-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %} {% include 'semimodal-class-names' %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign blog_listing_page = true -%}
  {%- assign blog_settings = page.data[blogLayoutKey] -%}
  {%- assign default_blog_settings = template_settings.page.blog_settings.value -%}
</head>

<body class="blog-page body-bg_picker--area {{ body_bg_type }}">
  {% include "template-svg-spritesheet" %}
  <div class="body-bg_color"></div>

  <div class="container_wrap">
    {% include "header" %}

    <div class="pad_container p-rel">
    {% if editmode %}
      <div class="mar_b-32">
        <div class="bg-picker-top">
          <button
            class="voog-bg-picker-btn body_bg-picker--btn bg-picker {{ bodyBgKey }}-picker"
            data-bg_key="{{bodyBgKey}}"
            data-type_picture="false"
            data-type_color="true"
            data-color_elem=".body-bg_color"
            data-picker_area_elem=".body-bg_picker--area"
            data-picker_elem=".{{ bodyBgKey }}-picker"
            data-bg-color="{{ body_bg_color }}"
          ></button>
        </div>
        <div class="mar_b-16 add-page">{% addbutton %}</div>
      </div>
    {% endif %}
      <div class="container">
        <main class="content" role="main" data-search-indexing-allowed="true">
          {%- assign content_title = "content" | lce -%}
          {%- assign content_title_tooltip = "content_tooltip_specific_page" | lce -%}
          <section class="content-body content-formatted mar_b-64">
            {% content title=content_title title_tooltip=content_title_tooltip %}
          </section>
          {% include "blog-news-tags" %}

          <div class="blog_listing-wrapper" data-search-indexing-allowed="false">
            {% for article in articles %}
              {%- assign hideImage = article.data.article_settings.hide_article_image_in_list -%}
              {%- assign showBorder = article.data.article_settings.show_border_around_article -%}

              {%- assign articleCount = blog_settings.no_of_unarchived_articles | default: default_blog_settings.no_of_unarchived_articles -%}

              {%- if forloop.index > articleCount -%}
                {%- assign overLimit = true -%}
              {%- else -%}
                {%- assign overLimit = false -%}
              {%- endif -%}

              {%- capture article_element_full -%}
                <a class="blog_listing-link animate_wrap" href="{{ article.url }}">
                  {% include "article-settings-variables" %}
                  {%- if forloop.first -%}
                    {%- assign targetWidth = '1280' -%}
                  {%- else -%}
                    {%- assign targetWidth = '600' -%}
                  {%- endif -%}
                  {% include "post-box", _targetWidth: targetWidth, _hideImage: hideImage, _showArticlesAsList: false %}
                </a>
              {%- endcapture -%}

              {%- capture article_element_list -%}
                <a class="blog_listing-link animate_wrap" href="{{ article.url }}">
                  {% include "post-box", _showArticlesAsList: true %}
                </a>
              {%- endcapture -%}

              {%- assign show_older_articles_as_list = blog_settings.show_older_articles_as_list | default: default_blog_settings.show_older_articles_as_list -%}

              {% if show_older_articles_as_list %}
                {% if overLimit == false %}
                  <div class="blog_listing-item {{ blog_settings.blog_layout | default: default_blog_settings.blog_layout }}{% if hideImage and showBorder %} blog_listing-item-border{% endif %}">
                    {{ article_element_full }}
                  </div>
                {% else %}
                  </div>
                  <div class="w-100p mar_t-32 blog_listing-item-list">
                    {{ article_element_list }}
                {% endif %}
              {% else %}
                <div class="blog_listing-item {{ blog_settings.blog_layout | default: default_blog_settings.blog_layout }}{% if hideImage and showBorder %} blog_listing-item-border{% endif %}">
                  {{ article_element_full }}
                </div>
              {% endif %}
            {% endfor %}
          </div>
        </main>
      </div>
    </div>
    {% include "footer" %}
  </div>

  {% include 'template-tooltips' %}
  {% include "site-signout" %}
  {% include 'settings-popover', _blogPage: true %}
  {% include "javascripts" %}

  <script>
    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = "{{ site.url }}{{ page.path }}";
      if (currentUrl === blogUrl) {
        $(".js-tags-all").addClass("active");
      };

      if ($('.js-tags-item.active').length >= 1) {
        $('.blog-tags').show();
      }
    });
  </script>
</body>
</html>
