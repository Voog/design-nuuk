<!DOCTYPE html>
<html class="{% if editmode %}editmode{% else %}public{% endif %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "template-variables" %}
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

<body class="product-page js-bg-picker-area">
  {% if editmode %}
    <button class="voog-bg-picker-btn js-background-settings" data-bg-key="body_bg" data-bg-picture-boolean="true" data-bg-image="{{ body_bg_image }}" data-bg-image-sizes="{{ body_bg_image_sizes_str | escape }}" data-bg-color="{{ body_bg_color }}" data-bg-color-data="{{ body_bg_color_data_str | escape }}"></button>
  {% endif %}

  <div class="background-image js-background-image"></div>
  <div class="background-color js-background-color"></div>

  <div class="container js-bg-picker-area">
    <div class="js-background-type {{ container_bg_type }}">
      <div class="background-color js-background-color">
        {% if editmode %}
          <button class="voog-bg-picker-btn js-background-settings" data-bg-key="container_bg" data-bg-picture-boolean="false" data-bg-color="{{ container_bg_color }}" data-bg-color-data="{{ container_bg_color_data_str | escape }}"></button>
        {% endif %}

        {% include "header" %}
        {% include "menu-level-2" %}

        <main class="content" role="main" data-search-indexing-allowed="true">

          <div class="flex_row flex_row-2 mar_0-16-neg flex_a-center">
            {% include 'image_src_variable', _data: page.data.product_image, _targetWidth: "1200" %}
            <div class="flex_row-2--item">
              <div class="mar_0-16">
                <div
                  class="product_image bg_img-cover{%- if _src != blank %} image_portrait{%- endif -%}"
                  {% if _src != blank -%}
                    style="background-image: url({{_src}});"
                  {%- endif -%}
                >
                  {% if editmode %}
                    <button class="bg-picker" data-picture="true" data-color="false" data-elem=".product_image" data-name="product_image" data-bg="{{ page.data.product_image | json | escape }}"></button>
                  {% endif %}
                </div>
              </div>
            </div>

            <div class="flex_row-2--item">
              <div class="mar_0-16 flex_col flex_a-center flex_j-center">
                <h3>{{page.title}}</h3>
                <section class="content-body content-formatted">{% content %}</section>
                <section class="content-body content-formatted">{% content name="product-content-1" %}</section>
              </div>
            </div>
          </div>

          <h3 class="visits-title" style="display: none;">Eelnevalt vaadatud tooted</h3>
          <div class="product_list flex_row flex_row-3 mar_0-8-neg pad_40-0">
            {%- for i in (1..4) -%}
              {%- assign level_str = 'menuitems_on_level_' | append: i -%}
              {%- for item in site[level_str] -%}
                {%- for item_child in item.visible_children_with_data -%}
                  {%- if item_child.layout_title == product_layout -%}
                    {%- load buy_button to "buy_button" q.content.parent_id=item_child.page_id q.content.parent_type="page" -%}
                    {%- assign product = buy_button.product -%}
                    <div class="product_item js-product-item flex_row-3--item scale-up" data-path="{{item_child.path}}" style="display: none;">
                      {% include 'image_src_variable', _data: item_child.data.product_image, _targetWidth: "500" %}
                      <div class="mar_0-8 mar_b-32 content-formatted">
                        <div
                          class="product_image bg_img-cover{%- if _src != blank %} image_square{%- endif -%}"
                          {% if _src != blank -%}
                            style="background-image: url({{_src}});"
                          {%- endif -%}
                        >
                          {%- if buy_button.content -%}
                            {%- content content=buy_button.content -%}
                          {%- endif -%}
                        </div>
                        <div class="p14 mar_t-16">
                          <a class="bold" href="{{ item.url }}">
                            {{ item.title }}
                          </a>
                          <div>{{ product.price }}</div>
                        </div>
                      </div>
                    </div>
                    {%- if forloop.index == 4 -%}
                      {% break %}
                    {%- endif -%}
                  {%- endif -%}
                {%- endfor -%}
              {%- endfor -%}
            {%- endfor -%}
          </div>
        </main>
        {% include "footer" %}
      </div>
    </div>
  </div>

  {% include "site-signout" %}
  {% include "javascripts" %}
  {% include "template-tools" %}
  <script>
    site.initCommonPage();
  </script>
  <script>
    var visitUrls = [];
    var locationPathName = window.location.pathname.slice(1);

    // Parse the serialized data back into an aray of objects
    visitUrls = JSON.parse(localStorage.getItem('session')) || [];
    // Push the new data (whether it be an object or anything else) onto the array
    visitUrls.push(locationPathName);
    // Re-serialize the array back into a string and store it in localStorage
    var unique = visitUrls.filter(function(elem, index, self) {
      return index === self.indexOf(elem);
    })
    localStorage.setItem('session', JSON.stringify(unique));

    $( ".js-product-item" ).each(function() {
      var path = $(this).attr( "data-path" );
      if (unique.includes(path) && path !== locationPathName) {
        console.log($(this).attr( "data-path" ))
        $(this).show();
      }
    });

    var visitUrls = [];
    var locationPathName = window.location.pathname.slice(1);

    // Parse the serialized data back into an aray of objects
    visitUrls = JSON.parse(localStorage.getItem('session')) || [];
    // Push the new data (whether it be an object or anything else) onto the array
    visitUrls.unshift(locationPathName);
    // Re-serialize the array back into a string and store it in localStorage
    var uniqueVisits = visitUrls.filter(function(elem, index, self) {
      return index === self.indexOf(elem);
    })

    localStorage.setItem('session', JSON.stringify(uniqueVisits));

    var visitsWithoutCurrent = uniqueVisits.filter(e => e !== locationPathName)

    if (visitsWithoutCurrent.length >= 1) {
      $('.visits-title').show();
    }
  </script>
</body>
</html>
