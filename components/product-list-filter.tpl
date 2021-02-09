<div class="product_filters flex_row flex_row-3 content-formatted d-none">
  <div class="product_filters-item">
    <span class="mar_r-8">{{ "sort" | lc }}</span>
    <div class="form_field mar_r-32">
      <label class="form_field_label" for="field_field_filter"></label>
      <select class="form_field_select product_list-filter" id="field_field_filter">
        <option value="price-default">{{ "default" | lc }}</option>
        <option value="price-ascending">{{ "sort_by_price" | lc }} {{ "low_to_high" | lc }}</option>
        <option value="price-descending">{{ "sort_by_price" | lc }} {{ "high_to_low" | lc }}</option>
        <option value="title-ascending">{{ "sort_by_title" | lc }} {{ "a_to_z" | lc }}</option>
        <option value="title-descending">{{ "sort_by_title" | lc }} {{ "z_to_a" | lc }}</option>
      </select>
    </div>
  </div>

  <div class="product_filters-item">
    <span class="mar_r-8">{{ "search" | lc }}:</span>
    <div class="form_field" style="padding-top: 0;">
      <label for="product-list-search" class="form_field_label"></label>
      <input type="search" placeholder='{{ "search_product" | lc | escape_once }}&#8230;' id="product-list-search" class="form_field_textfield input_option product_list-search">
    </div>
  </div>
</div>