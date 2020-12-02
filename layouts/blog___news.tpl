<!DOCTYPE html>
{% include "template-variables" %}
{% include "blog-article-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign blog_listing_page = true -%}
</head>

<body class="blog-page js-bg-picker-area{% include 'semimodal-class-names' %}">
  {% include "template-svg-spritesheet" %}
  {% if editmode %}
    <div class="bg-picker-top"><button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button></div>
  {% endif %}
  <div class="background-color js-background-color"></div>

  <div class="flex_box js-background-type {{ body_bg_type }}">
    {% include "header" %}

    <div class="container">
      <main class="content" role="main" data-search-indexing-allowed="true">
        <section class="content-body content-formatted post_intro-content" {{ edy_intro_edit_text }}>{% content %}</section>

        <div class="mar_b-16">{% addbutton %}</div>
        <div class="blog_listing-wrapper">
          {% for article in articles %}
            <div class="blog_listing-item">
            {% include "article-settings-variables" %}
            {% include "post-box" %}
            </div>
          {% endfor %}
        </div>
      </main>

      {% include "footer" %}
    </div>
  </div>
  {% include 'site-components' %}
  {% include "site-signout" %}
  {% include 'settings-popover', _blogPage: true %}
  {% include "javascripts" %}
  {% include "template-tools" %}
  <script>
    $(document).ready(function() {
      currentUrl = window.location.href;
      blogUrl = "{{ site.url }}{{ page.path }}";
      if (currentUrl === blogUrl) {
        $(".js-tags-all").addClass("active");
      };
    });
    site.initBlogPage();
  </script>
</body>
</html>
