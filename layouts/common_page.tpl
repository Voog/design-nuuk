<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

<body class="common-page js-bg-picker-area {% include 'semimodal-class-names' %}">
  <div class="background-color js-background-color"></div>
  {%- if editmode -%}
    <div class="bg-picker-top">
      <button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
    </div>
  {%- endif -%}

  <div class="flex_box js-background-type {{ body_bg_type }}">
    {%- include "header" -%}
    <div class="container">
      <main class="content" role="main" data-search-indexing-allowed="true">
        <div class="content-body content-formatted mar_b-32">
          {% contentblock name="page-title" publish_default_content="true" %}
            <h1>{{page.title}}</h1>
          {% endcontentblock %}
        </div>

        {%- capture default_block_obj_json -%}
          {
            "block_1": {
              "col_count": 1,
              "block_max_width": 100,
              "block_justification": "center",
              "block_v_padding": 16,
              "col_max_width": "none",
              "col_justification": "between",
              "col_min_width": 240,
              "col_h_padding": 16
            },
            "block_2": {
              "col_count":2,
              "block_max_width": 100,
              "block_justification": "center",
              "block_v_padding": 32,
              "col_justification": "evenly",
              "col_max_width": 400,
              "col_min_width": 240,
              "col_h_padding": 16
            },
            "block_3": {
              "col_count": 3,
              "block_max_width": 100,
              "block_justification": "center",
              "block_v_padding": 16,
              "col_max_width": "none",
              "col_justification": "between",
              "col_min_width": 240,
              "col_h_padding": 16
            },
            "block_4": {
              "col_count": 1,
              "block_max_width": 85,
              "block_justification": "center",
              "block_v_padding": 32,
              "col_max_width": "none",
              "col_justification": "between",
              "col_min_width": 240,
              "col_h_padding": 16
            },
            "default": {
              "col_count": 3,
              "block_max_width": 100,
              "block_justification": "center",
              "block_v_padding": 16,
              "col_max_width": "none",
              "col_justification": "between",
              "col_min_width": 240,
              "col_h_padding": 16
            }
          }
        {%- endcapture -%}

        {%- assign defaultBlockObj = default_block_obj_json | json_parse -%}

        {% include 'modular-blocks',
          _blockSettings: page.data.block_settings,
          _commonPage: true,
          _defaultBlockObj: defaultBlockObj
        %}
      </main>
      {%- include 'site-components' -%}
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
