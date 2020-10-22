<div class="product-list flex_row flex_row-3 mar_0-8-neg pad_40-0">

  {%- for i in (1..4) -%}
    {%- assign level_str = 'menuitems_on_level_' | append: i -%}
    {%- for item in site[level_str] -%}
      {%- if item.current? -%}
        {%- for item_child in item.visible_children_with_data -%}
          {%- if item_child.layout_title == product_list_layout or item_child.layout_title == product_layout -%}
            {%- load buy_button to "buy_button" q.content.parent_id=item_child.page_id q.content.parent_type="page" -%}
            {%- assign product = buy_button.product -%}
            <div class="product_item js-product-item flex_row-3--item" data-title="{{item_child.title}}" data-price="{{product.price}}">
              {% include 'image_src_variable', _data: item_child.data.product_image, _targetWidth: "500" %}
              <div class="mar_0-8 mar_b-32 content-formatted">
                <div
                  class="product_image bg_img-cover{%- if _src != blank %} image_square{%- endif -%}"
                  {% if _src != blank -%}
                    style="background-image: url({{_src}});"
                  {%- endif -%}https://www.voog.com/developers/markup/objects/page
                >
                  {%- if buy_button.content -%}
                    {%- content content=buy_button.content -%}
                  {%- endif -%}
                </div>
                <div class="p14 mar_t-16">
                  <a class="bold" href="{{ item_child.url }}">
                    {{ item_child.title }}
                  </a>
                  <div>{{ product.price }}</div>
                </div>
              </div>
            </div>
          {%- endif -%}
        {%- endfor -%}
      {%- endif -%}
    {%- endfor -%}
  {%- endfor -%}
</div>