
<footer class="footer content-formatted">
  <div class="w-100p">
    <div class="footer_separator"></div>
    <div class="editor_default-container{% if editmode %} pad_t-32 mar_t-32-neg{% endif %}">

      {%- assign footerSettings = site.data[footerSettingsKey] -%}
      {%- assign defaultFooterSettings = template_settings.site.footer_settings.value -%}

      {%- if editmode -%}
        <button disabled class="js-footer-settings-btn editor_default-btn js-settings-editor-btn">
          {{ "footer" | lce | escape_once }}
        </button>
        {%- include "settings-footer"
          _footerSettings: footerSettings
          _defaultFooterSettings: defaultFooterSettings
        -%}
      {%- endif -%}

      {%- assign row_count = footerSettings.row_count | default: defaultFooterSettings.row_count -%}
      {%- assign col_count = footerSettings.col_count | default: defaultFooterSettings.col_count -%}

      {%- if editmode and row_count < defaultFooterSettings.row_count -%}
        {%- assign footer_row_count = defaultFooterSettings.row_count -%}
      {%- else -%}
        {%- assign footer_row_count = row_count -%}
      {%- endif -%}

      {%- if editmode and col_count < defaultFooterSettings.col_count -%}
        {%- assign footer_col_count = defaultFooterSettings.col_count -%}
      {%- else -%}
        {%- assign footer_col_count = col_count -%}
      {%- endif -%}

      {%- assign footer_content_title_tooltip = "content_tooltip_all_pages_same_language" | lce -%}

      {%- for i in (1..footer_row_count) -%}
        <div class="flex_row flex_row-{{ footer_row_count }} mar_0-8-neg flex_j-center{% if editmode and footerSettings.row_count < i %} d-none{% endif %}">
          {%- for id in (1..footer_col_count) -%}
            {%- assign name = "footer_row-" | append: i | append: "-" | append: id -%}

            {%- capture footer_item -%}
              {%- unless editmode -%}{% xcontent name=name %}{%- endunless -%}
            {%- endcapture -%}

            {%- capture footer_item_size -%}
              {{ footer_item | size | minus: 1 }}
            {%- endcapture -%}

            {%- unless footer_item_size contains "-" -%}
              {%- assign footer_item_has_content = true -%}
            {%- else -%}
              {%- assign footer_item_has_content = false -%}
            {%- endunless -%}

            <div class="flex_row-{{ footer_col_count }}--item footer_content{%- unless editmode or footer_item_has_content == true %} footer_content-hidden{% endunless %}{% if editmode and footerSettings.col_count < id %} d-none{% endif %}">
              <div class="content-formatted mar_0-8">
                {% xcontent name=name title_tooltip=footer_content_title_tooltip %}
              </div>
            </div>

          {%- endfor -%}
        </div>
      {%- endfor -%}
    </div>

    {%- if site.branding.enabled and page.path == blank -%}
      <div class="voog-reference{% unless editmode or footer_has_content %} voog-reference-with-padding{% endunless %}">
        {% loginblock %}
          {{ "footer_login_link" | lc }}
        {% endloginblock %}
      </div>
    {%- endif -%}
  </div>
</footer>
