{% unless _entityData.data.item_image %}
  {% assign item_image_state = "without-image" %}
{% else %}
  {% assign item_image_state = "with-image" %}
  {% if _entityData.data.image_crop_state %}
    {% assign item_image_crop_state = _entityData.data.image_crop_state %}
  {% else %}
    {% assign item_image_crop_state = "not-cropped" %}
  {% endif %}
{% endunless %}

{%- if _staticItem == true -%}
  {%- assign wrapperTag = 'div' -%}
{%- else -%}
  {%- assign wrapperTag = 'a' -%}
{%- endif -%}

{% if editmode and _staticItem != true %}
  <div class="content-item-box p-rel {{ item_image_state }} js-content-item-box not-loaded"
    data-item-type="{{_itemType}}"
    data-item-id="{{ _id }}"
  >
    <div class="product_alt-attr content-formatted {{ item_image_state }}">
      <div class="form_field">
        <label for="item-image-alt-{{_id}}" class="form_field_label">Add image alt attribute</label>
        <input
          placeholder="Add image alt attribute"
          id="item-image-alt-{{_id}}"
          class="form_field_textfield js-data-item mar_l-16"
          value="{{_entityData.data.item_image_alt_attr}}"
          data-name="item_image_alt_attr"
          data-entity="{{_itemType}}"
          data-id="{{_id}}"
        >
      </div>
    </div>

    <div class="item-top{% if blog_listing_page == true or blog_article_page == true %} max-h-344{% endif %}">
      <button class="btn bg-crop-btn {% if _entityData.data.item_image == blank %}is-hidden{% else %}is-visible{% endif %} js-toggle-crop-state">
        <svg width="20" height="20" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg">
          <use xlink:href="#ico-toggle"></use>
        </svg>
      </button>
      <div class="top-inner aspect-ratio-inner image-drop-area {{ item_image_crop_state }} js-content-item-img-drop-area js-lazyload" data-image="{{ _entityData.data.item_image.url }}"></div>
    </div>
  </div>
{% else %}
  <{{wrapperTag}} class="content-item-box {{ item_image_state }} js-content-item-box not-loaded"{% if _staticItem != true %} href="{{ _entityData.url }}"{% endif %}>
    <div class="item-top{% if blog_listing_page == true or blog_article_page == true %} max-h-344{% endif %}">
      <div class="top-inner of-hidden">
        {% if _entityData.data.item_image != blank %}
          <div class="loader js-loader"></div>
          {%- assign imageClass = "item-image " | append: item_image_crop_state -%}
          {% include "lazy-image", _altAttr: _entityData.data.item_image_alt_attr, _data: _entityData.data.item_image, _targetWidth: '1400', _className: imageClass  %}
        {% else %}
          <div class="item-image-placeholder"></div>
        {% endif %}
      </div>
    </div>
  </{{wrapperTag}}>
{% endif %}