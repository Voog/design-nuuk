
<footer class="footer content-formatted">
  <div class="w-100p">
    <div class="footer_separator"></div>

    {%- assign footerBlocskCount = template_settings.site.footer_blocks_settings.value.blocks_count -%}
    {%- assign footerBlocColumnskCount = template_settings.site.footer_block_columns_settings.value.col_count -%}

    {%- for i in (1..footerBlocskCount) -%}

      {%- for id in (1..footerBlocColumnskCount) -%}
        {%- capture variable -%}

        {%- endcapture -%}
      {%- endfor -%}
      <div class="flex_row flex_row-{{footerBlocColumnskCount}} mar_0-8-neg flex_j-space-between">
        {%- for id in (1..footerBlocColumnskCount) -%}
          {%- assign name = "footer_row-" | append: i | append: "-" | append: id -%}

          {% capture footer_item %}{% unless editmode %}{% xcontent name=name %}{% endunless %}{% endcapture %}
          {% capture footer_item_size %}{{ footer_item | size | minus: 1 }}{% endcapture %}
          {% unless footer_item_size contains "-" %}
            {% assign footer_item_has_content = true %}
          {% else %}
            {% assign footer_item_has_content = false %}
          {% endunless %}

          <div class="flex_row-{{footerBlocColumnskCount}}--item footer_content{%- unless editmode or footer_item_has_content == true %} footer_content-hidden{%- endunless -%}" >
            <div class="content-formatted mar_0-8">{% xcontent name=name %}</div>
          </div>

        {%- endfor -%}
      </div>
    {%- endfor -%}

    {% if site.branding.enabled %}
      <div class="voog-reference{% unless editmode or footer_has_content %} voog-reference-with-padding{% endunless %}">
        {% loginblock %}
          <svg xmlns="http://www.w3.org/2000/svg" width="35px" height="8px" viewbox="0 0 35 8" class="ico-voog">
            <path d="M34.5,4 C34.5,4 34.5,4 34.5,4 C34.5,4 34.5,4.1 34.5,4.1 C34.5,4.4 34.5,4.6 34.4,4.8 C34.4,4.8 34.4,4.8 34.4,4.8 C34,6.6 32.3,8 30.3,8 C29.2,8 28.2,7.6 27.4,6.8 C27.4,6.8 27.4,6.8 27.4,6.8 C27.4,6.8 27.4,6.8 27.4,6.8 C26.7,6.1 26.2,5.1 26.2,4 C26.2,1.8 28.1,0 30.4,0 C31.5,0 32.5,0.4 33.3,1.2 C33.3,1.2 32.6,1.9 32.6,1.9 C32,1.3 31.2,1 30.4,1 C28.6,1 27.3,2.3 27.3,4 C27.3,4.7 27.5,5.3 27.9,5.9 C28,5.9 28.1,6 28.2,6.1 C28.2,6.1 28.2,6.1 28.2,6.1 C28.7,6.7 29.5,7 30.3,7 C31.9,7 33.2,5.9 33.4,4.5 C33.4,4.5 30.3,4.5 30.3,4.5 C30.3,4.5 30.3,3.5 30.3,3.5 C30.3,3.5 33.4,3.5 33.4,3.5 C33.4,3.5 34.1,3.5 34.1,3.5 C34.1,3.5 34.5,3.5 34.5,3.5 C34.5,3.7 34.5,3.8 34.5,4 ZM12.7,0 C12.7,0 12.7,1 12.7,1 C14.5,1 15.8,2.3 15.8,4 C15.8,5.7 14.5,7 12.7,7 C11,7 9.6,5.7 9.6,4 C9.6,4 8.6,4 8.6,4 C8.6,6.2 10.4,8 12.7,8 C15,8 16.9,6.2 16.9,4 C16.9,1.8 15,0 12.7,0 ZM7.5,2.4 C7.5,2.4 5.5,6.4 5.5,6.4 C5.4,6.7 5.1,7 4.8,7 C4.8,7 4.8,7 4.8,7 C4.5,7 4.2,6.7 4.1,6.4 C4.1,6.4 1.1,0.3 1.1,0.3 C1.1,0.3 0,0.3 0,0.3 C0,0.3 3.1,6.8 3.1,6.8 C3.5,7.6 4.1,8 4.8,8 C4.8,8 4.8,8 4.8,8 C5.5,8 6.1,7.6 6.5,6.8 C6.5,6.8 8.4,2.8 8.4,2.8 C8.4,2.8 8.4,2.8 8.4,2.8 C8.9,1.7 10,1 11.3,1 C11.3,1 11.3,0 11.3,0 C9.6,0 8.2,1 7.5,2.4 ZM1.9,0.3 C1.9,0.3 2,0.3 2,0.3 C2,0.3 2,0.6 2,0.6 C2,0.6 2.1,0.6 2.1,0.6 C2.1,0.6 2.1,0.3 2.1,0.3 C2.1,0.3 2.2,0.3 2.2,0.3 C2.2,0.3 2.2,0.3 2.2,0.3 C2.2,0.3 1.9,0.3 1.9,0.3 C1.9,0.3 1.9,0.3 1.9,0.3 ZM2.2,0.6 C2.2,0.6 2.2,0.6 2.2,0.6 C2.2,0.6 2.2,0.3 2.2,0.3 C2.2,0.3 2.2,0.3 2.2,0.3 C2.2,0.3 2.3,0.6 2.3,0.6 C2.3,0.6 2.4,0.6 2.4,0.6 C2.4,0.6 2.4,0.3 2.4,0.3 C2.4,0.3 2.4,0.3 2.4,0.3 C2.4,0.3 2.4,0.6 2.4,0.6 C2.4,0.6 2.5,0.6 2.5,0.6 C2.5,0.6 2.5,0.3 2.5,0.3 C2.5,0.3 2.4,0.3 2.4,0.3 C2.4,0.3 2.3,0.5 2.3,0.5 C2.3,0.5 2.3,0.5 2.3,0.5 C2.3,0.5 2.3,0.3 2.3,0.3 C2.3,0.3 2.2,0.3 2.2,0.3 C2.2,0.3 2.2,0.6 2.2,0.6 ZM21.5,0 C19.2,0 17.4,1.8 17.4,4 C17.4,6.2 19.2,8 21.5,8 C23.8,8 25.7,6.2 25.7,4 C25.7,1.8 23.8,0 21.5,0 ZM21.5,7 C19.8,7 18.4,5.6 18.4,4 C18.4,2.4 19.8,1 21.5,1 C23.2,1 24.6,2.4 24.6,4 C24.6,5.6 23.2,7 21.5,7 Z"></path>
          </svg>
        {% endloginblock %}
      </div>
    {% endif %}
  </div>
</footer>
