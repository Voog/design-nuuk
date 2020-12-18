{%- assign blockCount = _defaultBlockCount -%}

{%- if _blockSettings != blank -%}
  {%- assign blockCount = _blockSettings.block_count | to_num -%}
{%- endif -%}

{%- for id in (1..blockCount) -%}
  {%- assign blockColumnsSettingsKey = 'block_columns_settings' | append: id -%}
  {%- assign blockColumnsSettings = page.data[blockColumnsSettingsKey] -%}

  {%- assign blockColumnsCountKey = id | append: '_block_columns' -%}
  {%- assign blockColumnsCount = _blockSettings[blockColumnsCountKey] -%}

  {%- if blockColumnsCount != blank -%}
    {%- assign blockColumnsCount = blockColumnsCount -%}
  {%- else -%}
    {%- assign blockColumnsCount = id -%}
  {%- endif -%}

  {%- if blockColumnsSettings.h_padding != blank -%}
    {%- assign hPadding = blockColumnsSettings.h_padding -%}
  {%- else -%}
    {%- assign hPadding = _defaultHPadding -%}
  {%- endif -%}

  {%- if blockColumnsSettings.v_padding != blank -%}
    {%- assign vPadding = blockColumnsSettings.v_padding -%}
  {%- else -%}
    {%- assign vPadding = _defaultVPadding -%}
  {%- endif -%}

  {%- if blockColumnsSettings.min_width != blank -%}
    {%- assign minWidth = blockColumnsSettings.min_width -%}
  {%- else -%}
    {%- assign minWidth = _defaultMinWidth -%}
  {%- endif -%}

  {%- if blockColumnsSettings.justify != blank -%}
    {%- assign justify = blockColumnsSettings.justify -%}
  {%- else -%}
    {%- assign justify = _defaultJustify -%}
  {%- endif -%}

  <style>
    .column-container-{{ id }} {
      margin: 0 -{{hPadding}}px;
      padding: {{vPadding}}px 0;
      justify-content: space-{{justify}};
    }

    .column-container-{{ id }} .col-item {
      min-width: {{minWidth}}px;

      padding: 0 {{hPadding}}px;
    }

    .column-container-{{blockColumnsCount}}-{{ id }} .col-item {
      width: calc(100% / {{blockColumnsCount}} - {{hPadding}}*2px);
      {%- if blockColumnsSettings.max_width >= 1 -%}
        max-width: {{blockColumnsSettings.max_width}}px;
      {%- endif -%}
    }
  </style>
{%- endfor -%}

{%- for id in (1..blockCount) -%}
  <section class="content-body content-formatted editor_default-container">
  {%- if editmode -%}
    <button disabled class="js-column-settings-btn-{{ id }} editor_default-btn js-settings-editor-btn">Block {{ id }}</button>
  {%- endif -%}
  {%- assign blockColumnsCountKey = id | append: '_block_columns' -%}
  {%- assign blockColumnsCount = page.data.block_settings[blockColumnsCountKey] -%}

  {%- if id >= 3 -%}
    {%- assign columnCount = _defaultcolumnCount -%}
  {%- else -%}
    {%- assign columnCount = id -%}
  {%- endif -%}

  {%- if blockColumnsCount -%}
    {%- assign columnCount = blockColumnsCount | to_num -%}
  {%- endif -%}

  <div class="column-container-{{ id }} column-container-{{ columnCount }}-{{ id }} flex_wrap flex_j-center-mobile">
    {%- for i in (1..columnCount) -%}
      {%- assign name = "col-" | append: i | append: id -%}
      <div class="col-item flex_auto b-box" data-search-indexing-allowed="true">
        {%- if id == 1 and i == 1 -%}
          {% contentblock name=name %}
            {% include 'modular-content-1-1' %}
          {% endcontentblock %}
        {%- elsif id == 2 and i == 1 -%}
          {% contentblock name=name %}
            {% include 'modular-content-2-1' %}
          {% endcontentblock %}
        {%- elsif id == 2 and i == 2 -%}
          {% contentblock name=name %}
            {% include 'modular-content-2-2' %}
          {% endcontentblock %}
        {%- elsif id == 3 and i == 1 -%}
          {% contentblock name=name %}
            {% include 'modular-content-3-1' %}
          {% endcontentblock %}
        {%- elsif id == 3 and i == 2 -%}
          {% contentblock name=name %}
            {% include 'modular-content-3-2' %}
          {% endcontentblock %}
        {%- elsif id == 3 and i == 3 -%}
          {% contentblock name=name %}
            {% include 'modular-content-3-3' %}
          {% endcontentblock %}
        {%- else -%}
          {%- content name=name -%}
        {%- endif -%}
      </div>
    {%- endfor -%}
  </section>
{%- endfor -%}

{% include 'settings-popover',
  _blockSettings: blockSettings, _commonPage: _commonPage, _blockCount: blockCount,
  _columnCount: columnCount, _minWidth: minWidth, _hPadding: hPadding,
  _vPadding: vPadding, _justify: justify
%}