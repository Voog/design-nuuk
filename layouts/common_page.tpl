<!DOCTYPE html>
{% include "template-settings" %}
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

<body class="common-page js-bg-picker-area {% include 'semimodal-class-names' %}">
  <div class="background-color js-background-color"></div>

  <div class="container_wrap js-background-type {{ body_bg_type }}">
    {%- include "header" -%}
    <div class="container">
      {%- if editmode -%}
        <div class="bg-picker-top">
          <button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="{{bodyBgKey}}" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
        </div>
      {%- endif -%}

      <main class="content" role="main" data-search-indexing-allowed="true">
        <div class="content-body content-formatted mar_b-32">
          {% contentblock name="page-title" publish_default_content="true" %}
            <h1>{{page.title}}</h1>
          {% endcontentblock %}
        </div>

        {% include 'modular-blocks',
          _blockSettings: page.data[blockSettingsKey],
          _commonPage: true,
          _defaultBlockObj: template_settings.page.block_columns_settings.value
        %}
      </main>
      {%- include "footer" -%}
    </div>
  </div>

  {%- include "site-signout" -%}
  {%- include "javascripts" -%}
  {%- include "template-tools" -%}
  <script>
    site.initCommonPage();
  </script>
</body>
</html>
