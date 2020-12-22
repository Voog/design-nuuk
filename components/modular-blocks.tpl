
{%- if _blockSettings.block_count != blank -%}
  {%- assign blockCount = _blockSettings.block_count | to_num -%}
{%- else -%}
  {%- assign blockCount = _defaultBlockObj.size | minus: 1 -%}
{%- endif -%}

{%- for id in (1..blockCount) -%}
  {%- assign blockColumnsSettingsKey = 'block_columns_settings' | append: id -%}
  {%- assign blockColumnsSettings = page.data[blockColumnsSettingsKey] -%}

  {%- assign blockColumnsCountKey = id | append: '_block_columns' -%}
  {%- assign blockColumnsCount = _blockSettings[blockColumnsCountKey] -%}
  {%- assign blockObjKey = 'block_' | append: id -%}

  {%- if blockColumnsCount != blank -%}
    {%- assign blockColumnsCount = blockColumnsCount -%}
  {%- else -%}
    {%- if _defaultBlockObj[blockObjKey].col_count -%}
      {%- assign blockColumnsCount = _defaultBlockObj[blockObjKey].col_count -%}
    {%- else -%}
      {%- assign blockColumnsCount = _defaultBlockObj.default.col_count -%}
    {%- endif -%}
  {%- endif -%}

  {%- if blockColumnsSettings.col_h_padding != blank -%}
    {%- assign hPadding = blockColumnsSettings.col_h_padding -%}
  {%- else -%}
    {%- if _defaultBlockObj[blockObjKey].col_h_padding -%}
      {%- assign hPadding = _defaultBlockObj[blockObjKey].col_h_padding -%}
    {%- else -%}
      {%- assign hPadding = _defaultBlockObj.default.col_h_padding -%}
    {%- endif -%}
  {%- endif -%}

  {%- if blockColumnsSettings.block_v_padding != blank -%}
    {%- assign vPadding = blockColumnsSettings.block_v_padding -%}
  {%- else -%}
    {%- if _defaultBlockObj[blockObjKey].block_v_padding -%}
      {%- assign vPadding = _defaultBlockObj[blockObjKey].block_v_padding -%}
    {%- else -%}
      {%- assign vPadding = _defaultBlockObj.default.block_v_padding -%}
    {%- endif -%}
  {%- endif -%}

  {%- if blockColumnsSettings.col_min_width != blank -%}
    {%- assign minWidth = blockColumnsSettings.col_min_width -%}
  {%- else -%}
    {%- if _defaultBlockObj[blockObjKey].col_min_width -%}
      {%- assign minWidth = _defaultBlockObj[blockObjKey].col_min_width -%}
    {%- else -%}
      {%- assign minWidth = _defaultBlockObj.default.col_min_width -%}
    {%- endif -%}
  {%- endif -%}

  {%- if blockColumnsSettings.col_justification != blank -%}
    {%- assign colJustification = blockColumnsSettings.col_justification -%}
  {%- else -%}
    {%- if _defaultBlockObj[blockObjKey].col_justification -%}
      {%- assign colJustification = _defaultBlockObj[blockObjKey].col_justification -%}
    {%- else -%}
      {%- assign colJustification = _defaultBlockObj.default.col_justification -%}
    {%- endif -%}
  {%- endif -%}

  {%- if blockColumnsSettings.col_max_width != blank and blockColumnsSettings.col_max_width != 0 -%}
    {%- assign col_max_width = blockColumnsSettings.col_max_width -%}
  {%- else -%}
    {%- assign col_max_width = _defaultBlockObj[blockObjKey].col_max_width -%}
  {%- endif -%}

  {%- if blockColumnsSettings.block_max_width != blank -%}
    {%- assign maxBlockWidth = blockColumnsSettings.block_max_width -%}
  {%- else -%}
    {%- if _defaultBlockObj[blockObjKey].block_max_width -%}
      {%- assign maxBlockWidth = _defaultBlockObj[blockObjKey].block_max_width -%}
    {%- else -%}
      {%- assign maxBlockWidth = _defaultBlockObj.default.block_max_width -%}
    {%- endif -%}
  {%- endif -%}

  {%- if blockColumnsSettings.block_justification != blank -%}
    {%- assign blockJustification = blockColumnsSettings.block_justification -%}
  {%- else -%}
    {%- if _defaultBlockObj[blockObjKey].block_justification -%}
      {%- assign blockJustification = _defaultBlockObj.default.block_justification -%}
    {%- else -%}
      {%- assign blockJustification = _defaultBlockObj.default.block_justification -%}
    {%- endif -%}
  {%- endif -%}

  <style>
    .block-container-{{ id }} {
      display: flex;
      justify-content: {{blockJustification}};
    }

    .block-{{ id }} {
      width: 100%;
    }

    @media screen and (min-width: 480px) {
      .block-{{ id }} {
        width: {{maxBlockWidth}}%;
      }
    }

    {%- comment -%}
      Remove col-item bottom padding on last row
      and add margin subtraction to v-pad
    {%- endcomment -%}
    .column-container-{{ id }} {
      margin: 0 -{{hPadding}}px -32px;
      padding: {{vPadding}}px 0;
      justify-content: space-{{colJustification}};
    }

    .column-container-{{ id }} .col-item {
      min-width: {{minWidth}}px;
      padding: 0 {{hPadding}}px 32px;
    }

    .column-container-{{blockColumnsCount}}-{{ id }} .col-item {
      width: calc(100% / {{blockColumnsCount}} - {{hPadding}}*2px);
      max-width: {{col_max_width}}px;
    }
  </style>
{%- endfor -%}

{%- for id in (1..blockCount) -%}
  <section class="block-container-{{ id }} content-body content-formatted">
    <div class="block-{{ id }} editor_default-container">
      {%- if editmode -%}
        <button disabled class="js-column-settings-btn-{{ id }} editor_default-btn js-settings-editor-btn">Block {{ id }}</button>
      {%- endif -%}
      {%- assign blockColumnsCountKey = id | append: '_block_columns' -%}
      {%- assign blockObjKey = 'block_' | append: id -%}
      {%- assign blockColumnsCount = page.data.block_settings[blockColumnsCountKey] -%}


      {%- if blockColumnsCount -%}
        {%- assign columnCount = blockColumnsCount | to_num -%}
      {%- else -%}
        {%- if _defaultBlockObj[blockObjKey].col_count %}
          {%- assign columnCount = _defaultBlockObj[blockObjKey].col_count -%}
        {%- else %}
          {%- assign columnCount = 3 -%}
        {%- endif %}

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
            {%- elsif id == 4 and i == 1 -%}
              {% contentblock name=name %}
                {% include 'modular-content-4-1' %}
              {% endcontentblock %}
            {%- else -%}
              {%- content name=name -%}
            {%- endif -%}
          </div>
        {%- endfor -%}
      </div>
    </div>
  </section>
{%- endfor -%}

{% include 'settings-popover',
  _blockSettings: _blockSettings, _commonPage: _commonPage,
  _defaultBlockObj: _defaultBlockObj, _blockCount: blockCount
%}