<nav class="menu-main p-rel js-menu-main js-popover js-prevent-sideclick{% if _menuTop %} menu_top{% endif %}">
  <ul class="menu">
    {% unless site.root_item.hidden? %}
      {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-item lvl-1" current-class="active" %}
    {% endunless %}

    {% for item in site.visible_menuitems %}
      {% menulink item wrapper-tag="li" wrapper-class="menu-item lvl-1" current-class="active" untranslated-class="untranslated fci-editor-menuadd" %}

      {% if item.children? %}
        <div class="menu-sub js-menu-sub{% if item.selected? %} active{% endif %}{% if _menuTop %} d-none{% endif %}">
          <ul class="menu">
            {% for subitem in item.visible_children %}
              {% if subitem.layout_title == product_layout %}
                {% if menuSettings.is_product_page_visible == false %}
                  {%- assign menuItemDisplayClass = 'hidden' -%}
                {% else %}
                  {%- assign menuItemDisplayClass = 'visible' -%}
                {% endif %}

                <div class="menu-item-product {{menuItemDisplayClass}}">
                  {% menulink subitem wrapper-tag="li" wrapper-class="menu-item" current-class="active" untranslated-class="untranslated fci-editor-menuadd" %}
                </div>
              {% else %}
                {% menulink subitem wrapper-tag="li" wrapper-class="menu-item" current-class="active" untranslated-class="untranslated fci-editor-menuadd" %}
              {% endif %}

            {% endfor %}
            {% if item.hidden_children.size > 0 %}
              <li class="edit-btn">{% menubtn item.hidden_children %}</li>
            {% endif %}
            {% if editmode %}
              <li class="edit-btn">{% menuadd parent="item" %}</li>
            {% endif %}
          </ul>
        </div>
      {% endif %}
    {% endfor %}

    {%- if site.visible_menuitems.size > 5 -%}
      <div class="js-menu-popover-btn menu_popover-btn{% if _menuTop != true %} d-none{% endif %}">
        {% include 'ico-ellipsis' %}
      </div>
    {%- endif -%}

    <li class="menu_popover js-menu-popover{% if _menuTop != true %} d-none{% endif %}">
      <ul class="menu">
        {% for item in site.visible_menuitems %}
          {% menulink item wrapper-tag="li" wrapper-class="menu-item menu_popover-item" current-class="active" untranslated-class="untranslated fci-editor-menuadd" %}
        {% endfor %}
      </ul>
    </li>

    {%- capture menuSettingsBtns -%}
      {% if site.hidden_menuitems.size > 0 %}
        <li class="edit-btn">{% menubtn site.hidden_menuitems %}</li>
      {% endif %}

      <li class="edit-btn" {{ edy_intro_add_page }}>{% menuadd %}</li>
    {%- endcapture -%}

    {%- if _semimodalMenu -%}
      {% if editmode %}
        {{menuSettingsBtns}}
      {% endif %}
    {%- endif -%}

  </ul>

  {%- if _semimodalMenu != true -%}
    <ul class="menu-edy-btns">{{menuSettingsBtns}}</ul>
  {%- endif -%}
</nav>
