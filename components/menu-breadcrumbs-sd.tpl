{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}

<nav class="menu-sub menu-breadcrumbs content-formatted">
  <ul class="menu">
    {%- for listItem in breadcrumbsObj.itemListElement %}
      {%- assign pageUrl = page.url | remove_first: "/" -%}
      <li class="menu-item">
        <a class="menu-link{% if forloop.index > 1 %} with_arrow{% endif %}{% if forloop.last %} active{% endif %}" href="/{{listItem.item.id}}">{{ listItem.item.name }}</a>
      </li>
    {% endfor -%}
  </ul>
</nav>
