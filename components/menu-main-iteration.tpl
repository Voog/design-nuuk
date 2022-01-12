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

{%- if menuSettings.positioning == 'is_top' or menuSettings.positioning == 'is_top_fixed' -%}
  {%- assign menuPosTop = true -%}
{%- else -%}
  {%- assign menuPosTop = false -%}
{%- endif -%}

{%- capture menu_main -%}
  {% for item in site.visible_menuitems %}
    {% capture menu_main_lvl_1_item %}
      {% capture menu_dropdown %}
        {% if editmode or menuPosTop == true %}
          {%- if item.translated? -%}
            {% include "menu-dropdown-popover" item: item %}
          {%- endif -%}
        {% endif %}
      {% endcapture %}
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

          {% if isMenuItemVisible != true %}
            {%- assign itemTag = 'div' -%}
          {% else %}
            {%- assign menuItemCount = menuItemCount | plus: 1 -%}
            {%- assign itemTag = 'li' -%}

            {% if menuSettings.max_elements > menuItemCount %}
              {%- assign showInTopMenu = true -%}
            {% else %}
              {%- assign showInTopMenu = false -%}
            {% endif %}
            
          {% endif %}

          <{{itemTag}}
            {% if editmode or menu_dropdown != blank %}data-arrow="active"{% endif %}
            data-url="{{ item.url }}"
            {% if editmode %}data-visible="{{isMenuItemVisible}}"{% endif %}
            class="{{itemClass}} {{ menuSettings.indicator }} menu-item lvl-1{% if showInTopMenu %} display-menu-element{% endif %}{% if item.children? and item.blog? != true and item.selected? %} has-children{% endif %}{% if menu_dropdown != blank and menuPosTop == true %} dd-arrow{% endif %}"
          >
            {%- menulink item current-class="active" wrapper-class="menu-item lvl-1" -%}
            {% if menu_dropdown != blank %}
              {{ menu_dropdown }}
            {% endif %}
          </{{itemTag}}>
        {% endif %}

      {% else %}
        {%- assign menuItemCount = menuItemCount | plus: 1 -%}
        {%- assign isMenuItemVisible = true -%}

        {% if menuSettings.max_elements > menuItemCount %}
          {%- assign showInTopMenu = true -%}
        {% else %}
          {%- assign showInTopMenu = false -%}
        {% endif %}
        <li
          {% if editmode or menu_dropdown != blank %}data-arrow="active"{% endif %}
          data-url="{{ item.url }}"
          {% if editmode %}data-visible="true"{% endif %}
          class="menu-item {{ menuSettings.indicator }}{% if showInTopMenu %} display-menu-element{% endif %}{% if item.children? and item.blog? != true and item.selected?%} has-children{% endif %} lvl-1{% if menu_dropdown != blank and menuPosTop == true %} dd-arrow{% endif %}"
        >
            {%- menulink item current-class="active" -%}
            {% if menu_dropdown != blank %}
              {{ menu_dropdown }}
            {% endif %}
        </li>
      {% endif -%}
    {%- endcapture -%}
    {%- if editmode -%}
      {%- comment -%}Possible comibination 5 product, product list or other layouts{%- endcomment -%}
      {%- if menuItemCount <= 15 -%}
        {%- assign menu_main_lvl_1_top_main = menu_main_lvl_1_top_main | append: menu_main_lvl_1_item  -%}
      {%- endif -%}
    {%- elsif isMenuItemVisible == true -%}
      {%- if menuItemCount <= menuSettings.max_elements -%}
        {%- assign menu_main_lvl_1_top_main = menu_main_lvl_1_top_main | append: menu_main_lvl_1_item  -%}
      {%- endif -%}
    {%- endif -%}

    {{menu_main_lvl_1_item}}

    {% if editmode or isMenuItemVisible %}
      {%- if item.selected? -%}
        {%- if item.children? or editmode -%}
          {% capture _side_submenu %}
            {% for subitem in item.visible_children %}
              {%- if subitem.layout_title == product_list_layout or subitem.layout_title == product_layout -%}
                {%- if subitem.layout_title == product_list_layout -%}
                  {%- assign subItemClass = 'menu-item-product-list menu-item-sub' -%}
                  {% if isProductListItemVisible == false %}
                    {%- assign isSubMenuItemVisible = false -%}
                  {% else %}
                    {%- assign isSubMenuItemVisible = true -%}
                  {% endif %}

                {%- elsif subitem.layout_title == product_layout -%}
                  {% if isProductItemVisible == false %}
                    {%- assign isSubMenuItemVisible = false -%}
                  {% else %}
                    {%- assign isSubMenuItemVisible = true -%}
                  {% endif %}
                  {%- assign subItemClass = 'menu-item-product menu-item-sub' -%}
                {%- endif -%}

                {% if editmode or isSubMenuItemVisible == true %}
                  {% if isSubMenuItemVisible != true %}
                    {%- assign itemTag = 'div' -%}
                  {% else %}
                    {%- assign itemTag = 'li' -%}
                  {% endif %}

                  <{{itemTag}}
                    class="menu-item {{subItemClass}}"
                    {% if editmode %}data-visible="{{isSubMenuItemVisible}}"{% endif %}
                  >
                    {%- menulink subitem current-class="active" -%}
                  </{{itemTag}}>
                {% endif %}
              {% else %}
                {%- menulink subitem wrapper-tag="li" wrapper-class="menu-item menu-item-sub" current-class="active" -%}
              {% endif %}
            {%- endfor %}
          {% endcapture %}
          {%- unless item.blog? %}
            <div class="{%- if item.layout_title == product_list_layout or item.layout_title == product_layout %}{{itemClass}}{%- endif -%}" data-visible="{% if _side_submenu != blank %}true{% else %}false{% endif %}">
              <div class="menu-sub active">
                <ul class="menu">
                  {% if editmode or _side_submenu != blank %}
                    {{ _side_submenu }}
                  {% endif %}
                  {%- if item.hidden_children.size > 0 -%}
                    <li class="edit-btn mar_t-16">{% menubtn item.hidden_children %}</li>
                  {%- endif %}
                </ul>
              </div>
            </div>
          {%- endunless -%}
        {%- endif -%}
      {%- endif -%}
    {% endif %}
    {%- unless item.blog? -%}
      {%- if item.selected? and editmode -%}
        <div class="add-submenu {% if item.layout_title == product_list_layout or item.layout_title == product_layout %}{{itemClass}}{%- endif -%}" {% if editmode %}data-visible="{{isMenuItemVisible}}"{% endif %}>
          <li class="edit-btn mar_b-16">{% menuadd parent="item" %}</li>
        </div>
      {%- endif -%}
    {%- endunless -%}
  {%- endfor -%}
{%- endcapture -%}
