<div class="js-prevent-sideclick dropdown_menu-popover--wrap" data-sideclick="prevent">
  <nav data-url="{{ item.url }}" class="dropdown_menu-popover">
    <ul class="menu menu-vertical menu-public">
      {% capture dd_menuitems %}
        {%- for child in item.visible_children -%}

          {% if child.layout_title == product_layout %}
            {% if isProductItemVisible == true %}
              <li class="menu-item">
                {%- menulink child current-class="active" wrapper-class="menu-item lvl-2" -%}
              </li>
            {% endif %}
          {% elsif child.layout_title == product_list_layout %}
            {% if isProductListItemVisible == true %}
              <li class="menu-item">
                {%- menulink child current-class="active" wrapper-class="menu-item lvl-2" -%}
              </li>
            {% endif %}
          {% else %}
            <li class="menu-item">
              {%- menulink child current-class="active" wrapper-class="menu-item lvl-2" -%}
            </li>
          {% endif %}

        {% endfor %}
      {% endcapture %}

      {{ dd_menuitems }}
    </ul>
  </nav>
</div>
