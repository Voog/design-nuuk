{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}
{%- if breadcrumbsObj.itemListElement.size > 2 -%}
  {%- assign breadcrumbsOffset = 1 -%}
{%- else -%}
  {%- assign breadcrumbsOffset = 0 -%}
{%- endif -%}

<nav class="menu-sub menu-breadcrumbs content-formatted">
  <ul class="menu">
    {%- for listItem in breadcrumbsObj.itemListElement offset: breadcrumbsOffset %}
      <li class="menu-item">
        <a class="menu-link{% if forloop.index > 1 %} with_arrow{% endif %}{% if forloop.last %} active{% endif %}" href="/{{listItem.item.id}}">{{ listItem.item.name }}</a>
      </li>
    {% endfor -%}
  </ul>
</nav>
