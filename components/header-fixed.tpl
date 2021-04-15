{%- assign menuPos = site.data[menuSettingsKey].positioning -%}
{% if menuPos == 'is_top' or menuPos == 'is_top_fixed'%}
  {%- assign menuTop = true -%}
{% endif %}

<header class="header_fixed{% if menuPos == 'is_top_fixed'%} relative{% endif %}{% if menuTop %} menu-top{% endif %}">
  <div class="header_fixed-content">
    <button class="menu-btn js-menu-btn js-prevent-sideclick{% if menuTop == true %} hidden-desktop{% endif %}">
      <div>
        <span class="menu-stripe"></span>
        <span class="menu-stripe"></span>
      </div>
      <label>{{ 'menu' | lc }}</label>
    </button>

    <div class="header_title content-formatted">
      {%- if menuSettings.positioning ==  "is_side_always_open" -%}
        {% assign isReadOnly = true %}
      {%- else -%}
        {% assign isReadOnly = false %}
      {%- endif -%}
      {% contentblock name="site_title" xpage="true"  publish_default_content="true" readonly=isReadOnly %}
        {{site.header}}
      {% endcontentblock %}
    </div>

    <div class="p-rel js-menu-main-wrapper menu-main-wrapper{% if menuTop == true %} hidden-tablet{% else %} hidden-tablet hidden-desktop{% endif %}">
      {%- include "menu-main", _menuTop: menuTop -%}
    </div>

    <div class="header_components">
      {% if show_language_menu_popover %}
        <div class="hidden-tablet js-toggle-menu-language menu-language-toggle js-prevent-sideclick p-rel" tabindex=0>
          <button class="menu-language-btn ico-flags ico-flag-{{ page.language_code }} js-menu-language-popover-btn" data-lang-code="{{ page.language_locale }}" {{ edy_intro_add_lang }}>
            <span>{{ current_language_title }}</span><span class="mar_l-4">{% include 'ico-chevron-down' %}</span>
          </button>
          {% if show_language_menu_popover %}
            {% include "menu-language-popover" %}
          {% endif %}
          {% include "menu-language-list" %}
        </div>
      {% endif %}
      {%- if site.search.enabled -%}<div class="js-prevent-sideclick">{%- include "search-btn" -%}</div>{%- endif -%}
      <div class="cart_btn">
        <div class="cart_btn-icon">
          {% include 'ico-cart' %}
        </div>
      <div class="cart_btn-count"></div>
    </div>
  </div>
</header>