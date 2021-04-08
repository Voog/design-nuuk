{%- unless site.root_item.hidden? %}
  {%- assign menuItemCount = 1 -%}
{%- else -%}
  {%- assign menuItemCount = 0 -%}
{%- endunless -%}

{%- assign menu_main_lvl_1_top_popover = '' -%}
{%- assign menu_main_lvl_1_top_main = '' -%}
{%- assign isMenuItemVisible = true -%}

{%- if menuSettings.is_product_list_page_visible == false -%}
  {%- assign isProductListItemVisible = false -%}
{%- else -%}
  {%- assign isProductListItemVisible = true -%}
{%- endif -%}

{%- if menuSettings.is_product_page_visible == false -%}
  {%- assign isProductItemVisible = false -%}
{%- else -%}
  {%- assign isProductItemVisible = true -%}
{%- endif -%}


{%- capture menu_main -%}
  {% for item in site.visible_menuitems %}
    {% capture menu_main_lvl_1_item %}
      {%- if item.layout_title == product_list_layout or item.layout_title == product_layout %}
        {%- if item.layout_title == product_list_layout -%}
          {%- assign itemClass = 'menu-item-product-list' -%}
          {%- if isProductListItemVisible == false -%}
            {%- assign isMenuItemVisible = false -%}
          {%- else -%}
            {%- assign isMenuItemVisible = true -%}
          {%- endif -%}

        {%- elsif item.layout_title == product_layout -%}
          {% if isProductItemVisible == false -%}
            {%- assign isMenuItemVisible = false -%}
          {%- else -%}
            {%- assign isMenuItemVisible = true -%}
          {%- endif -%}
          {%- assign itemClass = 'menu-item-product' -%}
        {%- endif -%}

        {% if editmode or isMenuItemVisible == true %}
          {%- assign menuItemCount = menuItemCount | plus: 1 -%}
          {% if isMenuItemVisible != true %}
            {%- assign itemTag = 'div' -%}
          {% else %}
            {%- assign itemTag = 'li' -%}
          {% endif %}
          <{{itemTag}}
            data-visible={{isMenuItemVisible}}
            class="{{itemClass}} menu-item lvl-1{% if item.children? and item.blog? != true and item.selected? %} has-children{% endif %}"
          >
            {%- menulink item current-class="active" wrapper-class="menu-item lvl-1" untranslated-class="untranslated fci-editor-menuadd" -%}
          </{{itemTag}}>
        {% endif %}
      {% else %}
        {%- assign menuItemCount = menuItemCount | plus: 1 -%}
        <li
          data-visible=true
          class="menu-item{% if item.children? and item.blog? != true and item.selected?%} has-children{% endif %} lvl-1">
          {%- menulink item current-class="active" untranslated-class="untranslated fci-editor-menuadd" -%}
        </li>
      {% endif -%}
    {%- endcapture -%}
    {%- if editmode -%}
      {%- comment -%}Possible comibination 5 product, product list or other layouts{%- endcomment -%}
      {%- if menuItemCount <= 15 -%}
        {%- assign menu_main_lvl_1_top_main = menu_main_lvl_1_top_main | append: menu_main_lvl_1_item  -%}
      {%- endif -%}
    {%- elsif isMenuItemVisible == true -%}
      {%- if menuItemCount <= 5 -%}
        {%- assign menu_main_lvl_1_top_main = menu_main_lvl_1_top_main | append: menu_main_lvl_1_item  -%}
      {%- endif -%}
    {%- endif -%}


    {{menu_main_lvl_1_item}}

    {%- if item.children? or editmode -%}
      {%- unless item.blog? %}
        <div class="{%- if item.layout_title == product_list_layout or item.layout_title == product_layout %}{{itemClass}} {{isMenuItemVisible}}{%- endif -%}">
          <div class="menu-sub{% if item.selected? %} active{% endif %}">
            <ul class="menu">
              {% for subitem in item.visible_children %}
                {%- if subitem.layout_title == product_list_layout or subitem.layout_title == product_layout -%}
                  {%- if subitem.layout_title == product_list_layout -%}
                    {%- assign subItemClass = 'menu-item-product-list menu-item-sub' -%}
                    {% if isProductListItemVisible == false %}
                      {%- assign menuSubItemDisplayClass = false -%}
                    {% else %}
                      {%- assign menuSubItemDisplayClass = true -%}
                    {% endif %}

                  {%- elsif subitem.layout_title == product_layout -%}
                    {% if isProductItemVisible == false %}
                      {%- assign menuSubItemDisplayClass = false -%}
                    {% else %}
                      {%- assign menuSubItemDisplayClass = true -%}
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
        <div class="add-submenu {% if item.layout_title == product_list_layout or item.layout_title == product_layout %}{{itemClass}} {{isMenuItemVisible}}{%- endif -%}">
          <li class="edit-btn mar_b-16">{% menuadd parent="item" %}</li>
        </div>
      {%- endif -%}
    {%- endunless -%}
  {%- endfor -%}
{%- endcapture -%}