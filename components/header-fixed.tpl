<div class="header_fixed">
  <button class="menu-btn js-menu-btn js-prevent-sideclick">
    <div>
      <span class="menu-stripe"></span>
      <span class="menu-stripe"></span>
    </div>
    <label>{{ 'menu' | lc }}</label>
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
      <div class="js-toggle-menu-language" tabindex=0>
        <button class="menu-language-btn ico-flags ico-flag-{{ page.language_code }} js-menu-language-popover-btn" data-lang-code="{{ page.language_locale }}" {{ edy_intro_add_lang }}>
          <span>{{ current_language_title }}</span>
          <svg class="menu-language-btn-circle" width="9" height="9" viewBox="0 0 9 9" xmlns="http://www.w3.org/2000/svg">
            <use xlink:href="#ico-circle"></use>
          </svg>
        </button>
        {% if show_language_menu_popover %}
          {% include "menu-language-popover" %}
        {% endif %}
      </div>
    {% endif %}

    {% include "menu-language-list" %}
    {%- if site.search.enabled -%}{%- include "search-btn" -%}{%- endif -%}

  </div>
</div>