{% include 'settings-editor-button',
  _titleKey: "product_page",
  _descriptionKey: "edit_product_page",
  _className: "js-product-page-settings-btn",
  _wrapClassName: "content_settings-btn"
%}

{%- assign productNoteInputCount = 1 -%}
{%- assign productPageSettings = page.data[productLayoutSettingsKey] -%}
{%- if productPageSettings != blank -%}
  {%- assign productNoteInputCount = productPageSettings.product_note_input_count | to_num -%}
{%- endif -%}

{% include 'settings-product-page-functions',
  _productPageSettings: productPageSettings,
  _productNoteInputCount: productNoteInputCount %}
