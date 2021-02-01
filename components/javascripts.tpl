{% comment %}SITE WIDE JAVASCRIPTS{% endcomment %}
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/intersection-observer@0.11.0/intersection-observer.js" integrity="sha256-LkCt8+MalJg9nIGzDMmSEJzqyssPhY1VCvqaGNBNng8=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/vanilla-lazyload/17.1.3/lazyload.min.js" integrity="sha512-V3DZ9ZAJrv8ZYY5Zarlfjusec9J6S8htRT3bJDKTdEgq0g9OhbHQUjK+vsBkE6CH0J5VJtBCzPSXJ0ZCVpjPdQ==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/object-fit-images/3.2.4/ofi.min.js" integrity="sha512-7taFZYSf0eAWyi1UvMzNrBoPVuvLU7KX6h10e4AzyHVnPjzuxeGWbXYX+ED9zXVVq+r9Xox5WqvABACBSCevmg==" crossorigin="anonymous"></script>
<script src="{{ javascripts_path }}/global.min.js?v=1.1"></script>

{%- if editmode -%}
  <script src="{{ javascripts_path }}/editmode.min.js?v=1.3"></script>
{%- endif -%}

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
    {% include "settings_editor" %}
    {% include "bg-picker-scripts" %}
    <script>
      {%- if page.layout_title == product_list_layout or page.layout_title == product_layout -%}
        {%- assign dropAreaPlaceholder = "drag_picture_for_product_here" | lc: editor_locale | escape -%}
      {%- else -%}
        {%- assign dropAreaPlaceholder = "drag_picture_here" | lc: editor_locale | escape -%}
      {%- endif -%}


      site.bindContentItemImgDropAreas('{{ dropAreaPlaceholder }}', "{{itemImageKey}}", "{{itemImageCropStateKey}}");
      site.bindContentItemImageCropToggle("{{itemImageCropStateKey}}");

      {% if site.data.settings_root_item %}
        rootItemValuesObj = {{ site.data.settings_root_item | json }};
      {% else %}
        rootItemValuesObj = {};
      {% endif %};
    </script>

    <script>
      //==========================================================================
      // Initiates the language menu mode toggleing popover.
      //==========================================================================
      {%if site.data[languageMenuSettingsKey] %}
        languageMenuValuesObj = {{ site.data[languageMenuSettingsKey] | json }};
      {% else %}
        languageMenuValuesObj = {};
      {% endif %};

      site.bindLanguageMenuSettings(languageMenuValuesObj, "{{languageMenuSettingsKey}}");
    </script>

    {%- if _productPage -%}
      {%- assign dropAreaPlaceholder = "drag_picture_for_product_here" | lc: editor_locale | escape -%}
      <script>site.bindProductListeners("{{dropAreaPlaceholder}}", {{page.id}});</script>
    {%- endif -%}
  {% endeditorjsblock %}
{% endif %}
