<div class="js-prevent-sideclick dropdown_menu-popover--wrap" data-sideclick="prevent">
  <nav data-url={{ item.url }} class="dropdown_menu-popover">
    <ul class="menu menu-vertical menu-public">
      {%- for child in item.visible_children -%}
        <li class="menu-item">
          {%- menulink child current-class="active" wrapper-class="menu-item lvl-2" untranslated-class="untranslated fci-editor-menuadd" -%}
        </li>
      {% endfor %}
    </ul>
  </nav>
</div>
