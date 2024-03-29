<!DOCTYPE html>
{%- include "template-settings"-%}
{%- include "template-variables" product_page: true -%}
<html class="{% include "language-menu-class-names" %} {% if editmode %}editmode{% else %}publicmode{% endif %} {% include "semimodal-class-names" %}" lang="{{ page.language_code }}">
<head prefix="og: http://ogp.me/ns#">
  {% include "html-head" %}
  {% include "template-styles" %}

  {% sd_product %}
</head>

{% capture bottom_content_html %}{% unless editmode %}{% content bind=product name="content" %}{% endunless %}{% endcapture %}
{% capture bottom_content_size %}{{ bottom_content_html | size | minus: 1 }}{% endcapture %}
{% unless bottom_content_size contains "-" %}
  {% assign bottom_content_has_content = true %}
{% endunless %}

{%- capture product_social_html -%}
  {%- unless editmode -%}
    {%- xcontent name="product-social" -%}
  {%- endunless -%}
{%- endcapture -%}

{%- assign product_social_size = product_social_html | strip | size -%}

<body class="product-page body-bg_picker--area {{ body_bg_type }}">
  {% include "template-svg-spritesheet" %}
  <div class="body-bg_color"></div>

  <div class="container_wrap">
    {% include "header" %}
    <div class="pad_container p-rel">
      {% if editmode %}
        <div class="bg-picker-top">
          <button
            class="voog-bg-picker-btn body_bg-picker--btn bg-picker {{ productBodyBgKey }}-picker"
            data-bg_key="{{ productBodyBgKey }}"
            data-type_picture="false"
            data-type_color="true"
            data-color_elem=".body-bg_color"
            data-picker_area_elem=".body-bg_picker--area"
            data-picker_elem =".{{ productBodyBgKey }}-picker"
            data-bg-color="{{ body_bg_color }}"
            data-entity="siteData"
          ></button>
        </div>
      {% endif %}
      <div class="container">
        <div class="mar_t-32 mar_b-32">
          {% include "menu-breadcrumbs-sd" %}
        </div>

        <main class="content product-content" role="main" data-search-indexing-allowed="true">
          <div class="flex_row flex_row-2 reverse-col-tablet mar_0-32-neg">
            <div class="flex_row-2--item-60">
              <div class="mar_0-32 p-rel js-product-page-image-wrap">
                {%- if product.photos != blank %}
                  {% assign item_image_state = "with-images" %}
                {% else %}
                  {% assign item_image_state = "without-images" %}
                {% endif -%}

                <div class="js-product-page-image mar_b-32">
                  <div class="content-item-box {{ item_image_state }}">
                    <div class="item-top without-pointer">
                      <div class="top-inner of-hidden">
                        {%- if product.photos != blank -%}
                          <div class="item-image">
                            {% gallery product layout="product_slider" %}
                          </div>
                        {%- endif -%}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <section class="content-body content-formatted mar_0-32" data-search-indexing-allowed="true">
                {%- assign gallery_title = "gallery" | lce -%}
                {%- assign gallery_title_tooltip = "content_tooltip_additional_images" | lce -%}
                {% content
                  bind=product
                  name="gallery"
                  title=gallery_title
                  title_tooltip=gallery_title_tooltip
                %}
              </section>
            </div>

            <div class="flex_row-2--item-40">
              <div class="mar_0-32 flex_col t-sticky">
                <div class="flex_row flex_a-center flex_j-space-between mar_b-32">
                  <div class="content-body content-formatted product-name w-100p" data-search-indexing-allowed="true">
                    <h3>
                      {%- editable product.name -%}
                    </h3>

                    {%- if product.out_of_stock? -%}
                      <div class="product_item-box--label mar_t-32">{{ "out_of_stock" | lc | escape_once }}</div>
                    {%- endif -%}

                  </div>
                </div>
                <section class="content-body content-formatted js-buy-btn-content mar_32-0" data-search-indexing-allowed="true">
                  {%- capture original_price -%}
                    {% if product.price_min_with_tax != product.price_max_with_tax -%}
                      {{- product.price_min_with_tax | money_with_currency: product.currency -}}
                      <span> – </span>
                    {%- endif -%}
                    {{- product.price_max_with_tax | money_with_currency: product.currency -}}
                  {%- endcapture -%}

                  <div class="product-price bold mar_b-16">
                    {% if product.on_sale? -%}
                      <s class="product-price-original">
                        {{- original_price -}}
                      </s>
                    {% endif -%}

                    <span class="product-price-final">
                      {%- if product.on_sale? -%}
                        {% if product.effective_price_min_with_tax != product.effective_price_max_with_tax %}
                          {{- product.effective_price_min_with_tax | money_with_currency: product.currency -}}
                          <span> – </span>
                        {%- endif -%}
                        {{- product.effective_price_max_with_tax | money_with_currency: product.currency -}}
                      {% else %}
                        {{ original_price }}
                      {% endif -%}
                    </span>
                  </div>

                  {%- if editmode or product.description != blank -%}
                    <div class="content-product-description">
                      {%- editable product.description -%}
                    </div>
                  {%- endif -%}

                  <div class="content-buy-button mar_t-32">
                    {% include "buy-button" %}
                  </div>

                  {%- if editmode or product_social_size > 0 -%}
                    <div class="mar_b-32">
                      {%- assign cross_page_info_title = "cross_page_info" | lce  -%}
                      {%- assign cross_page_info_title_tooltip = "content_tooltip_all_pages_same_type" | lce -%}
                      {% xcontent
                        name="product-social"
                        title=cross_page_info_title
                        title_tooltip=cross_page_info_title_tooltip
                      %}
                    </div>
                  {%- endif -%}

                  {%- assign content_title = "content" | lce -%}
                  {%- assign content_title_tooltip = "content_tooltip_specific_page" | lce -%}
                  {% content bind=product title=content_title title_tooltip=content_title_tooltip %}
                </section>
              </div>
            </div>
          </div>

          {%- if bottom_content_has_content == true or editmode -%}
            <section
              class="content-body content-formatted content-formatted--overflowed-images mar_b-32"
              data-search-indexing-allowed="true">
              {%- assign bottom_content_title = "additional_content" | lce -%}
              {%- assign bottom_content_title_tooltip = "content_tooltip_additional_information" | lce -%}
              {% content
                bind=product
                name="content"
                title=bottom_content_title
                title_tooltip=bottom_content_title_tooltip
              %}
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
    if (site) {
      site.handleProductPageContent();
    }
  </script>
  {% include "settings-popover" %}
</body>
</html>
