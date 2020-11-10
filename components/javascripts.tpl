{% comment %}SITE WIDE JAVASCRIPTS{% endcomment %}
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/intersection-observer@0.11.0/intersection-observer.js" integrity="sha256-LkCt8+MalJg9nIGzDMmSEJzqyssPhY1VCvqaGNBNng8=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-lazyload/17.1.3/lazyload.min.js" integrity="sha512-V3DZ9ZAJrv8ZYY5Zarlfjusec9J6S8htRT3bJDKTdEgq0g9OhbHQUjK+vsBkE6CH0J5VJtBCzPSXJ0ZCVpjPdQ==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/object-fit-images/3.2.4/ofi.min.js" integrity="sha512-7taFZYSf0eAWyi1UvMzNrBoPVuvLU7KX6h10e4AzyHVnPjzuxeGWbXYX+ED9zXVVq+r9Xox5WqvABACBSCevmg==" crossorigin="anonymous"></script>
<script src="{{ javascripts_path }}/application.js?v=1"></script>

{% comment %}Site search related javascript components.{% endcomment %}
{% if site.search.enabled %}
  <script src="{{ site.static_asset_host }}/libs/edicy-search/latest/edicy-search.js"></script>
  <script>site.bindSiteSearch($('.js-search-form').get(0), '{{ page.language_code }}', '{{ 'search_noresults' | lc | escape }}');</script>
{% endif %}

{% comment %}GOOGLE ANALYTICS INITIATION{% endcomment %}
{% unless editmode %}{{ site.analytics }}{% endunless %}

{% if editmode %}
  {% editorjsblock %}
    <script src="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.js"></script>
    <script>
      //==========================================================================
      // Sets site custom data saving fanction variable.
      //==========================================================================
      var siteData = new Edicy.CustomData({
        type: 'site'
      });

      var pageData = new Edicy.CustomData({
        type: 'page',
        id: '{{ page.id }}'
      });

      var articleData = new Edicy.CustomData({
        type: "article",
        id: '{{ article.id }}'
      });

      $('.js-data-item').each(function() {
        $(this).on('change', function(e) {
          if (e.target.type === 'checkbox') {
            var val = e.target.checked;
          } else {
            var val = e.target.value;
          }
          var dataKey = e.target.dataset.name;
          var dataEntity = e.target.dataset.entity;
          var dataReload = e.target.dataset.reload;

          if (dataEntity == 'siteData') {
            var entityData = siteData;
          } else if (dataEntity === 'articleData') {
            var entityData = 'articleData';
          } else {
            var entityData = pageData;
          }
          entityData.set({ [dataKey] : val }, { success: function() {
            if (dataReload) {location.reload();};
          }});
        });
      });
    </script>
    {% include "settings_editor" %}
    {% include "bg_picker_scripts" %}

    <script>
      var siteData = new Edicy.CustomData({
        type: 'site'
      });

      site.bindContentItemImgDropAreas('{{ "drag_picture_for_product_here" | lc: editor_locale | escape }}');
      site.bindContentItemImageCropToggle();

      {%if site.data.settings_root_item %}
        rootItemValuesObj = {{ site.data.settings_root_item | json }};
      {% else %}
        rootItemValuesObj = {};
      {% endif %};
    </script>

    <script>
      //==========================================================================
      // Sets the variable for saving global custom data.
      //==========================================================================
      var siteData = new Edicy.CustomData({
        type: 'site'
      });

      //==========================================================================
      // Initiates the language menu mode toggleing popover.
      //==========================================================================
      {%if site.data.settings_language_menu %}
        languageMenuValuesObj = {{ site.data.settings_language_menu | json }};
      {% else %}
        languageMenuValuesObj = {};
      {% endif %};

      site.bindLanguageMenuSettings(languageMenuValuesObj);
    </script>
  {% endeditorjsblock %}
{% endif %}

{% include 'animation-javascripts' %}
