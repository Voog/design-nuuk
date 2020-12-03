{% if site.data.semimodal_settings.is_top_menu == true %}
  {%- assign menuTop = true -%}
{% endif %}
<header class="header_fixed">
  <button class="menu-btn js-menu-btn js-prevent-sideclick{% if menuTop == true %} hidden-desktop{% endif %}">
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

  <div class="{% if menuTop == true %} hidden-mobile{% else %}hidden-mobile hidden-desktop{% endif %}">
    {%- include "menu-main", _menuTop: menuTop -%}
  </div>

  <div class="header_components">
    {% if show_language_menu_popover %}
      <div class="js-toggle-menu-language js-prevent-sideclick" tabindex=0>
        <button class="menu-language-btn ico-flags ico-flag-{{ page.language_code }} js-menu-language-popover-btn" data-lang-code="{{ page.language_locale }}" {{ edy_intro_add_lang }}>
          <span>{{ current_language_title }}</span>
        </button>
        {% if show_language_menu_popover %}
          {% include "menu-language-popover" %}
        {% endif %}
      </div>
    {% endif %}

    {% include "menu-language-list" %}
    {%- if site.search.enabled -%}<div class="js-prevent-sideclick">{%- include "search-btn" -%}</div>{%- endif -%}
    <div class="cart_btn-container"></div>
  </div>
</header>