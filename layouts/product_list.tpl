<!DOCTYPE html>
<html class="{%- if editmode -%}editmode{%- else -%}public{%- endif -%}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {%- include "template-variables" -%}
  {%- include "html-head" -%}
  {%- include "template-styles" -%}
  <script>{% assign currency = VoogEcommerce.storeInfo.currency %}</script>
  {% assign currency = VoogEcommerce.storeInfo.currency %}
</head>

<body class="product-list-page js-bg-picker-area">
  {%- if editmode -%}
    <button class="voog-bg-picker-btn js-background-settings" data-bg-key="body_bg" data-bg-picture-boolean="true" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
  {%- endif -%}

  <div class="background-image js-background-image"></div>
  <div class="background-color js-background-color"></div>

  <div class="container js-bg-picker-area">
    <div class="js-background-type {{ container_bg_type }}">
      <div class="background-color js-background-color">
        {%- if editmode -%}
          <button class="voog-bg-picker-btn js-background-settings" data-bg-key="container_bg" data-bg-picture-boolean="false" data-bg-color="{{ container_bg_color }}" data-bg-color-data="{{ container_bg_color_data_str | escape }}"></button>
        {%- endif -%}

        {%- include "header" -%}
        {%- include "menu-level-2" -%}
        <div class="pad_40-0">
          <button class="js-sort-price-ascending">Sort by price ascending</button>
          <button class="js-sort-price-descending">Sort by price descending</button>
          <input id="myInput" type="search" placeholder="Search">
        </div>
        <main class="content" role="main" data-search-indexing-allowed="true">
          <div class="product-list flex_row flex_row-3 mar_0-8-neg pad_40-0">
            {%- for i in (1..4) -%}
              {%- assign level_str = 'menuitems_on_level_' | append: i -%}
              {%- for item in site[level_str] -%}
                {%- if item.current? -%}
                  {%- for item_child in item.visible_children_with_data -%}
                    {%- if item_child.layout_title == product_list_layout or item_child.layout_title == product_layout -%}
                      {%- load buy_button to "buy_button" q.content.parent_id=item_child.page_id q.content.parent_type="page" -%}
                      {%- assign product = buy_button.product -%}
                      <div class="js-product-item flex_row-3--item" data-title="{{item_child.title}}" data-price="{{product.price}}">
                        {% include 'image_src_variable', _data: item_child.data.product_image, _targetWidth: "500" %}
                        <div class="mar_0-8 content-formatted">
                        <div
                          class="product_image bg_img-cover{%- if _src != blank %} image_square{%- endif -%}"
                          {% if _src != blank -%}
                            style="background-image: url({{_src}});"
                          {%- endif -%}https://www.voog.com/developers/markup/objects/page
                        ></div>
                        <p>{{ product.price }}</p>
                        {%- if buy_button.content -%}
                          {%- content content=buy_button.content -%}
                        {%- endif -%}
                        <a class="p14" href="{{ menu_level.url }}">
                          {{ item_child.title }}
                        </a>
                        </div>
                      </div>
                    {%- endif -%}
                  {%- endfor -%}
                {%- endif -%}
              {%- endfor -%}
            {%- endfor -%}
          </div>
        </main>

        {%- include "footer" -%}

      </div>
    </div>
  </div>

  {%- include "site-signout" -%}
  {%- include "javascripts" -%}
  {%- include "template-tools" -%}
  <script>
    site.initCommonPage();
    $( ".js-sort-price-ascending" ).on( "click", function() {
      var $wrapper = $('.product-list');

      $wrapper.find('.js-product-item').sort(function(a, b) {
        return +a.dataset.price - +b.dataset.price;
      })
      .appendTo($wrapper);
    });

    $( ".js-sort-price-descending" ).on( "click", function() {
      var $wrapper = $('.product-list');

      $wrapper.find('.js-product-item').sort(function(a, b) {
        return +b.dataset.price - +a.dataset.price;
      })
      .appendTo($wrapper);
    });

    $("#myInput").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      $(".product-list .js-product-item").filter(function() {
        $(this).toggle($(this).attr("data-title").toLowerCase().indexOf(value) > -1)
      });
    });
  </script>
</body>
</html>
