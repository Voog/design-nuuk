<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}

  {%- assign contentAreaCount = 1 -%}
  {%- assign contentAreaSettings = page.data.content_area_settings -%}

  {%- if contentAreaSettings != blank -%}
    {%- assign contentAreaCount = contentAreaSettings.items_count | to_num -%}
  {%- endif -%}

  {%- for id in (1..contentAreaCount) -%}
    {%- assign columnSettingsKey = 'column_settings' | append: id -%}
    {%- assign columnSettings = page.data[columnSettingsKey] -%}

    {%- if columnSettings.items_count != blank -%}
      {%- assign columnCount = columnSettings.items_count -%}
    {%- else -%}
      {%- assign columnCount = 1 -%}
    {%- endif -%}

    <style>
      .column-container-{{ id }} {
        {%- if columnSettings.padding != blank -%}
          margin: 0 -{{columnSettings.padding}}px;
        {%- endif -%}
      }
      .column-container-{{ id }} .col-item {
        {%- if columnSettings.min_width != blank -%}
          min-width: {{columnSettings.min_width}}px;
        {%- endif -%}
        {%- if columnSettings.padding -%}
          padding: 0 {{columnSettings.padding}}px {{columnSettings.padding}}px;
        {%- endif -%}
      }

      .column-container-{{columnCount}}-{{ id }} .col-item {
        {%- if columnSettings.padding != blank -%}
          width: calc(100%/{{columnCount}} - {{columnSettings.padding}}*2px);
        {%- else -%}
          width: calc(100%/{{columnCount}});
        {%- endif -%}
        {%- if columnSettings.max_width != blank -%}
          max-width: {{columnSettings.max_width}}px;
        {%- endif -%}
      }
    </style>
  {%- endfor -%}
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
        <header class="content-header content-formatted" {{ edy_intro_edit_text }}>{% content name="slogan" %}</header>

        {%- for id in (1..contentAreaCount) -%}
          <section class="content-body content-formatted">
          {%- if editmode -%}
            <div class="flex_box mar_b-16">
              <button disabled class="js-column-settings-btn-{{ id }} js-settings-editor-btn">{{ id }}. column settings</button>
            </div>
          {%- endif -%}

          {%- assign columnSettingsKey = 'column_settings' | append: id -%}
          {%- assign columnCount = page.data[columnSettingsKey].items_count -%}
          {%- assign count = 1 -%}
          {%- if columnCount -%}
            {%- assign count = columnCount | to_num -%}
          {%- endif -%}

          <div class="column-container-{{ id }} column-container-{{ columnCount }}-{{ id }} flex_wrap flex_j-center-mobile">
            {%- for i in (1..count) -%}
              {%- assign name = "col-" | append: i | append: id -%}
              <div class="col-item flex_auto b-box" data-search-indexing-allowed="true">
                {%- content name=name -%}
              </div>
            {%- endfor -%}
          </section>
        {%- endfor -%}
      </main>
      {%- include 'site-components' -%}
      {%- include "footer" -%}
    </div>
  </div>

  {%- include "site-signout" -%}
  {% include 'settings-popover', _commonPage: true, _contentAreaCount: contentAreaCount %}
  {%- include "javascripts" -%}
  {%- include "template-tools" -%}
  <script>
    site.initCommonPage();
  </script>
  <script>
    $( ".col-item" ).each(function( index ) {
      if  ($( this ).width() >= $( ".content-body" ).width()) {
        $( this ).css('min-width', '100%');
      }
    });
  </script>
</body>
</html>
