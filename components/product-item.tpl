{% unless _entityData.data[itemImageKey] != blank %}
  {% assign item_image_state = "without-image" %}
{% endunless %}

{% if _buyButton.product != blank %}
  {%- assign buyButtonImage = _buyButton.product.image -%}
{% else %}
  {%- assign buyButtonImage = null -%}
{% endif %}

{%- if buyButtonImage != blank -%}
  {%- assign productImage = buyButtonImage -%}
{%- else -%}
  {%- assign productImage = _entityData.data[itemImageKey] -%}
{%- endif -%}

<a class="content-item-box {{item_image_state}}" href="{{ _entityData.url }}">
  <div class="item-top p-rel">
    <div class="top-inner of-hidden">
      {% include "lazy-image",
        _altAttr:
        _entityData.data[itemImageAltAttrKey],
        _data: productImage,
        _targetWidth: '700',
        _className: "item-image is-cropped" %}
    </div>
  </div>
</a>

{%- assign productSettingsData = _entityData.data[productLayoutSettingsKey] -%}
{%- assign isBoxLabel = productSettingsData.is_product_label_box -%}

{%- capture product_label -%}
  {%- if productSettingsData.product_label != blank and isBoxLabel != true and buy_button.product.out_of_stock? != true -%}
    <span class="{% if productSettingsData.is_product_label_line_through == true %} td-lt{% endif %}">
      {{productSettingsData.product_label}}
    </span>
  {%- endif -%}
{%- endcapture -%}

<div class="product_item-details--wrap mar_t-16">
  <div class="flex_auto">
    {%- capture look_closer_btn -%}
      <a class="product_item-btn{%- if productSettingsData.product_label != blank or _buyButton.product.price != blank %} p-abs{%- else %} p-rel{%- endif -%}" href="{{ _entityData.url }}">
        {{ "look_closed" | lc | escape_once }}
      </a>
    {%- endcapture -%}

    <a class="p14 bold product_item-title bold" href="{{ _entityData.url }}">
      {{ _entityData.title }}
    </a>
    {%- if _buyButton.product != blank and _buyButton.available? -%}
      <div class="product_item-details flex_col">
        {%- if _buyButton.product.uses_variants == true -%}
          {{look_closer_btn}}
          <div class="product_item-price">
            <div class="flex_box{% if product_label != blank %} mar_r-16{% endif %}">
              {%- if _buyButton.product.price_max_with_tax != _buyButton.product.price_min_with_tax -%}
                {{ _buyButton.product.price_min_with_tax | money_with_currency: _buyButton.product.currency }}
                <span class="pad_0-4">-</span>
              {%- endif -%}
              {{ _buyButton.product.price_max_with_tax | money_with_currency: _buyButton.product.currency }}
            </div>
            {{product_label}}
          </div>
        {%- else -%}
          {%- if editmode or buy_button.product.out_of_stock? -%}
            {{look_closer_btn}}
          {%- else -%}
            <button class="product_item-btn js-cart-btn p-abs" data-product-id="{{ _buyButton.product.id }}">{{ "add_to_cart" | lc | escape_once }}</button>
          {%- endif -%}
          <div class="product_item-price">
            <span{% if product_label != blank %} class="mar_r-16"{% endif %}>
            {{ _buyButton.product.price_with_tax | money_with_currency: product.currency }}
            </span>
            {{product_label}}
          </div>

        {%- endif -%}
      </div>
    {%- else -%}
      <div class="flex_col product_item-details">
        {{look_closer_btn}}
      </div>
    {%- endif -%}
  </div>
  {%- if buy_button.product.out_of_stock? -%}
    <div class="product_item-box--label">{{ "out_of_stock" | lc | escape_once }}</div>
  {%- elsif isBoxLabel -%}
    <div class="product_item-box--label">
      {{productSettingsData.product_label}}
    </div>
  {%- endif -%}
</div>
