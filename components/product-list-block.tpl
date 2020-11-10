<div class="product_list flex_row flex_row-3 mar_0-8-neg pad_40-0">
  {%- assign level_str = 'menuitems_on_level_' | append: page.level -%}
  {%- for item in site[level_str] -%}
    {%- if item.current? -%}
      {%- for item_child in item.visible_children_with_data -%}
        {%- if item_child.layout_title == product_list_layout or item_child.layout_title == product_layout -%}
          <div class="product_item js-product-item flex_row-3--item scale-up" data-title="{{item_child.title | escape }}" data-price="{{product.price}}">
            <div class="mar_0-8 mar_b-32 content-formatted">
              {%- if editmode -%}
                {%- assign wrapperTag = 'div' -%}
                {%- assign buttonTag = 'a' -%}
              {%- else -%}
                {%- assign wrapperTag = 'a' -%}
                {%- assign buttonTag = 'div' -%}
              {%- endif -%}

              <div class="product_item-link">
                {%- if item_child.layout_title == product_list_layout -%}
                  {% include 'content-item', _entityData: item_child, _itemType: 'page', _id: item_child.page_id, _hoverButton: true %}
                  <a class="p14 mar_t-16" href="{{ item_child.url }}">
                    <p class="bold">
                      {{ item_child.title }}
                    </p>
                  </a>
                {%- else -%}
                  <a class="content-item-box" href="{{ item_child.url }}">
                    <div class="item-top mar_b-32">
                      <div class="top-inner of-hidden">
                        {% include "lazy-image", _data: item_child.data.item_image, _targetWidth: '300', _className: "item-image is-cropped" %}
                      </div>
                      <{{buttonTag}} class="custom-btn p-abs">Look closer</{{buttonTag}}>
                    </div>
                  </a>

                  {%- load buy_button to "buy_button" q.content.parent_id=item_child.page_id q.content.parent_type="page" -%}
                  {%- assign product = buy_button.product -%}
                  <a class="p14 mar_t-16" href="{{ item_child.url }}">
                    <p class="bold">
                      {{ item_child.title }}
                    </p>
                    <p>{{ product.price_with_tax | money_with_currency: "EUR" }}</p>
                  </a>
                {%- endif -%}
                </div>

              {%- if buy_button.content and item_child.layout_title == product_layout -%}
                {%- content content=buy_button.content -%}
              {%- endif -%}
            </div>
          </div>
        {%- endif -%}
      {%- endfor -%}
    {%- endif -%}
  {%- endfor -%}
</div>
