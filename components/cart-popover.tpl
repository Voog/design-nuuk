<div class="cart_popover-wrap">
  <div class="cart_popover">
    <div class="cart_popover-icon">
      {% include 'ico-cart' %}
    </div>
    <div class="cart_popover-content">
      <div class="cart_popover-content--info">
        <span class="cart_popover-content--product"></span> {{ "was_added_to_cart" | lc | escape_once }}.
      </div>
      <div class="cart_popover-content--view">{{ "view_cart" | lc | escape_once }}</div>
    </div>
  </div>
</div>