{% capture dont_render %}
  {% assign current_year = "now" | date: "%Y" | to_num %}
{% endcapture %}

{% assign article_data_show_secondary_defined = false %}
{% if article.data.article_settings.show_secondary == true or article.data.article_settings.show_secondary == false %}
  {% assign show_secondary = article.data.article_settings.show_secondary %}
  {% assign article_data_show_secondary_defined = true %}
{% elsif site.data.article_settings.show_secondary == false %}
  {% assign show_secondary = false %}
{% else %}
  {% assign show_secondary = true %}
{% endif %}
