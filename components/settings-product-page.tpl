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

<script>
  {% if productPageSettings %}
    var valuesObj = {{ productPageSettings | json }};
  {% else %}
    var valuesObj = {product_note_input_count: "1"};
  {% endif %}

  site.initProductPageSettings({
    valuesObj: valuesObj,
    selectRelatedProduct: {{ "select_related_product" | lce | json }},
    addProductLabel: {{ "add_product_label" | lce | json }},
    crossOutLabel: {{ "cross_out_label" | lce | json }},
    borderAroundLabel: {{ "border_around_label" | lce | json }},
    dataKey: "{{ productLayoutSettingsKey }}",
    pageLanguageId: "{{ page.language_id }}"
  });
</script>
