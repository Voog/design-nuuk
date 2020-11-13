<ul class="menu">
  {% unless site.root_item.hidden? %}
    {% menulink site.root_item wrapper-tag="li" wrapper-class="menu-item" current-class="active" %}
  {% endunless %}

  {% for item in site.visible_menuitems %}
    {% menulink item wrapper-tag="li" wrapper-class="menu-item" current-class="active" untranslated-class="untranslated fci-editor-menuadd" %}

    {% if item.children? %}
      <div class="menu-sub{% if item.selected? %} active{% endif %}">
        <ul class="menu">
          {% for subitem in item.visible_children %}
            {% menulink subitem wrapper-tag="li" wrapper-class="menu-item" current-class="active" untranslated-class="untranslated fci-editor-menuadd" %}
          {% endfor %}
          {% if item.hidden_children.size > 0 %}
            <li class="edit-btn">{% menubtn item.hidden_children %}</li>
          {% endif %}
          {% if editmode %}
            <li class="edit-btn">{% menuadd parent="item" %}</li>
          {% endif %}
        </ul>
      </div>
    {% endif %}
  {% endfor %}

  {% if editmode %}
    {% if site.hidden_menuitems.size > 0 %}
      <li class="edit-btn">{% menubtn site.hidden_menuitems %}</li>
    {% endif %}

    <li class="edit-btn mar_t-16" {{ edy_intro_add_page }}>{% menuadd %}</li>
  {% endif %}
</ul>
