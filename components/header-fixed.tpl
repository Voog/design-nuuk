<div class="header_fixed">
  <button class="menu-btn js-menu-btn js-prevent-sideclick">
    <span class="menu-stripe"></span>
    <span class="menu-stripe"></span>
  </button>
  <div class="header_title content-formatted">
    {%- unless editmode -%}
      <a href="{{ site.root_item.url }}">
    {%- endunless -%}
      {%- editable site.header -%}
    {%- unless editmode -%}
      </a>
    {%- endunless -%}
  </div>
  <div class="header_components">
    {%- if site.search.enabled -%}{%- include "search-btn" -%}{%- endif -%}
    {%- if editmode or site.has_many_languages? -%}
      <nav class="menu-lang">
        {%- include "menu-lang" -%}
      </nav>
    {%- endif -%}
  </div>
</div>