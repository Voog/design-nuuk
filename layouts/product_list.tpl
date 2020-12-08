<!DOCTYPE html>
{%- include "template-variables" -%}
<html class="{% include "language-menu-class-names" %} {%- if editmode -%}editmode{%- else -%}publicmode{%- endif -%}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {%- include "html-head" -%}
  {%- include "template-styles" -%}
</head>

<body class="product_list-page js-bg-picker-area{% include 'semimodal-class-names' %}">
  {% include "template-svg-spritesheet" %}
  <div class="background-color js-background-color"></div>
  {%- if editmode -%}
    <div class="bg-picker-top">
      <button
        class="voog-bg-picker-btn js-background-settings body_bg-picker--btn"
        data-bg-key="body_bg" data-bg-picture-boolean="false"  data-bg-color="{{ body_bg_color }}"
        data-bg-color-data="{{ body_bg_color_data_str | escape }}"
      ></button>
    </div>
  {%- endif -%}
  <div class="flex_box js-background-type {{ body_bg_type }}">
    {%- include "header" -%}
    <div class="container flex_col flex_j-space-between">
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
  </div>
  {% include 'site-components' %}
  {% include 'settings-popover' %}
  {%- include "site-signout" -%}
  {%- include "javascripts" -%}
  {%- include "template-tools" -%}
  <script>
    site.initCommonPage();

    if ($(".js-product-whith-data").length >= 2) {
      $(".product_filters").addClass('visible');
    }

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

    $(".product_list-search").on("keyup", function() {
      var value = $(this).val().toLowerCase();
      fadeAnimation($('.product_list'));
      $(".product_list .js-product-item").filter(function() {
        $(this).toggle($(this).attr("data-title").toLowerCase().indexOf(value) > -1)
      });
    });

    $('.product_list-filter').on('change', function() {
      if (this.value === 'price-ascending') {
        var $wrapper = $('.product_list');
        fadeAnimation($wrapper);
        $wrapper.find('.js-product-item').sort(function(a, b) {
          return +a.dataset.price - +b.dataset.price;
        })
        .appendTo($wrapper);
      } else if (this.value === 'price-descending') {
        var $wrapper = $('.product_list');
        fadeAnimation($wrapper);
        $wrapper.find('.js-product-item').sort(function(a, b) {
          return +b.dataset.price - +a.dataset.price;
        })
        .appendTo($wrapper);
      } else if (this.value === 'title-ascending') {
        var $wrapper = $('.product_list');
        fadeAnimation($wrapper);
        $wrapper.find('.js-product-item').sort(function(a, b) {
          if(a.dataset.title < b.dataset.title) { return -1; }
          if(a.dataset.title > b.dataset.title) { return 1; }
          return 0;
        })
        .appendTo($wrapper);
      } else if (this.value === 'title-descending') {
        var $wrapper = $('.product_list');
        fadeAnimation($wrapper);
        $wrapper.find('.js-product-item').sort(function(a, b) {
          if(a.dataset.title < b.dataset.title) { return 1; }
          if(a.dataset.title > b.dataset.title) { return -1; }
          return 0;
        })
        .appendTo($wrapper);
      }
    });
  </script>
</body>
</html>
