{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}

<nav class="menu-sub menu-breadcrumbs content-formatted">
  <ul class="menu">
    {%- assign rootShown = true -%}
    {%- for listItem in breadcrumbsObj.itemListElement %}
      {% if forloop.first and forloop.length > 2 %}
        {%- assign rootShown = false -%}
        {% continue %}
      {% endif %}
      <li class="menu-item">
        <a class="menu-link{% if rootShown == false and forloop.index > 2 %} with_arrow{% elsif rootShown == true and forloop.index > 1 %} with_arrow{% endif %}{% if forloop.last %} active{% endif %}" href="/{{listItem.item.id}}">{{ listItem.item.name }}</a>
      </li>
    {% endfor -%}
  </ul>
</nav>
