<!DOCTYPE html>
{% include "template-settings" %}
{% include "template-variables" %}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %} {% include "semimodal-class-names" %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" %}
</head>

{% capture bottom_content_html %}{% unless editmode %}{% content bind=product name="content" %}{% endunless %}{% endcapture %}
{% capture bottom_content_size %}{{ bottom_content_html | size | minus: 1 }}{% endcapture %}
{% unless bottom_content_size contains "-" %}
  {% assign bottom_content_has_content = true %}
{% endunless %}

<body class="product-page body-bg_picker--area {{ body_bg_type }}">
  {%- capture _button_attributes %}
    data-product-id="{{ product.id }}"
    data-product="{{ product | json | escape }}"
    data-settings="{&quot;title&quot;:&quot;{{ "add_to_cart" | lc | escape_once }}&quot;,&quot;button_style&quot;:&quot;with_price&quot;}"
  {% endcapture -%}
  {% include "template-svg-spritesheet" %}
  <div class="body-bg_color"></div>

  <div class="container_wrap">
    {% include "header" %}
    <div class="pad_container p-rel">
      <div class="container">
        <div class="mar_t-32 mar_b-32">
          {% include "menu-breadcrumbs" %}
        </div>

        <main class="content" role="main" data-search-indexing-allowed="true">
          <div class="flex_row flex_row-2 reverse-col-tablet mar_0-32-neg">
            <div class="flex_row-2--item-60">
              <div class="mar_0-32 p-rel js-product-page-image-wrap">
                {%- assign productImage = product.image -%}

                {%- if productImage != blank %}
                  {% assign item_image_state = "with-image" %}
                {% else %}
                  {% assign item_image_state = "without-image" %}
                {% endif -%}

                <div class="js-product-page-image mar_b-32">
                  <div class="content-item-box {{ item_image_state }} js-content-item-box not-loaded">
                    <div class="item-top">
                      <div class="top-inner of-hidden">
                        {%- if productImage != blank -%}
                          <div class="loader js-loader"></div>
                          {%- assign imageClass = "item-image " | append: "not-cropped " | append: "js-lazyload" -%}
                          {% image_data productImage target_width="1280" class: imageClass %}
                        {%- endif -%}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <section class="content-body content-formatted mar_0-32" data-search-indexing-allowed="true">
                {% content bind=product name="gallery" %}
              </section>
            </div>

            <div class="flex_row-2--item-40">
              <div class="mar_0-32 flex_col t-sticky">
                <div class="flex_row flex_a-center flex_j-space-between mar_b-32">
                  <div class="content-body content-formatted" data-search-indexing-allowed="true">
                    <h3>
                      {{- product.title -}}
                    </h3>

                    {%- if product.out_of_stock? -%}
                      <div class="product_item-box--label mar_t-32">{{ "out_of_stock" | lc | escape_once }}</div>
                    {%- endif -%}

                  </div>
                </div>
                <section class="content-body content-formatted js-buy-btn-content mar_32-0" data-search-indexing-allowed="true">
                  <div class="product-price bold mar_b-16">
                    {%- if product.price_max_with_tax != product.price_min_with_tax -%}
                      {{ product.price_min_with_tax | money_with_currency: product.currency -}}
                        <span class="pad_0-4">–</span>
                      {%- endif -%}
                      {{ product.price_max_with_tax | money_with_currency: product.currency }}
                  </div>
                  {%- if product.description != blank -%}
                    <div class="content-product-description">
                      {{- product.description -}}
                    </div>
                  {%- endif -%}
                  {% content bind=product %}
                  <div class="content-buy-button mar_t-32">
                    {% include "buy-button" %}
                  </div>
                </section>
              </div>
            </div>
          </div>

          {%- if bottom_content_has_content == true or editmode -%}
            <section
              class="content-body content-formatted content-formatted--overflowed-images mar_b-32"
              data-search-indexing-allowed="true">
              {% content bind=product name="content" %}
            </section>
          {%- endif -%}
        </main>
      </div>
    </div>
    {% include "footer" %}
  </div>

  {% include "template-tooltips" %}
  {% include "site-signout" %}
  {% include "javascripts"%}
  <script>
    site.handleProductPageContent();
  </script>
  {% include "settings-popover" %}
</body>
</html>
