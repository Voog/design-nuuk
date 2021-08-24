{% capture _dd_menuitems %}
  {% for child in item.visible_children %}
    {% if child.layout_title == product_layout %}
      {% if editmode or isProductItemVisible == true %}
        <li class="menu-item-product menu-item" data-visible="{{ isProductItemVisible }}">
          {%- menulink child current-class="active" wrapper-class="menu-item lvl-2" -%}
        </li>
      {% endif %}
    {% elsif child.layout_title == product_list_layout %}
      {% if editmode or isProductListItemVisible %}
        <li class="menu-item-product-list menu-item" data-visible="{{ isProductListItemVisible }}">
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

{% if editmode or menuPosTop == true %}
  {% if _dd_menuitems != blank %}
    <div data-url="{{ item.url }}" class="js-prevent-sideclick dropdown_menu-popover--wrap" data-sideclick="prevent" {% if editmode %}data-visible="true"{% endif %}>
      <nav class="dropdown_menu-popover">
        <ul class="menu menu-vertical menu-public">
          {{ _dd_menuitems }}
        </ul>
      </nav>
    </div>
  {% endif %}
{% endif %}
