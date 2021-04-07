{%- assign menuItemCount = 0 -%}
{%- assign menu_main_lvl_1 = '' -%}
{%- if menuSettings.is_product_list_page_visible == false -%}
  {%- assign isProductListItemVisible = false -%}
{% else %}
  {%- assign isProductListItemVisible = true -%}
{% endif %}

{%- if menuSettings.is_product_page_visible == false -%}
  {%- assign isProductItemVisible = false -%}
{% else %}
  {%- assign isProductItemVisible = true -%}
{%- endif -%}


{%- capture menu_main -%}
  {% for item in site.visible_menuitems %}
    {% capture menu_main_lvl_1_item %}
      {%- if item.layout_title == product_list_layout or item.layout_title == product_layout %}
        {%- if item.layout_title == product_list_layout -%}
          {%- assign itemClass = 'menu-item-product-list' -%}
          {%- if isProductListItemVisible == false -%}
            {%- assign menuItemDisplayClass = 'hidden' -%}
          {%- else -%}
            {%- assign menuItemCount = menuItemCount | plus: 1 -%}
            {%- assign menuItemDisplayClass = 'visible' -%}
          {%- endif -%}

        {%- elsif item.layout_title == product_layout -%}
          {% if isProductItemVisible == false -%}
            {%- assign menuItemDisplayClass = 'hidden' -%}
          {%- else -%}
            {%- assign menuItemDisplayClass = 'visible' -%}
            {%- assign menuItemCount = menuItemCount | plus: 1 -%}
          {%- endif -%}
          {%- assign itemClass = 'menu-item-product' -%}
        {%- endif -%}

        <li class="{{itemClass}} menu-item lvl-1{% if item.children? and item.blog? != true and item.selected? %} has-children{% endif %} {{menuItemDisplayClass}}">
          {%- menulink item current-class="active" wrapper-class="menu-item lvl-1" untranslated-class="untranslated fci-editor-menuadd" -%}
        </li>
      {% else %}
        <li class="menu-item{% if item.children? and item.blog? != true and item.selected?%} has-children{% endif %} lvl-1">
          {%- menulink item current-class="active" untranslated-class="untranslated fci-editor-menuadd" -%}
        </li>
        {%- assign menuItemCount = menuItemCount | plus: 1 -%}
      {% endif -%}
    {%- endcapture -%}
    {%- assign menu_main_lvl_1 = menu_main_lvl_1 | append: menu_main_lvl_1_item  -%}
    {{menu_main_lvl_1_item}}
    {%- if item.children? or editmode -%}
      {%- unless item.blog? %}
        <div class="{%- if item.layout_title == product_list_layout or item.layout_title == product_layout %}{{itemClass}} {{menuItemDisplayClass}}{%- endif -%}">
          <div class="menu-sub{% if item.selected? %} active{% endif %}">
            <ul class="menu">
              {% for subitem in item.visible_children %}
                {%- if subitem.layout_title == product_list_layout or subitem.layout_title == product_layout -%}
                  {%- if subitem.layout_title == product_list_layout -%}
                    {%- assign subItemClass = 'menu-item-product-list menu-item-sub' -%}
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
                    {%- assign subItemClass = 'menu-item-product menu-item-sub' -%}
                  {%- endif -%}

                  <div class="{{subItemClass}} {{menuSubItemDisplayClass}}">
                    {%- menulink subitem wrapper-tag="li" wrapper-class="menu-item" current-class="active" untranslated-class="untranslated fci-editor-menuadd" -%}
                  </div>
                {% else %}
                  {%- menulink subitem wrapper-tag="li" wrapper-class="menu-item menu-item-sub" current-class="active" untranslated-class="untranslated fci-editor-menuadd" -%}
                {% endif %}
              {%- endfor %}
              {%- if item.hidden_children.size > 0 -%}
                <li class="edit-btn mar_t-16">{% menubtn item.hidden_children %}</li>
              {%- endif %}
            </ul>
          </div>
        </div>
      {%- endunless -%}
    {%- endif -%}
    {%- unless item.blog? -%}
      {%- if item.selected? and editmode -%}
        <div class="add-submenu {% if item.layout_title == product_list_layout or item.layout_title == product_layout %}{{itemClass}} {{menuItemDisplayClass}}{%- endif -%}">
          <li class="edit-btn mar_b-16">{% menuadd parent="item" %}</li>
        </div>
      {%- endif -%}
    {%- endunless -%}
  {%- endfor -%}
{%- endcapture -%}