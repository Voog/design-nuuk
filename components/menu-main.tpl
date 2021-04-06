<nav class="menu-main p-rel js-menu-main js-popover js-prevent-sideclick{% if _menuTop %} menu_top{% endif %}">
  <ul class="menu">
    {{menu_main}}
    <div class="js-menu-popover-btn menu_popover-btn{% if _menuTop != true or menuItemCount <= 5 %} d-none{% endif %}" data-count="{{menuItemCount}}">
      {% include 'ico-ellipsis' %}
    </div>

    {%- capture menuSettingsBtns -%}
      {% if site.hidden_menuitems.size > 0 %}
        <li class="edit-btn mar_t-16">{% menubtn site.hidden_menuitems %}</li>
      {% endif %}

      <li class="edit-btn mar_t-16" {{ edy_intro_add_page }}>{% menuadd %}</li>
    {%- endcapture -%}

    {%- if _semimodalMenu -%}
      {% if editmode %}
        {{menuSettingsBtns}}
      {% endif %}
    {%- endif -%}

  </ul>

  {%- if _semimodalMenu != true -%}
    {% if editmode %}
      <ul class="menu-edy-btns">{{menuSettingsBtns}}</ul>
    {% endif %}
  {%- endif -%}
</nav>
