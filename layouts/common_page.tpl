<!DOCTYPE html>
{% include "template-settings" %}
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

<body class="common-page body-bg_picker--area {{ body_bg_type }} {% include 'semimodal-class-names' %}">
  <div class="body-bg_color"></div>

  <div class="container_wrap">
    {%- include "header" -%}
    <div class="container">
      {%- if editmode -%}
      <div class="bg-picker-top">
        <button
          class="voog-bg-picker-btn body_bg-picker--btn bg-picker {{bodyBgKey}}-picker"
          data-bg_key="{{bodyBgKey}}"
          data-type_picture="false"
          data-type_color="true"
          data-color_elem=".body-bg_color"
          data-picker_area_elem=".body-bg_picker--area"
          data-picker_elem =".{{bodyBgKey}}-picker"
          data-bg-color="{{ body_bg_color }}"
        ></button>
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
</body>
</html>
