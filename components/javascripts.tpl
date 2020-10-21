{% comment %}SITE WIDE JAVASCRIPTS{% endcomment %}
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="{{ javascripts_path }}/application.js?v=1"></script>
{% sitejs_include %}

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
  {% endeditorjsblock %}
{% endif %}