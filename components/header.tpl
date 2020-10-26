<button class="menu-btn js-menu-btn js-prevent-sideclick">
  <span class="menu-stripe"></span>
  <span class="menu-stripe"></span>
  <span class="menu-stripe"></span>
</button>
<div class="semimodal js-semimodal js-prevent-sideclick">
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
