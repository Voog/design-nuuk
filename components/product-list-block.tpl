<div class="product_list flex_row flex_row-3 mar_0-16-neg pad_40-0">
  {%- assign level_str = 'menuitems_on_level_' | append: page.level -%}

  {%- for item in site[level_str] -%}
    {%- if item.current? -%}
      {%- for item_child in item.visible_children_with_data -%}
        {%- if item_child.layout_title == product_list_layout or item_child.layout_title == product_layout -%}
          {%- load buy_button to "buy_button" q.content.parent_id=item_child.page_id q.content.parent_type="page" -%}
          {%- assign product = buy_button.product -%}
          <div class="product_item js-product-item flex_row-3--item{% if product != blank %} js-product-whith-data{% endif %}"
            data-title="{{item_child.title | escape }}"
            data-index="{{forloop.index}}"
            {%- if product != blank and product.out_of_stock? != true %}
              data-price="{{product.price_min_with_tax}}"
            {%- endif -%}
          >
            <div class="mar_0-16">
              <div class="product_item-wrap product_item_list p-rel">
                {%- if item_child.layout_title == product_list_layout -%}
                  {% include 'content-item', _imageData: item_child.data[itemImageKey], _entityData: item_child, _itemType: 'page', _id: item_child.page_id, _targetWidth: '600' %}
                  <a class="p14 mar_t-16" href="{{ item_child.url }}">
                    <div class="p14 mar_t-16 bold product_item-title">
                      {{ item_child.title }}
                    </div>
                  </a>
                  <div class="flex_box product_item-details">
                    <a class="product_item-btn p-rel" href="{{ item_child.url }}">{{ "look_closer" | lc | escape_once }}</a>
                  </div>
                {%- else -%}
                  {% include 'product-item', _buyButton: buy_button, _entityData: item_child %}
                {%- endif -%}
              </div>
            </div>
          </div>
        {%- endif -%}
      {%- endfor -%}
    {%- endif -%}
  {%- endfor -%}
</div>
