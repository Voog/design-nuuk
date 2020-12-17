<!DOCTYPE html>
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}

  {%- assign blockCount = 3 -%}
  {%- assign blockSettings = page.data.block_settings -%}

  {%- if blockSettings != blank -%}
    {%- assign blockCount = blockSettings.block_count | to_num -%}
  {%- endif -%}

  {%- for id in (1..blockCount) -%}
    {%- assign blockColumnsSettingsKey = 'block_columns_settings' | append: id -%}
    {%- assign blockColumnsSettings = page.data[blockColumnsSettingsKey] -%}

    {%- assign blockColumnsCountKey = id | append: '_block_columns' -%}
    {%- assign blockColumnsCount = blockSettings[blockColumnsCountKey] -%}

    {%- if blockColumnsCount != blank -%}
      {%- assign blockColumnsCount = blockColumnsCount -%}
    {%- else -%}
      {%- assign blockColumnsCount = id -%}
    {%- endif -%}

    {%- if blockColumnsSettings.padding != blank -%}
      {%- assign padding = blockColumnsSettings.padding -%}
    {%- else -%}
      {%- assign padding = 16 -%}
    {%- endif -%}

    <style>
      .column-container-{{ id }} {
        margin: 0 -{{padding}}px;
      }
      .column-container-{{ id }} .col-item {
        {%- if blockColumnsSettings.min_width >= 1 -%}
          min-width: {{blockColumnsSettings.min_width}}px;
        {%- endif -%}
        padding: 0 {{padding}}px {{padding}}px;
      }

      .column-container-{{blockColumnsCount}}-{{ id }} .col-item {
        width: calc(100% / {{blockColumnsCount}} - {{padding}}*2px);
        {%- if blockColumnsSettings.max_width >= 1 -%}
          max-width: {{blockColumnsSettings.max_width}}px;
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

        {%- for id in (1..blockCount) -%}
          <section class="content-body content-formatted editor_default-container">
          {%- if editmode -%}
            <button disabled class="js-column-settings-btn-{{ id }} editor_default-btn js-settings-editor-btn">Row {{ id }}</button>
          {%- endif -%}
          {%- assign blockColumnsCountKey = id | append: '_block_columns' -%}
          {%- assign blockColumnsCount = page.data.block_settings[blockColumnsCountKey] -%}

          {%- assign count = id -%}
          {%- if blockColumnsCount -%}
            {%- assign count = blockColumnsCount | to_num -%}
          {%- endif -%}

          <div class="column-container-{{ id }} column-container-{{ count }}-{{ id }} flex_wrap flex_j-center-mobile">
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
  {% include 'settings-popover', _commonPage: true, _blockCount: blockCount %}
  {%- include "javascripts" -%}
  {%- include "template-tools" -%}
  <script>
    site.initCommonPage();
  </script>
  <script>
    $( ".col-item" ).each(function( index ) {
      if  ($( this ).width() >= $( this ).closest( ".content-body" ).width()) {
        $( this ).css('min-width', '100%');
      }
    });
  </script>
</body>
</html>
