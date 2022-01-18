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
            class="voog-bg-picker-btn body_bg-picker--btn bg-picker {{bodyBgKey}}-picker"
            data-bg_key="{{bodyBgKey}}"
            data-type_picture="false"
            data-type_color="true"
            data-color_elem=".body-bg_color"
            data-picker_area_elem=".body-bg_picker--area"
            data-picker_elem=".{{bodyBgKey}}-picker"
            data-bg-color="{{ body_bg_color }}"
          ></button>
        </div>
        <div class="mar_b-16 add-page">{% addbutton %}</div>
      </div>
    {% endif %}
      <div class="container">
        <main class="content" role="main" data-search-indexing-allowed="true">
          <section class="content-body content-formatted mar_b-64" {{ edy_intro_edit_text }}>{% content %}</section>
          {% include "blog-news-tags" %}
          {% assign currentDate = "now" | date: "%s" %}
          
          <div class="blog_listing-wrapper" data-search-indexing-allowed="false">
            {% for article in articles %}
              {%- if article.data.article_settings.show_article_image_in_list == true -%}
                {%- assign showImage = true -%}
              {%- else -%}
                {%- assign showImage = false -%}
              {%- endif -%}

              {%- assign articleDate = article.created_at | date: '%s' -%}
              {%- assign diffSeconds = currentDate | minus: articleDate -%}
              {%- assign diffDays = diffSeconds | divided_by: 3600 | divided_by: 24 -%}

              {%- if diffDays > 151 -%}
                {%- assign overLimit = true -%}
              {%- else -%}
                {%- assign overLimit = false -%}
              {%- endif -%}

              {% capture article_element_full %}
                <a class="blog_listing-link animate_wrap" href="{{ article.url }}">
                  {% include "article-settings-variables" %}
                  {%- if forloop.index == 1 -%}
                    {%- assign targetWidth = '1280' -%}
                  {%- else -%}
                    {%- assign targetWidth = '600' -%}
                  {%- endif -%}
                  {% include "post-box", _targetWidth: targetWidth, _showImage: showImage, _showArticlesAsList: false %}
                </a>
              {% endcapture %}

              {% capture article_element_list %}
                <a class="blog_listing-link animate_wrap" href="{{ article.url }}">
                  {% include "article-settings-variables" %}
                  {% include "post-box", _showArticlesAsList: true %}
                </a>
              {% endcapture %}


              
              <div class="blog_listing-item {{ blog_settings.blog_layout }}{% if showImage == false %} blog_listing-item-border{% endif %}{% if overLimit == true %} over-limit{% endif %}{% if show_articles_as_list == true and overLimit == true %} d-none{% endif %}">
                {{ article_element_full }}
              </div>
              <div class="w-100p blog_listing-item-list {% if overLimit %}over-limit {% endif %}{% if show_articles_as_list != true or overLimit != true %}d-none{% endif %}">
                {{ article_element_list }}
              </div>
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
