{% unless _entityData.data.item_image != blank %}
  {% assign item_image_state = "without-image" %}
{% endunless %}

<a class="content-item-box {{item_image_state}}" href="{{ _entityData.url }}">
  <div class="item-top p-rel">
    <div class="top-inner of-hidden">
      {% include "lazy-image", _altAttr: _entityData.data.item_image_alt_attr, _data: _entityData.data.item_image, _targetWidth: '300', _className: "item-image is-cropped" %}
    </div>
  </div>
  <div class="p14 mar_t-16 bold product_item-title bold">
    {{ _entityData.title }}
  </div>
</a>
{%- capture product_label -%}
  {%- if _entityData.data[productPageSettingsKey].product_label != blank -%}
    <span class="{% if _entityData.data[productPageSettingsKey].product_label_line_through == true %} td-lt{% endif %}">
      {{_entityData.data[productPageSettingsKey].product_label}}
    </span>
  {%- endif -%}
{%- endcapture -%}
{%- if product != blank -%}
  <div class="flex_box product_item-details">
    {%- if product.uses_variants == true -%}
      <a class="product_item-btn p-abs" href="{{ _entityData.url }}">LOOK CLOSER</a>
    {%- else -%}
      <button class="product_item-btn js-cart-btn p-abs" data-product-id="{{ product.id }}">ADD TO CART</button>
    {%- endif -%}
    <div class="product_item-price p-abs">{{ product.price_with_tax | money_with_currency: product.currency }}<span class="mar_l-16"></span> {{product_label}}</div>
  </div>
{%- else -%}
  <div class="flex_box product_item-details oo">
    <a class="product_item-btn p-abs" href="{{ _entityData.url }}">LOOK CLOSER</a>
    <div class="product_item-price p-abs">{{product_label}}</div>
  </div>
{%- endif -%}
