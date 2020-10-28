<button class="menu-btn js-menu-btn js-prevent-sideclick">
  <span class="menu-stripe"></span>
  <span class="menu-stripe"></span>
</button>
{% include 'image_src_variable', _data: site.data.semimodal_image, _targetWidth: "1000" %}
<div class="semimodal js-semimodal js-prevent-sideclick semimodal_bg-image bg_img-cover"
  {% if _src != blank -%}
    style="background-image: url({{_src}});"
  {%- endif -%}
>
  <div class="semimodal_bg-color bg_color-absolute"
    {% if site.data.semimodal_image.color != blank %}
      style="background-color: {{ site.data.semimodal_image.color }};"
    {% endif %}
  ></div>
  {% if editmode %}
    <button class="bg-picker" data-entity="siteData" data-picture="true" data-color="true" data-image_elem=".semimodal_bg-image" data-color_elem=".semimodal_bg-color" data-name="semimodal_image" data-bg="{{ site.data.semimodal_image | json | escape }}"></button>
  {% endif %}
  <header class="header">
    <div class="js-close-menu close-menu-btn bg_img-cover"></div>
    <div class="header-top">
      {% if site.search.enabled %}{% include "search" %}{% endif %}

      {% if editmode or site.has_many_languages? %}
        <nav class="menu-lang">
          {% include "menu-lang" %}
        </nav>
      {% endif %}
    </div>

    <div class="header-bottom">
      <div class="header-title content-formatted">
        {%- unless editmode -%}
          <a href="{{ site.root_item.url }}">
        {%- endunless -%}
          {% editable site.header %}
        {%- unless editmode -%}
          </a>
        {%- endunless -%}
      </div>

      <nav class="menu-main js-menu-main js-popover js-prevent-sideclick">
        {% include "menu-level-1" %}
      </nav>
    </div>
  </header>
</div>
