<!DOCTYPE html>
{% include "template-settings" %}
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {%- if editmode -%}editmode{%- else -%}publicmode{%- endif -%}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {%- include "html-head" -%}
  {%- include "template-styles" -%}
</head>

<body class="product_list-page body-bg_picker--area {{ body_bg_type }}{% include 'semimodal-class-names' %}">
  {% include "template-svg-spritesheet" %}
  <div class="body-bg_color"></div>
  <div class="container_wrap">
    {%- include "header" -%}
    <div class="container flex_col flex_j-space-between">
      {%- if editmode -%}
        <div class="bg-picker-top">
          <button
            class="voog-bg-picker-btn body_bg-picker--btn bg-picker {{bodyBgKey}}-picker"
            data-bg_key="{{bodyBgKey}}"
            data-type_picture="false"
            data-type_color="true"
            data-color_elem=".body-bg_color"
            data-picker_area_elem=".body-bg_picker--area"
            data-picker_elem =".{{bodyBgKey}}-picker"
            data-bg-color="{{ body_bg_color }}"
          ></button>
        </div>
      {%- endif -%}

      <main class="content" role="main">
        <div class="content-body content-formatted" data-search-indexing-allowed="true">
          {% contentblock name="page-title" publish_default_content="true" %}
            <h1>{{page.title}}</h1>
          {% endcontentblock %}
        </div>

        {% if editmode %}
          <div class="edit-btn">{% menuadd parent="page" %}</div>
        {% endif %}

        {% include 'product-list-filter' %}
        {% include 'product-list-block' %}
      </main>

      {%- include "footer" -%}
    </div>
  </div>

  {% include 'settings-popover' %}
  {%- include "site-signout" -%}
  {%- include "javascripts" -%}
  {%- include "template-tools" -%}
  <script>
    site.initCommonPage();

    if ($(".js-product-whith-data").length >= 2) {
      $(".product_filters").removeClass('d-none');
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
