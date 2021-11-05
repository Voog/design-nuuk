{% if product.uses_variants %}
  <div class="edy-buy-button-container edy-buy-button-view" {{ _button_attributes }}>
    <div class="edy-buy-button-variants">
      {% for variant_type in product.variant_types %}
      <div class="form_field" data-variation-id="{{ variant_type.id }}">
        <label class="form_field_label">{{ variant_type.name }}</label>
        <select class="form_field_select" data-variation-attribute-id="{{ variant_type.id }}">
          <option value="">---</option>
          {% for variant_value in variant_type.variant_values %}
          <option value="{{ variant_value.id }}">{{ variant_value.name }}</option>
          {% endfor %}
        </select>
      </div>
      {% endfor %}
    </div>
    <div class="form_field">
      <div class="edy-buy-button custom-btn custom-btn-disabled edy-buy-button-disabled">
        <span class="edy-buy-button-title">{{ 'add_to_cart' | lc | escape_once }}</span></span>
      </div>
    </div>
  </div>
{% else %}
  <div class="edy-buy-button-container edy-buy-button-view">
    <div class="form_field">
      <div class="edy-buy-button custom-btn" {{ _button_attributes }}>
        <span class="edy-buy-button-title">{{ 'add_to_cart' | lc | escape_once }}</span>
        <span class="edy-buy-button-price">{{ product.price_with_tax | money_with_currency: product.currency }}</span>
      </div>
    </div>
  </div>
{% endif %}
