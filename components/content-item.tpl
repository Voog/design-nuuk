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

{%- if editmode -%}
  {%- assign buttonTag = 'a' -%}
{%- else -%}
  {%- assign buttonTag = 'div' -%}
{%- endif -%}

{% if editmode %}
  <div class="content-item-box {{ item_image_state }} js-content-item-box not-loaded" data-item-type="{{_itemType}}" data-item-id="{{ _id }}">
    <div class="item-top mar_b-32{% if blog_listing_page == true or blog_article_page == true %} max-h-344{% endif %}">
      <button class="btn bg-crop-btn {% if _entityData.data.item_image == blank %}is-hidden{% else %}is-visible{% endif %} js-toggle-crop-state">
        <svg width="20" height="20" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg">
          <use xlink:href="#ico-toggle"></use>
        </svg>
      </button>
      <div class="top-inner aspect-ratio-inner image-drop-area {{ item_image_crop_state }} js-content-item-img-drop-area js-lazyload" data-image="{{ _entityData.data.item_image.url }}"></div>

      {%- if _hoverButton == true -%}
        <{{buttonTag}} class="custom-btn p-abs">Look closer</{{buttonTag}}>
      {%- endif -%}
    </div>
  </div>
{% else %}
  <a class="content-item-box {{ item_image_state }} js-content-item-box not-loaded" href="{{ _entityData.url }}">
    <div class="item-top mar_b-32{% if blog_listing_page == true or blog_article_page == true %} max-h-344{% endif %}">
      <div class="top-inner of-hidden">
        {% if _entityData.data.item_image != blank %}
          <div class="loader js-loader"></div>
          {%- assign imageClass = "item-image " | append: item_image_crop_state -%}
          {% include "lazy-image", _data: _entityData.data.item_image, _targetWidth: '1400', _className: imageClass  %}
        {% else %}
          <div class="item-placeholder">{{ _entityData.title | truncate: 50 }}</div>
        {% endif %}
      </div>
      {%- if _hoverButton == true -%}
        <{{buttonTag}} class="custom-btn p-abs">Look closer</{{buttonTag}}>
      {%- endif -%}
    </div>
  </a>
{% endif %}