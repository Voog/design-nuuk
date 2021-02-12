<nav class="menu-main p-rel js-menu-main js-popover js-prevent-sideclick{% if _menuTop %} menu_top{% endif %}">
  {%- if menuSettings.is_product_list_page_visible == false -%}
    {%- assign isProductListItemVisible = false -%}
  {% else %}
    {%- assign isProductListItemVisible = true -%}
  {% endif %}

  {%- if menuSettings.is_product_page_visible == false -%}
    {%- assign isProductItemVisible = false -%}
  {% else %}
    {%- assign isProductItemVisible = true -%}
  {% endif %}

  <ul class="menu">
    {% unless site.root_item.hidden? %}
      <li class="menu-item lvl-1">
        {% menulink site.root_item current-class="active" %}
      </li>
    {% endunless %}

    {% for item in site.visible_menuitems %}
      {%- if item.layout_title == product_list_layout or item.layout_title == product_layout -%}
        {%- if item.layout_title == product_list_layout -%}
          {%- assign itemClass = 'menu-item-product-list' -%}
          {% if isProductListItemVisible == false %}
            {%- assign menuItemDisplayClass = 'hidden' -%}
          {% else %}
            {%- assign menuItemDisplayClass = 'visible' -%}
          {% endif %}

        {%- elsif item.layout_title == product_layout -%}
          {% if isProductItemVisible == false %}
            {%- assign menuItemDisplayClass = 'hidden' -%}
          {% else %}
            {%- assign menuItemDisplayClass = 'visible' -%}
          {% endif %}
          {%- assign itemClass = 'menu-item-product' -%}
        {%- endif -%}

        <li class="{{itemClass}} menu-item lvl-1 {{menuItemDisplayClass}}">
          {% menulink item current-class="active" wrapper-class="menu-item lvl-1" untranslated-class="untranslated fci-editor-menuadd" %}
        </li>
      {%- else -%}
        <li class="menu-item lvl-1">
          {% menulink item current-class="active" untranslated-class="untranslated fci-editor-menuadd" %}
        </li>
      {%- endif -%}

      {% if item.children? or editmode %}
        {% unless item.blog? %}
          <div class="{%- if item.layout_title == product_list_layout or item.layout_title == product_layout %}{{itemClass}} {{menuItemDisplayClass}}{%- endif -%}">
            <div class="menu-sub js-menu-sub{% if item.children?%} mar_8-0{% endif %}{% if item.selected? %} active{% endif %}{% if _menuTop %} d-none{% endif %}">
              <ul class="menu">
                {% for subitem in item.visible_children %}
                  {% if subitem.layout_title == product_list_layout or subitem.layout_title == product_layout %}

                    {%- if subitem.layout_title == product_list_layout -%}
                      {%- assign subItemClass = 'menu-item-product-list' -%}
                      {% if isProductListItemVisible == false %}
                        {%- assign menuSubItemDisplayClass = 'hidden' -%}
                      {% else %}
                        {%- assign menuSubItemDisplayClass = 'visible' -%}
                      {% endif %}

                    {%- elsif subitem.layout_title == product_layout -%}
                      {% if isProductItemVisible == false %}
                        {%- assign menuSubItemDisplayClass = 'hidden' -%}
                      {% else %}
                        {%- assign menuSubItemDisplayClass = 'visible' -%}
                      {% endif %}
                      {%- assign subItemClass = 'menu-item-product' -%}
                    {%- endif -%}

                    <div class="{{subItemClass}} {{menuSubItemDisplayClass}}">
                      {% menulink subitem wrapper-tag="li" wrapper-class="menu-item" current-class="active" untranslated-class="untranslated fci-editor-menuadd" %}
                    </div>
                  {% else %}
                    {% menulink subitem wrapper-tag="li" wrapper-class="menu-item" current-class="active" untranslated-class="untranslated fci-editor-menuadd" %}
                  {% endif %}
                {% endfor %}
                {% if item.hidden_children.size > 0 %}
                  <li class="edit-btn mar_t-16">{% menubtn item.hidden_children %}</li>
                {% endif %}
              </ul>
            </div>
          </div>
        {% endunless %}
      {% endif %}

      {% unless item.blog? %}
          {%- if item.selected? and editmode and _semimodalMenu -%}
            <div class="{%- if item.layout_title == product_list_layout or item.layout_title == product_layout %}{{itemClass}} {{menuItemDisplayClass}}{%- endif -%}">
              <li class="edit-btn mar_b-16">{% menuadd parent="item" %}</li>
            </div>
          {%- endif -%}
      {% endunless %}
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
