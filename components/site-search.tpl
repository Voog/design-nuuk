{% if site.search.enabled %}
  <div class="search js-search js-prevent-sideclick">
    <div class="search-middle">
      <div class="search-inner js-search-inner">
        <form id="search" class="search-form js-search-form" method="get" action="#">
          <input id="onpage_search" class="search-input js-search-input" type="text" placeholder="{{ "search_this_site" | lc }}">
        </form>
        <div class="voog-search-modal js-voog-search-modal"></div>
      </div>
      <button class="search-btn search-close-btn js-search-reset-btn">
        <span class="menu-stripe"></span>
        <span class="menu-stripe"></span>
      </button>
    </div>
  </div>
{% endif %}
