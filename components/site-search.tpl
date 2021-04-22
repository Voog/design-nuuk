{%- if site.search.enabled %}
  <div class="search js-search js-prevent-sideclick">
      <form id="search" class="search-form js-search-form" method="get" action="#">
        <input id="onpage_search" class="search-input js-search-input" type="text" placeholder="{{ "search_this_site" | lc }}">
      </form>
      <div class="voog-search-modal js-voog-search-modal"></div>
      <button class="search-btn search-close-btn js-search-reset-btn bg_img-contain"></button>
  </div>
{%- endif %}
