{% capture _dd_menuitems %}
  {% for child in item.visible_children %}
    {% if child.layout_title == product_layout %}
      {% if editmode or isProductItemVisible == true %}
        <li class="menu-item-product menu-item" {% if editmode %}data-visible="{{ isProductItemVisible }}"{% endif %}>
          {%- menulink child current-class="active" wrapper-class="menu-item lvl-2" link-class="dd-menu-element" -%}
        </li>
      {% endif %}
    {% elsif child.layout_title == product_list_layout %}
      {% if editmode or isProductListItemVisible %}
        <li class="menu-item-product-list menu-item" {% if editmode %}data-visible="{{ isProductListItemVisible }}"{% endif %}>
          {%- menulink child current-class="active" wrapper-class="menu-item lvl-2" link-class="dd-menu-element" -%}
        </li>
      {% endif %}
    {% else %}
      <li class="menu-item">
        {%- menulink child current-class="active" wrapper-class="menu-item lvl-2" link-class="dd-menu-element" -%}
      </li>
    {% endif %}
  {% endfor %}
{% endcapture %}

{% if _dd_menuitems != blank %}
  <div data-url="{{ item.url }}" class="js-prevent-sideclick dropdown_menu-popover--wrap" data-sideclick="prevent" {% if editmode %}data-visible="true"{% endif %}>
    <nav class="dropdown_menu-popover">
      <ul class="menu menu-vertical menu-public">
        {{ _dd_menuitems }}
      </ul>
    </nav>
  </div>
{% endif %}
