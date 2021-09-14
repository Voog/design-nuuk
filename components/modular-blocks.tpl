
{%- if _blockSettings.block_count != blank -%}
  {%- assign blockCount = _blockSettings.block_count | to_num -%}
{%- elsif _defaultBlockObj -%}
  {%- assign blockCount = _defaultBlockObj.size -%}
{%- endif -%}

{%- if editmode and blockCount < 5 -%}
  {%- assign blockCounter = 5 -%}
{%- else -%}
  {%- assign blockCounter = blockCount -%}
{%- endif -%}

<div class="block-container-wrap">
  {%- for id in (1..blockCounter) -%}
    {%- assign blockColumnsSettingsKey = template_settings.page.block_columns_settings.key | append: id -%}
    {%- assign blockColumnsSettings = page.data[blockColumnsSettingsKey] -%}

    {%- assign blockBgKey = template_settings.page.block_bg.key | append: id -%}
    {%- assign block_bg = page.data[blockBgKey] -%}

    {%- assign blockColumnsCount = blockColumnsSettings.block_columns -%}

    {%- if blockColumnsCount != blank -%}
      {%- assign blockColumnsCount = blockColumnsCount -%}
    {%- else -%}
      {%- if _defaultBlockObj[blockColumnsSettingsKey].col_count -%}
        {%- assign blockColumnsCount = _defaultBlockObj[blockColumnsSettingsKey].col_count -%}
      {%- else -%}
        {%- assign blockColumnsCount = _defaultBlockObj.default.col_count -%}
      {%- endif -%}
    {%- endif -%}

    {%- if blockColumnsSettings.col_h_padding != blank -%}
      {%- assign hPadding = blockColumnsSettings.col_h_padding | plus: 0 -%}
    {%- else -%}
      {%- if _defaultBlockObj[blockColumnsSettingsKey].col_h_padding -%}
        {%- assign hPadding = _defaultBlockObj[blockColumnsSettingsKey].col_h_padding | plus: 0 -%}
      {%- else -%}
        {%- assign hPadding = _defaultBlockObj.default.col_h_padding | plus: 0 -%}
      {%- endif -%}
    {%- endif -%}

    {%- if blockColumnsSettings.block_v_padding != blank -%}
      {%- assign vPadding = blockColumnsSettings.block_v_padding | plus: 0 -%}
    {%- else -%}
      {%- if _defaultBlockObj[blockColumnsSettingsKey].block_v_padding -%}
        {%- assign vPadding = _defaultBlockObj[blockColumnsSettingsKey].block_v_padding | plus: 0 -%}
      {%- else -%}
        {%- assign vPadding = _defaultBlockObj.default.block_v_padding | plus: 0 -%}
      {%- endif -%}
    {%- endif -%}

    {%- if blockColumnsSettings.col_min_width != blank -%}
      {%- assign minWidth = blockColumnsSettings.col_min_width -%}
    {%- else -%}
      {%- if _defaultBlockObj[blockColumnsSettingsKey].col_min_width -%}
        {%- assign minWidth = _defaultBlockObj[blockColumnsSettingsKey].col_min_width -%}
      {%- else -%}
        {%- assign minWidth = _defaultBlockObj.default.col_min_width -%}
      {%- endif -%}
    {%- endif -%}

    {%- if blockColumnsSettings.col_justification != blank -%}
      {%- assign colJustification = blockColumnsSettings.col_justification -%}
    {%- else -%}
      {%- if _defaultBlockObj[blockColumnsSettingsKey].col_justification -%}
        {%- assign colJustification = _defaultBlockObj[blockColumnsSettingsKey].col_justification -%}
      {%- else -%}
        {%- assign colJustification = _defaultBlockObj.default.col_justification -%}
      {%- endif -%}
    {%- endif -%}

    {%- if blockColumnsSettings.col_max_width != blank and blockColumnsSettings.col_max_width != 0 -%}
      {%- assign col_max_width = blockColumnsSettings.col_max_width -%}
    {%- else -%}
      {%- if blockColumnsSettings.col_max_width == 0 -%}
        {%- assign col_max_width = 'none' -%}
      {%- else -%}
        {%- if _defaultBlockObj[blockColumnsSettingsKey].col_max_width -%}
          {%- assign col_max_width = _defaultBlockObj[blockColumnsSettingsKey].col_max_width -%}
        {%- else -%}
          {%- assign col_max_width = _defaultBlockObj.default.col_max_width -%}
        {%- endif -%}
      {%- endif -%}
    {%- endif -%}

    {%- if blockColumnsSettings.block_max_width != blank and blockColumnsSettings.block_max_width != 0 -%}
      {%- assign maxBlockWidth = blockColumnsSettings.block_max_width -%}
    {%- else -%}
      {% if blockColumnsSettings.block_max_width == 0 %}
        {%- assign maxBlockWidth = 100 -%}
      {% else %}
        {%- if _defaultBlockObj[blockColumnsSettingsKey].block_max_width -%}
          {%- assign maxBlockWidth = _defaultBlockObj[blockColumnsSettingsKey].block_max_width -%}
        {%- else -%}
          {%- assign maxBlockWidth = _defaultBlockObj.default.block_max_width -%}
        {%- endif -%}
      {% endif %}
    {%- endif -%}

    {%- if blockColumnsSettings.block_justification != blank -%}
      {%- assign blockJustification = blockColumnsSettings.block_justification -%}
    {%- else -%}
      {%- if _defaultBlockObj[blockColumnsSettingsKey].block_justification -%}
        {%- assign blockJustification = _defaultBlockObj[blockColumnsSettingsKey].block_justification -%}
      {%- else -%}
        {%- assign blockJustification = _defaultBlockObj.default.block_justification -%}
      {%- endif -%}
    {%- endif -%}

    <style>
      .block-container-{{ id }} {
        display: flex;
        justify-content: {{blockJustification}};
        margin-bottom: 8px;
        position: relative;
      }

      .block-{{ id }} {
        width: 100%;
        background-color: {{ block_bg.color }};
      }

      @media screen and (min-width: 720px) {
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
        max-width: {%- if col_max_width == "none" -%}none{%- else -%}{{col_max_width}}px{%- endif -%};
      }

      @media screen and (max-width: 720px) {
        {%- if vPadding > 32 -%}
          {%- assign vPadding = vPadding | divided_by: 2 -%}
        {%- endif -%}

        {%- if hPadding > 32 -%}
          {%- assign hPadding = hPadding | divided_by: 2 -%}
        {%- endif -%}

        .column-container-{{ id }} {
          margin: 0 -{{hPadding}}px -32px;
          padding: {{vPadding}}px 0;
        }

        .column-container-{{ id }} .col-item {
          padding: 0 {{hPadding}}px 32px;
        }

        .column-container-{{blockColumnsCount}}-{{ id }} .col-item {
          width: calc(100% / {{blockColumnsCount}} - {{hPadding}}*2px);
        }

        .column-container-{{blockColumnsCount}}-{{ id }} .col-item {
          max-width: 100%;
          width: 100%;
        }
      }
    </style>

    <section class="block-container-{{ id }} block-container content-body content-formatted{% if blockCount < id %} d-none js-lazyload{% endif %}">
      <div class="block-{{ id }} block-{{ id }}-bg_color block-{{ id }}-bg_picker--area js-block editor_default-container" data-id="{{ id }}" data-min-width="{{minWidth}}" data-max-width="{{maxBlockWidth}}">
        {%- assign blockImage = "image_fit-cover image_abs block-" | append: id | append: "-bg_image" -%}
        {%- include "lazy-image", _data: block_bg, _className: blockImage -%}
        {%- if editmode -%}
          <button disabled class="js-column-settings-btn-{{ id }} editor_default-btn js-settings-editor-btn">{{ "block" | lce  | escape_once }} {{ id }}</button>
          <button class="bg-picker"
            data-picture="true"
            data-color="true"
            data-image_elem=".block-{{ id }}-bg_image"
            data-color_elem=".block-{{ id }}-bg_color"
            data-picker_area_elem=".block-{{ id }}-bg_picker--area"
            data-picker_elem=".block-{{ id }}-bg_picker"
            data-bg_key="{{blockBgKey}}"
            data-bg="{{ block_bg | json | escape }}"
            data-entity="pageData"
          ></button>
        {%- endif -%}
        {%- assign blockColumnsSettingsKey = template_settings.page.block_columns_settings.key | append: id -%}
        {%- assign blockColumnsCount = page.data[blockColumnsSettingsKey].block_columns -%}


        {%- if blockColumnsCount -%}
          {%- assign columnCount = blockColumnsCount | to_num -%}
        {%- else -%}
          {%- if _defaultBlockObj[blockColumnsSettingsKey].col_count %}
            {%- assign columnCount = _defaultBlockObj[blockColumnsSettingsKey].col_count -%}
          {%- else %}
            {%- assign columnCount = _defaultBlockObj.default.col_count -%}
          {%- endif %}
        {%- endif -%}

        {%- if editmode and columnCount < 5 -%}
          {%- assign columnCounter = 5 -%}
        {%- else -%}
          {%- assign columnCounter = columnCount -%}
        {%- endif -%}

        <div class="column-container-{{ id }} column-container-{{ columnCount }}-{{ id }} flex_wrap flex_j-center-mobile">
          {%- for i in (1..columnCounter) -%}
            {%- assign name = "content-" | append: i | append: "-" | append: id -%}
            {%- assign col_item_id = i | append: "-" | append: id -%}
            {%- assign blockContentBgKey = template_settings.page.block_content_bg.key | append: col_item_id -%}
            {%- assign blockContent_bg = page.data[blockContentBgKey] -%}

            <style>
              .col-item-{{ col_item_id }}-bg_color {
                background-color: {{ blockContent_bg.color }};
                z-index: 0;
              }

              .col-item-{{ col_item_id }}-bg_image {
                z-index: -1;
              }
            </style>

            <div
              class="col-item flex_auto b-box{% if columnCount < i %} d-none js-lazyload{% endif %}{% if columnCount == 1 %} content-formatted--overflowed-images{% endif %} col-item-{{ col_item_id }} col-item-{{ col_item_id }}-bg_picker--area"
              data-search-indexing-allowed="true"
            >
              <div class="col-item-{{ col_item_id }}-bg_color p-rel">
                {%- if editmode -%}
                  <button class="bg-picker"
                    data-picture="true"
                    data-color="true"
                    data-image_elem=".col-item-{{ col_item_id }}-bg_image"
                    data-color_elem=".col-item-{{ col_item_id }}-bg_color"
                    data-picker_area_elem=".col-item-{{ col_item_id }}-bg_picker--area"
                    data-picker_elem=".col-item-{{ col_item_id }}-bg_picker"
                    data-bg_key="{{blockContentBgKey}}"
                    data-bg="{{ blockContent_bg | json | escape }}"
                    data-entity="pageData"
                  ></button>
                {%- endif -%}
                
                {%- if id == 1 and i == 1 -%}
                  {%- comment -%}
                    For better migration use content with name "body" because older templates common page layout uses content with name "body".
                  {%- endcomment -%}

                  {%- capture first_block_html %}{% content readonly=editmode name=name %}{% endcapture -%}
                  {%- if first_block_html == blank -%}
                    {% assign name = "body" %}
                  {%- endif -%}

                  {% contentblock name=name %}
                    {% include 'modular-content-1-1' %}
                  {% endcontentblock %}
                {%- else -%}
                  {%- content name=name -%}
                {%- endif -%}
                {%- assign blockContentImage = "image_fit-cover image_abs col-item-" | append: col_item_id | append: "-bg_image" -%}
                {%- include "lazy-image", _data: blockContent_bg, _className: blockContentImage -%}
              </div>
            </div>
          {%- endfor -%}
        </div>
      </div>
    </section>
  {%- endfor -%}
</div>


{% include 'settings-popover',
  _blockSettings: _blockSettings, _commonPage: _commonPage,
  _defaultBlockObj: _defaultBlockObj, _blockCount: blockCount
%}