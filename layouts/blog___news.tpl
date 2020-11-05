<!DOCTYPE html>
{% include "blog-article-variables" %}
<html class="{% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
  {%- assign blog_listing_page = true -%}
</head>

<body class="blog-page js-bg-picker-area flex_box{% include 'semimodal-class-names' %}">
  {% include "template-svg-spritesheet" %}
  {% include "header" %}
  {% if editmode %}
    <button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
  {% endif %}
  <div class="background-color js-background-color"></div>

  <div class="container">
    {% include "tags-blog" %}

    <main class="content" role="main" data-search-indexing-allowed="true">
      <section class="content-body content-formatted post-intro-content" {{ edy_intro_edit_text }}>{% content %}</section>

      {% addbutton %}
      <div>
        {% for article in articles %}
          {% include "post-box" %}
        {% endfor %}
      </div>
    </main>

    {% include "footer" %}
  </div>
  {% include 'site-components' %}
  {% include "site-signout" %}
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
