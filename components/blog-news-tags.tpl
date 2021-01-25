{% if blog.has_tags? %}
  <section class="blog-tags mar_b-32">
    <nav class="menu-sub menu-breadcrumbs">
      <div class="tags-bottom{% if tags and tags != empty %} visible{% endif %}">
        <ul class="menu">
          <li class="menu-item">
            <a class="menu-link js-tags-all{% unless tags and tags != empty %} active{% endunless %}" href="/{{ blog.page.path_with_lang }}">{{ 'all_posts' | lc }}</a>
          </li>
          {% for tag in blog.tags %}
            {% for tmptag in tags %}
              {% if tmptag.name == tag.name %}
                 <li class="menu-item">
                  <a class="menu-link with_arrow js-tags-item active" href="/{{ blog.page.path_with_lang }}/tagged/{{ tag.path }}">{{ tag.name }}</a>
                </li>
              {% endif %}
            {% endfor %}
          {% endfor %}
        </ul>
      </div>
    </nav>
  </section>
{% endif %}
