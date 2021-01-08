
{% include "site-search" %}
{% include 'header-fixed' %}
{%- assign semimodalSettings = site.data.menu_settings -%}
{%- if semimodalSettings.max_width >= 1 -%}
  <style>
    body.semimodal-open:not(.semimodal-relative) .semimodal,
    body .semimodal_inner,
    body.semimodal-open .semimodal,
    body.semimodal-open-state .semimodal {
      min-width: {{semimodalSettings.max_width}}px;
      max-width: {{semimodalSettings.max_width}}px;
    }
  </style>
{%- endif -%}

{%- include 'image_src_variable', _data: site.data.semimodal_image, _targetWidth: "1000" -%}
<div class="
  semimodal js-prevent-sideclick
  {% if semimodalSettings.positioning == 'is_top' or semimodalSettings.positioning == 'is_top_fixed' %} hidden-desktop{% endif %}
  "
>
  {%- assign imageClass = "image_fit-cover semimodal_bg-image image_abs" -%}
  {%- include "lazy-image", _data: site.data.semimodal_image, _targetWidth: '600', _className: imageClass -%}
  <div class="semimodal_bg-color bg_color-absolute"
    {%- if site.data.semimodal_image.color != blank %}
      style="background-color: {{ site.data.semimodal_image.color }};"
    {%- endif -%}
  ></div>



  <header class="semimodal_inner">
    <div class="site_title content-formatted">
      {%- unless editmode -%}
        <a href="{{ site.root_item.url }}">
      {%- endunless -%}
        {% contentblock name="site-title" xpage="true" %}
          {{site.title}}
        {% endcontentblock %}
      {%- unless editmode -%}
        </a>
      {%- endunless -%}
    </div>

    <div class="semimodal_bottom">
      {%- if editmode -%}
        <div class="semimodal_picker-btn js-prevent-sideclick hidden-tablet">
          <button class="bg-picker" data-type="img" data-entity="siteData" data-picture="true" data-color="true" data-image_elem=".semimodal_bg-image" data-color_elem=".semimodal_bg-color" data-name="semimodal_image" data-bg="{{ site.data.semimodal_image | json | escape }}"></button>
        </div>
      {%- endif -%}
      <div class="header_components-tablet">
        {% if show_language_menu_popover %}
          <div class="js-toggle-menu-language menu-language-toggle js-prevent-sideclick" tabindex=0>
            <button class="menu-language-btn ico-flags ico-flag-{{ page.language_code }} js-menu-language-popover-btn" data-lang-code="{{ page.language_locale }}" {{ edy_intro_add_lang }}>
              <span>{{ current_language_title }}</span>
            </button>
            {% if show_language_menu_popover %}
              {% include "menu-language-popover" %}
            {% endif %}
          </div>
        {% endif %}

        {% include "menu-language-list" %}
        {%- if site.search.enabled -%}<div class="js-prevent-sideclick">{%- include "search-btn" -%}</div>{%- endif -%}
      </div>
      {%- include "menu-main" -%}
    </div>

  </header>
</div>
