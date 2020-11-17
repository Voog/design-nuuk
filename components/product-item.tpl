<a class="content-item-box" href="{{ _buyButton.content.parent.url }}">
  <div class="item-top p-rel">
    {%- if _entityData.data[productPageSettingsKey].product_label != blank -%}
      <div class="product_label">
        {{_entityData.data[productPageSettingsKey].product_label}}
      </div>
    {%- endif -%}
    <div class="top-inner of-hidden js-zoom">
      {% include "lazy-image", _altAttr: _entityData.data.item_image_alt_attr, _data: _buyButton.content.parent.data.item_image, _targetWidth: '300', _className: "item-image is-cropped" %}
    </div>
  </div>
  <div class="p14 mar_t-16 bold product_item-title" class="bold">
    {{ _entityData.title }}
  </div>
</a>
{%- if product != blank -%}
  <div class="flex_box product_item-details">
    {%- if product.uses_variants == true -%}
      <a class="product_item-btn p-abs" href="{{ _entityData.url }}">LOOK CLOSER</a>
    {%- else -%}
      <button class="product_item-btn js-cart-btn p-abs" data-product-id="{{ product.id }}">ADD TO CART</button>
    {%- endif -%}
    <p class="product_item-price p-abs">{{ product.price_with_tax | money_with_currency: "EUR" }}</p>
  </div>
{%- else -%}
  <div class="flex_box product_item-details">
    <a class="product_item-btn p-abs" href="{{ _entityData.url }}">LOOK CLOSER</a>
  </div>
{%- endif -%}
