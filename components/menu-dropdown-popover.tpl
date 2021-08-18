{% capture _dd_menuitems %}
  {% for child in item.visible_children %}
    {% if child.layout_title == product_layout %}
      {% if isProductItemVisible != true %}
        {% assign tag="div" %}
      {% else %}
        {% assign tag="li" %}
      {% endif %}
        <{{tag}} class="menu-item-product menu-item" data-visible="{{ isProductItemVisible }}">
          {%- menulink child current-class="active" wrapper-class="menu-item lvl-2" -%}
        </{{tag}}>
    {% elsif child.layout_title == product_list_layout %}
      {% if isProductListItemVisible != true %}
        {% assign tag="div" %}
      {% else %}
        {% assign tag="li" %}
      {% endif %}
        <{{tag}} class="menu-item-product-list menu-item" data-visible="{{ isProductListItemVisible }}">
          {%- menulink child current-class="active" wrapper-class="menu-item lvl-2" -%}
        </{{tag}}>
    {% else %}
      <li class="menu-item">
        {%- menulink child current-class="active" wrapper-class="menu-item lvl-2" -%}
      </li>
    {% endif %}
  {% endfor %}
{% endcapture %}

{% if _dd_menuitems != blank and item.visible_children.size > 0 %}
  <div data-url="{{ item.url }}" class="js-prevent-sideclick dropdown_menu-popover--wrap" data-sideclick="prevent" data-visible="true">
    <nav class="dropdown_menu-popover">
      <ul class="menu menu-vertical menu-public">
        {{ _dd_menuitems }}
      </ul>
    </nav>
  </div>
{% endif %}
