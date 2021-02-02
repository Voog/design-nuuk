<!DOCTYPE html>
{% include "template-settings" %}
{% include "template-variables" %}
{% include "blog-article-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %} {% include 'semimodal-class-names' %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign blog_listing_page = true -%}
</head>

<body class="blog-page body-bg_picker--area {{ body_bg_type }}">
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
            data-picker_elem=".{{bodyBgKey}}-picker"
            data-bg-color="{{ body_bg_color }}"
          ></button>
        </div>
      {% endif %}

      <main class="content" role="main" data-search-indexing-allowed="true">
        <section class="content-body content-formatted post_intro-content" {{ edy_intro_edit_text }}>{% content %}</section>
        {% include "blog-news-tags" %}
        <div class="mar_b-16">{% addbutton %}</div>
        <div class="blog_listing-wrapper" data-search-indexing-allowed="false">
          {% for article in articles %}
            <div class="blog_listing-item hover">
              <a href="{{ article.url }}">
              {% include "article-settings-variables" %}
              {% include "post-box" %}
              </a>
            </div>
          {% endfor %}
        </div>
      </main>

    </div>
    {% include "footer" %}
  </div>

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
