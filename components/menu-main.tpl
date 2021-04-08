<nav class="menu-main p-rel js-menu-main js-popover js-prevent-sideclick{% if _menuTop == true %} menu_top{% endif %}">
  <ul class="menu">

    {%- unless site.root_item.hidden? %}
      <li class="menu-item lvl-1">
        {%- menulink site.root_item current-class="active" -%}
      </li>
    {%- endunless -%}
    {%- if _renderSemimodalMenu == true -%}
      {{menu_main}}
    {% elsif _renderMenuTop == true %}
      {%- if editmode or _menuTop == true -%}
        {{menu_main_lvl_1_top_main}}
      {%- endif -%}
    {% endif -%}

    {% if editmode or _menuTop == true -%}
      <li class="menu_popover js-menu-popover{% if _menuTop != true %} d-none{% endif %}">
        <ul class="menu menu_popover-list"></ul>
      </li>
    {%- endif %}
    <div class="js-menu-popover-btn menu_popover-btn{% if _menuTop != true or menuItemCount <= 5 %} d-none{% endif %}" data-count="{{menuItemCount}}">
      {% include 'ico-ellipsis' %}
    </div>
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
