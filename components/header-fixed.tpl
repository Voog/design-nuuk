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
    {% if show_language_menu_popover %}
      <button class="menu-language-btn ico-flags ico-flag-{{ page.language_code }} js-toggle-menu-language js-menu-language-popover-btn" data-lang-code="{{ page.language_locale }}" data-sideclick="prevent" {{ edy_intro_add_lang }}>
        <span>{{ current_language_title }}</span>
        <svg class="menu-language-btn-circle" width="9" height="9" viewBox="0 0 9 9" xmlns="http://www.w3.org/2000/svg">
          <use xlink:href="#ico-circle"></use>
        </svg>
      </button>
    {% endif %}

    {% include "menu-language-list" %}
    {%- if site.search.enabled -%}{%- include "search-btn" -%}{%- endif -%}
  </div>
  {% if show_language_menu_popover %}
    {% include "menu-language-popover" %}
  {% endif %}
</div>