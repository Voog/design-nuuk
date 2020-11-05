<div class="header_components">
  {%- if site.search.enabled -%}{%- include "search" -%}{%- endif -%}

  {%- if editmode or site.has_many_languages? -%}
    <nav class="menu-lang">
      {%- include "menu-lang" -%}
    </nav>
  {%- endif -%}
</div>