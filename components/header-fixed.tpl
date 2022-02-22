<header class="header_fixed semimodal-bg_picker--area {{ semimodal_bg_type }}{% if _menuPos == 'is_top_fixed' %} relative{% endif %}{% if _menuTop == true %} menu-top{% endif %}">
  <div class="semimodal-bg_color bg_color-absolute{% if _menuPos == 'is_side_always_open' %} hidden-desktop{% endif %}"
      {%- if semimodal_bg.color != blank %}
        style="background-color: {{ semimodal_bg.color }};"
      {%- endif -%}
    ></div>
  <div class="header_fixed-content">
    <button class="menu-btn js-menu-btn js-prevent-sideclick{% if _menuTop == true %} hidden-desktop{% endif %}">
      <div>
        <span class="menu-stripe"></span>
        <span class="menu-stripe"></span>
      </div>
      <label>{{ 'menu' | lc }}</label>
    </button>

    <div class="header_title content-formatted">
      {%- if menuSettings.positioning ==  "is_side_always_open" -%}
        {%- assign isReadOnly = true -%}
      {%- else -%}
        {%- assign isReadOnly = false -%}
      {%- endif -%}
      {% contentblock name="site_title" xpage="true"  publish_default_content="true" readonly=isReadOnly %}
        {{site.header}}
      {% endcontentblock %}
    </div>

    {% if _menuTop == true or editmode -%}
      <div class="p-rel js-menu-main-wrapper menu-main-wrapper{% if _menuTop == true %} hidden-tablet{% else %} hidden-tablet hidden-desktop{% endif %}">
        {% include "menu-main", _menuTop: _menuTop, _renderMenuTop: true, _indicatorStyle: menuSettings.indicator -%}
      </div>
    {% endif %}

    {%- if editmode -%}
      <div class="header_fixed_picker-btn js-prevent-sideclick{% if _menuTop == false %} hidden-desktop{% endif %}">
        <button class="bg-picker"
          data-type_picture="false"
          data-type_color="true"
          data-color_elem=".semimodal-bg_color"
          data-picker_area_elem=".semimodal-bg_picker--area"
          data-picker_elem=".semimodal-bg_picker"
          data-bg_key="{{semimodalBgKey}}"
          data-bg="{{ semimodal_bg | json | escape }}"
          data-entity="siteData"
        ></button>
      </div>
    {%- endif -%}

    <div class="header_components">
      <div class="header_components-menu--top">
        {% if show_language_menu_popover %}
          <div class="js-menu-language">
            <div class="js-toggle-menu-language menu-language-toggle js-prevent-sideclick p-rel" tabindex=0>
              <button class="menu-language-btn ico-flags ico-flag-{{ page.language_code }} js-menu-language-popover-btn" data-lang-code="{{ page.language_locale }}" {{ edy_intro_add_lang }}>
                <span>{{ current_language_title }}</span><span class="mar_l-4">{% include 'ico-chevron-down' %}</span>
              </button>
              {% if show_language_menu_popover %}
                {% include "menu-language-popover" %}
              {% endif %}
            </div>
          </div>
        {% endif %}
        {%- if site.search.enabled -%}
          <div class="js-prevent-sideclick">{%- include "search-btn" -%}</div>
        {%- endif -%}
      </div>
      <div class="cart_btn">
        <div class="cart_btn-icon">
          {% include 'ico-cart' %}
        </div>
        <div class="cart_btn-count"></div>
      </div>
    </div>
  </div>
</header>
