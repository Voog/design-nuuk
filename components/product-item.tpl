{% unless _entityData.data[itemImageKey] != blank %}
  {% assign item_image_state = "without-image" %}
{% endunless %}

{% if _buyButton.product != blank %}
  {%- assign buyButtonImage = _buyButton.product.image -%}
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
  <div class="p14 mar_t-16 bold product_item-title bold">
    {{ _entityData.title }}
  </div>
</a>

{%- if _entityData.data[productLayoutSettingsKey].product_label != blank -%}
  {% assign isLabel = true %}
{%- else -%}
  {% assign isLabel = false %}
{%- endif -%}

{%- capture product_label -%}
  {%- if isLabel -%}
    <span class="{% if _entityData.data[productLayoutSettingsKey].is_product_label_line_through == true %} td-lt{% endif %}">
      {{_entityData.data[productLayoutSettingsKey].product_label}}
    </span>
  {%- endif -%}
{%- endcapture -%}

{%- capture item_details -%}
  <div class="flex_col product_item-details">
    <a class="product_item-btn {%- if isLabel == true %} p-abs{%- else %} p-rel{%- endif -%}" href="{{ _entityData.url }}">OUT OF STOCK</a>
    <div class="product_item-price">{{product_label}}</div>
  </div>
{%- endcapture -%}

{%- capture look_closer_btn -%}
  <a class="product_item-btn p-abs" href="{{ _entityData.url }}">LOOK CLOSER</a>
{%- endcapture -%}

{%- if _buyButton.product != blank and _buyButton.available? -%}
  {%- if buy_button.product.out_of_stock? -%}
    {{item_details}}
  {%- else -%}
    <div class="product_item-details">
      {%- if _buyButton.product.uses_variants == true -%}
        {{look_closer_btn}}
        <div class="product_item-price">
          <span{% if product_label != blank %} class="mar_r-16"{% endif %}>
            {{ _buyButton.product.price_max_with_tax | money_with_currency: _buyButton.product.currency }}
            {%- if _buyButton.product.price_max_with_tax != _buyButton.product.price_min_with_tax -%}
              <span class="pad_0-4">-</span>
              {{ _buyButton.product.price_min_with_tax | money_with_currency: _buyButton.product.currency }}
            {%- endif -%}
          </span>
          {{product_label}}
        </div>
      {%- else -%}
        {%- if editmode -%}
          {{look_closer_btn}}
        {%- else -%}
          <button class="product_item-btn js-cart-btn p-abs" data-product-id="{{ _buyButton.product.id }}">ADD TO CART</button>
        {%- endif -%}
        <div class="product_item-price">
          <span{% if product_label != blank %} class="mar_r-16"{% endif %}>
          {{ _buyButton.product.price_with_tax | money_with_currency: product.currency }}
          </span>
          {{product_label}}
        </div>
      {%- endif -%}
    </div>
  {%- endif -%}
{%- else -%}
  {{item_details}}
{%- endif -%}
