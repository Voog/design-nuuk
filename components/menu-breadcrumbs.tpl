{%- capture breadcrumbsScript -%}
  {%- sd_breadcrumbs -%}
{%- endcapture -%}
{%- assign breadcrumbsString = breadcrumbsScript | replace: '<script type="application/ld+json">', '' | replace: "</script>", '' | replace: site.url, '' | replace: '@', '' -%}
{%- assign breadcrumbsObj = breadcrumbsString | json_parse -%}

<nav class="menu-sub menu-breadcrumbs content-formatted">
  <ul class="menu">
    {% for listItem in breadcrumbsObj.itemListElement %}
      {% unless forloop.index == 1 %}
        {%- assign pageUrl = page.url | remove_first: "/" -%}
        <li class="menu-item">
          <a class="menu-link {% if forloop.index > 2 %} with_arrow {% endif %} {% if pageUrl == listItem.item.id %} active{% endif %}" href="/{{listItem.item.id}}">{{listItem.item.name}}</a>
        </li>
      {% endunless %}
    {% endfor %}
  </ul>
</nav>