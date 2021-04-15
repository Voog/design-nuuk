{%- if page.layout_title == product_layout -%}
  {%- assign level_str = 'menuitems_with_hidden_on_level_' | append: page.level -%}
  {%- assign productPageUrls = ',' | split: ','-%}
  {%- for level in site[level_str] -%}
    {%- if level.layout_title == product_layout -%}
      {%- assign productPageUrls = productPageUrls | push: level.url -%}
    {%- endif -%}
  {%- endfor -%}

  {%- for url in productPageUrls -%}
    {%- if page.url == url -%}
      {%- unless forloop.first -%}
        {%- assign prevIndex = forloop.index | minus: 2 -%}
      {%- endunless -%}
      {%- unless forloop.last -%}
        {%- assign nextIndex = forloop.index -%}
      {%- endunless -%}
      {%- break -%}
    {%- endif -%}
  {%- endfor -%}

  <div class="product_page-nav--wrap">
    {%- if nextIndex >= 0 -%}
      <a class="product_page-nav--link product_page-nav--right"  title="{{ "next" | lce | escape_once }}" href="{{productPageUrls[nextIndex]}}"></a>
    {%- endif -%}
    {%- if prevIndex >= 0 -%}
      <a class="product_page-nav--link product_page-nav--left" title="{{ "previous" | lce | escape_once }}" href="{{productPageUrls[prevIndex]}}"></a>
    {%- endif -%}
  </div>
{%- endif -%}