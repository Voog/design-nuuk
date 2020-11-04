<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}

  {% assign contentAreaCount = page.data.content_area_settings.items_count | to_num %}
  {% if contentAreaCount == blank %}
    {% assign contentAreaCount = 1 %}
  {% endif %}

  {% for id in (1..contentAreaCount) %}
    {% assign columnSettingsKey = 'column_settings' | append: id %}
    {% assign columnSettings = page.data[columnSettingsKey] %}

    {% if columnSettings.items_count != blank %}
      {% assign columnCount = columnSettings.items_count %}
    {% else %}
      {% assign columnCount = 1 %}
    {% endif %}

    <style>
      .column-container-{{ id }} {
        {% if columnSettings.padding != blank %}
          margin: 0 -{{columnSettings.padding}}px;
        {% endif %}
      }
      .column-container-{{ id }} .col-item {
        {% if columnSettings.min_width != blank %}
          min-width: {{columnSettings.min_width}}px;
        {% endif %}
        {% if columnSettings.padding %}
          padding: {{columnSettings.padding}}px;
        {% endif %}
      }

      .column-container-{{columnCount}}-{{ id }} .col-item {
        {% if columnSettings.padding != blank %}
          width: calc(100%/{{columnCount}} - {{columnSettings.padding}}*2px);
        {% else %}
          width: calc(100%/{{columnCount}});
        {% endif %}
      }
    </style>
  {% endfor %}
</head>

<body class="common-page js-bg-picker-area">
  {% include "header" %}
  {% if editmode %}
    <button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
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
      {%- if editmode -%}
        <div>
          <button disabled class="js-content-area-settings-btn">Content area settings</button>
        </div>
      {%- endif -%}

      {% if contentAreaCount == blank %}
        {% assign contentAreaCount = 1 %}
      {% endif %}
      {% for id in (1..contentAreaCount) %}
        <section class="content-body content-formatted">
        {%- if editmode -%}
          <div>
            <button disabled class="js-column-settings-btn-{{ id }}">Columns settings {{ id }}</button>
          </div>
        {%- endif -%}

        {% assign columnSettingsKey = 'column_settings' | append: id %}
        {% assign columnCount = page.data[columnSettingsKey].items_count %}
        {% assign count = 1 %}
        {% if columnCount %}
          {% assign count = columnCount | to_num %}
        {% endif %}

        <div class="column-container-{{ id }} column-container-{{ columnCount }}-{{ id }} flex_wrap">
          {% for i in (1..count) %}
            {% assign name = "col-" | append: i | append: id %}
            <div class="col-item flex_auto" data-search-indexing-allowed="true">
              {% content name=name %}
            </div>
          {% endfor %}
        </section>
      {% endfor %}
    </main>

    {% include "footer" %}
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "template-tools" %}
  <script>
    site.initCommonPage();
    {% if editmode %}
      window.addEventListener('DOMContentLoaded', (event) => {
        {% if page.data.content_area_settings %}
          var valuesObj = {{ page.data.content_area_settings | json }};
        {% else %}
          var valuesObj = {items_count: "1"};
        {% endif %}


        initSettingsEditor(
          {
            settingsBtn: document.querySelector('.js-content-area-settings-btn'),
            menuItems: [
              {
                "title": "Select content area column count",
                "type": "select",
                "key": "items_count",
                "list": [
                  {"title": "1", "value": "1"},
                  {"title": "2", "value": "2"},
                  {"title": "3", "value": "3"},
                  {"title": "4", "value": "4"},
                  {"title": "5", "value": "5"}
                ]
              }
            ],
            dataKey: 'content_area_settings',
            values: valuesObj
          }
        )


        {% for id in (1..contentAreaCount) %}
          {% assign columnSettingsKey = 'column_settings' | append: id %}

          {% if page.data[columnSettingsKey] %}
            var valuesObj = {{ page.data[columnSettingsKey] | json }};
          {% else %}
            var valuesObj = {items_count: "1"};
          {% endif %}


          initSettingsEditor(
            {
              settingsBtn: document.querySelector('.js-column-settings-btn-{{ id }}'),
              menuItems: [
                {
                  "title": "Select content area row count",
                  "type": "select",
                  "key": "items_count",
                  "list": [
                    {"title": "1", "value": "1"},
                    {"title": "2", "value": "2"},
                    {"title": "3", "value": "3"},
                    {"title": "4", "value": "4"},
                    {"title": "5", "value": "5"}
                  ]
                },
                {
                  "title": "Min column item width in px",
                  "type": "number",
                  "min": 1,
                  "key": "min_width",
                  "placeholder": "Set min row item width in px"
                },
                {
                  "title": "Column item padding in px",
                  "type": "number",
                  "min": 1,
                  "key": "padding",
                  "placeholder": "Set item padding in px"
                }
              ],
              dataKey: '{{columnSettingsKey}}',
              values: valuesObj
            }
          );
        {% endfor %}
      });
    {% endif %}
  </script>
</body>
</html>
