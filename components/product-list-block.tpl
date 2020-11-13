<div class="product_list flex_row flex_row-3 mar_0-8-neg pad_40-0">
  {%- assign level_str = 'menuitems_on_level_' | append: page.level -%}
  {%- for item in site[level_str] -%}
    {%- if item.current? -%}
      {%- for item_child in item.visible_children_with_data -%}
        {%- if item_child.layout_title == product_list_layout or item_child.layout_title == product_layout -%}
          <div class="product_item js-product-item flex_row-3--item scale-up" data-title="{{item_child.title | escape }}" data-price="{{product.price}}">
            <div class="mar_0-8">
              {%- assign productPageSettings = 'product_page_settings_' | append: item_child.page_id -%}

              <div class="product_item-wrap p-rel">
                {%- if item_child.data[productPageSettingsKey].product_label != blank -%}
                  <div class="product_label">
                    {{item_child.data[productPageSettingsKey].product_label}}
                  </div>
                {%- endif -%}
                {%- if item_child.layout_title == product_list_layout -%}
                  {% include 'content-item', _entityData: item_child, _itemType: 'menuItem', _id: item_child.page_id %}
                  <a class="p14 mar_t-16" href="{{ item_child.url }}">
                    <div class="p14 mar_t-16 bold product_item-title">
                      {{ item_child.title }}
                    </div>
                  </a>
                  <div class="flex_box product_item-details">
                    <a class="product_item-btn p-abs" href="{{ item_child.url }}">LOOK CLOSER</a>
                  </div>
                {%- else -%}
                  {% include 'product-item', _parentId: item_child.page_id, _parentType: "page", _entityData: item_child %}
                {%- endif -%}
              </div>
            </div>
          </div>
        {%- endif -%}
      {%- endfor -%}
    {%- endif -%}
  {%- endfor -%}
</div>
