<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

<body class="common-page js-bg-picker-area">
  {% include "header" %}
  {% if editmode %}
    <button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
  {% endif %}
  <div class="background-color js-background-color"></div>

  <div class="container js-bg-picker-area">
    <main class="content" role="main" data-search-indexing-allowed="true">
      <div class="content-body content-formatted">
        {% contentblock name="page-title" publish_default_content="true" %}
          <h1>{{page.title}}</h1>
        {% endcontentblock %}
      </div>
      <header class="content-header content-formatted" {{ edy_intro_edit_text }}>{% content name="slogan" %}</header>
      <section class="content-body content-formatted">{% content %}</section>
    </main>

    {% include "footer" %}
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "template-tools" %}
  <script>site.initCommonPage();</script>
</body>
</html>
