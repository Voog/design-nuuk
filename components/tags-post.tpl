<div class="tags">
  {% include "tags-variables" %}
  {% if editmode %}
    <div class="tags-editor">{% editable article.tags %}</div>
  {% else %}
    {% unless article.tags == empty %}
      <nav class="post_tags menu-sub">
        <ul class="menu">
          {% for tag in article.tags %}
            <li class="menu-item">
              <a class="menu-link" href="/{{ article.page.path_with_lang }}/tagged/{{ tag.path }}">
              {{ tag.name }}
              </a>
              {%- if forloop.last != true -%}
                <span class="mar_l-8">&bull;</span>
              {%- endif -%}
            </li>
          {% endfor %}
        </ul>
      </nav>
    {% endunless %}
  {% endif %}
</div>
