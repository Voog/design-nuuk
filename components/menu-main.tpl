<nav class="menu-main p-rel js-menu-main js-popover js-prevent-sideclick{% if _renderMenuTop == true %} menu_top{% endif %}">
  <ul class="menu">

    {%- capture root_menu_item -%}
      {%- unless site.root_item.hidden? %}
        <li data-visible=true class="menu-item lvl-1 top-menu-element {{ _indicatorStyle }}">
          {%- menulink site.root_item current-class="active" -%}
        </li>
      {%- endunless -%}
    {%- endcapture -%}

    {%- if _renderSemimodalMenu == true -%}
      <ul class="menu menu_semimodal-list">
        {{root_menu_item}}
        {{menu_main}}
      </ul>
    {% elsif _renderMenuTop == true %}
      {%- if editmode or _menuTop == true -%}
        <ul class="menu menu_top-list">
          {{root_menu_item}}
          {{menu_main_lvl_1_top_main}}
          <div class="js-menu-popover-btn menu_popover-btn{% if _menuTop != true or menuItemCount <= menuSettingsKey.max_elements %} d-none{% endif %}" data-count="{{menuItemCount}}">
            {% include 'ico-ellipsis' %}
            <li class="menu_popover js-menu-popover{% if _menuTop != true %} d-none{% endif %}">
              <ul class="menu menu_popover-list"></ul>
            </li>
          </div>
        </ul>
        
      {%- endif -%}
    {% endif -%}

    {%- capture menuSettingsBtns -%}
      {% if site.hidden_menuitems.size > 0 %}
        <li class="edit-btn mar_t-16">{% menubtn site.hidden_menuitems %}</li>
      {% endif %}

      <li class="edit-btn mar_t-16" {{ edy_intro_add_page }}>{% menuadd %}</li>
    {%- endcapture -%}

    {%- if _renderSemimodalMenu -%}
      {% if editmode %}
        {{menuSettingsBtns}}
      {% endif %}
    {%- endif -%}
  </ul>
  {% if _renderSemimodalMenu != true -%}
    {% if editmode %}
      <ul class="menu-edy-btns">{{menuSettingsBtns}}</ul>
    {% endif %}
  {%- endif %}
</nav>
