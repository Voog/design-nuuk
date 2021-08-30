{% capture dont_render %}
  {% assign current_year = "now" | date: "%Y" | to_num %}
{% endcapture %}

{% assign article_data_blog_layout_defined = false %}
{% if article.data.article_settings.blog_layout == 1 or article.data.article_settings.blog_layout == 0 or article.data.article_settings.blog_layout == 2 %}
  {% assign blog_layout = article.data.article_settings.blog_layout %}
  {% assign article_data_blog_layout_defined = true %}
{% elsif site.data.article_settings.blog_layout == 0 %}
  {% assign blog_layout = 0 %}
{% elsif site.data.article_settings.blog_layout == 1 %}
  {% assign blog_layout = 1 %}
{% else %}
  {% assign blog_layout = 2 %}
{% endif %}
