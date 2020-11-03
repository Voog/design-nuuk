<!DOCTYPE html>
<html class="{%- if editmode -%}editmode{%- else -%}publicmode{%- endif -%}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {%- include "template-variables" -%}
  {%- include "html-head" -%}
  {%- include "template-styles" -%}
</head>

<body class="product-list-page js-bg-picker-area flex_box">
  {% include "template-svg-spritesheet" %}
  {%- include "header" -%}
  {%- if editmode -%}
    <button class="voog-bg-picker-btn js-background-settings body_bg-picker--btn" data-bg-key="body_bg"  data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
  {%- endif -%}
  <div class="background-color js-background-color"></div>

  <div class="container js-bg-picker-area flex_col flex_j-space-between">
    <main class="content" role="main" data-search-indexing-allowed="true">
      <div class="content-body content-formatted">
        {% contentblock name="page-title" publish_default_content="true" %}
          <h1>{{page.title}}</h1>
        {% endcontentblock %}
      </div>
      {% include 'product-list-filter' %}
      {% include 'product-list-block' %}
    </main>

    {%- include "footer" -%}
  </div>

  {%- include "site-signout" -%}
  {%- include "javascripts" -%}
  {%- include "template-tools" -%}
  <script>
    site.initCommonPage();
    function fadeAnimation(wrapper) {
      wrapper.find('.js-product-item').each(function() {
        var item = $(this);
        var delay = item.index();
        item.css({'opacity':'0', 'transition': 'none'});
        setTimeout((function() {
          item.animate({'opacity':'1'}, 500);
        }), delay * 40);
      });
    }

    $(".js-sort-price-ascending").on("click", function() {
      var $wrapper = $('.product_list');
      fadeAnimation($wrapper);
      $wrapper.find('.js-product-item').sort(function(a, b) {
        return +a.dataset.price - +b.dataset.price;
      })
      .appendTo($wrapper);
    });

    $(".js-sort-price-descending").on("click", function() {
      var $wrapper = $('.product_list');
      fadeAnimation($wrapper);
      $wrapper.find('.js-product-item').sort(function(a, b) {
        return +b.dataset.price - +a.dataset.price;
      })
      .appendTo($wrapper);
    });

    $(".js-sort-title-ascending").on("click", function() {
      var $wrapper = $('.product_list');
      fadeAnimation($wrapper);
      $wrapper.find('.js-product-item').sort(function(a, b) {
        if(a.dataset.title < b.dataset.title) { return -1; }
        if(a.dataset.title > b.dataset.title) { return 1; }
        return 0;
      })
      .appendTo($wrapper);
    });

    $(".js-sort-title-descending").on("click", function() {
      var $wrapper = $('.product_list');
      fadeAnimation($wrapper);
      $wrapper.find('.js-product-item').sort(function(a, b) {
        if(a.dataset.title < b.dataset.title) { return 1; }
        if(a.dataset.title > b.dataset.title) { return -1; }
        return 0;
      })
      .appendTo($wrapper);
    });

    $("#myInput").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      fadeAnimation($('.product_list'));
      $(".product_list .js-product-item").filter(function() {
        $(this).toggle($(this).attr("data-title").toLowerCase().indexOf(value) > -1)
      });
    });
  </script>
</body>
</html>
