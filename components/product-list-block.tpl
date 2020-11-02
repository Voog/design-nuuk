<div class="product_list flex_row flex_row-3 mar_0-8-neg pad_40-0">
  {%- for i in (1..4) -%}
    {%- assign level_str = 'menuitems_on_level_' | append: i -%}
    {%- for item in site[level_str] -%}
      {%- if item.current? -%}
        {%- for item_child in item.visible_children_with_data -%}
          {%- if item_child.layout_title == product_list_layout or item_child.layout_title == product_layout -%}
            {%- load buy_button to "buy_button" q.content.parent_id=item_child.page_id q.content.parent_type="page" -%}
            {%- assign product = buy_button.product -%}
            <div class="product_item js-product-item flex_row-3--item scale-up" data-title="{{item_child.title | escape }}" data-price="{{product.price}}">
              <div class="mar_0-8 mar_b-32 content-formatted">
                {%- if editmode -%}
                  {%- assign linkTag = 'div' -%}
                {%- else -%}
                  {%- assign linkTag = 'a' -%}
                {%- endif -%}
                <{{linkTag}} class="product_item-link" href="{{ item_child.url }}">
                  {%- if item_child.layout_title == product_list_layout -%}
                    {% unless item_child.data.item_image %}
                      {% assign page_image_state = "without-image" %}
                    {% else %}
                      {% assign page_image_state = "with-image" %}
                      {% if item_child.data.image_crop_state %}
                        {% assign page_image_crop_state = item_child.data.image_crop_state %}
                      {% else %}
                        {% assign page_image_crop_state = "not-cropped" %}
                      {% endif %}
                    {% endunless %}

                    {% if editmode %}
                      <div class="content-item-box {{ page_image_state }} js-content-item-box not-loaded" data-item-type="page" data-item-id="{{ item_child.page_id }}">
                        <div class="item-top mar_b-32">
                          <button class="btn bg-crop-btn {% if item_child.data.item_image == blank %}is-hidden{% else %}is-visible{% endif %} js-toggle-crop-state">
                            <svg width="20" height="20" viewBox="0 0 28 28" xmlns="http://www.w3.org/2000/svg">
                              <use xlink:href="#ico-toggle"></use>
                            </svg>
                          </button>
                          <div class="top-inner aspect-ratio-inner image-drop-area image_square {{ page_image_crop_state }} js-content-item-img-drop-area js-lazyload" data-image="{{ item_child.data.item_image.url }}">
                          </div>
                          <a class="custom-btn p-abs">Look closer</a>
                        </div>
                      </div>
                    {% else %}
                      <a class="content-item-box {{ page_image_state }} js-content-item-box not-loaded" href="{{ item_child.url }}">
                        <div class="item-top mar_b-32">
                          <div class="top-inner of-hidden">
                            {% if item_child.data.item_image != blank %}
                              <div class="loader js-loader"></div>
                              {%- assign imageClass = "item-image image_square" | append: page_image_crop_state -%}
                              {% include "lazy-image", _data: item_child.data.item_image, _targetWidth: '600', _className: imageClass  %}
                            {% else %}
                              <div class="item-placeholder">{{ item_child.title | truncate: 50 }}</div>
                            {% endif %}
                            <a class="custom-btn p-abs">Look closer</a>
                          </div>
                        </div>
                      </a>
                    {% endif %}
                  {%- else -%}
                    <div
                      class="product_image image_square"
                    >
                      {% include "lazy-image", _data: item_child.data.product_image, _targetWidth: '600', _className: "image_square image_fit-cover"  %}
                      <a class="custom-btn p-abs">Look closer</a>
                    </div>
                  {%- endif -%}
                  <div class="p14 mar_t-16">
                    <p class="bold">
                      {{ item_child.title }}
                    </p>
                    <p>{{ product.price_with_tax | money_with_currency: "EUR" }}</p>
                  </div>
                </{{linkTag}}>
                {%- if buy_button.content -%}
                  {%- content content=buy_button.content -%}
                {%- endif -%}
              </div>
            </div>
          {%- endif -%}
        {%- endfor -%}
      {%- endif -%}
    {%- endfor -%}
  {%- endfor -%}
</div>
