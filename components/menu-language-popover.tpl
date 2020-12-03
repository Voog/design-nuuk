<div class="js-prevent-sideclick lang_menu-popover--wrap js-menu-language-popover menu-language menu-language-popover" data-sideclick="prevent">
  <nav class="lang_menu-popover">
    <ul class="menu menu-vertical menu-public">
      {% for language in site.languages %}
        {% if language.code == page.language_code %}
          <li class="menu-item">
            <a class="ico-flags ico-flag-{{ language.code }}{% if language.selected? %} selected{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.locale }}">
              <span class="menu-language-name">{{ language.title }}</span>
            </a>
          </li>
          {% break %}
        {% endif %}
      {% endfor %}

      {% for language in site.languages %}
        {% unless language.code == page.language_code %}
          <li class="menu-item">
            <a class="ico-flags ico-flag-{{ language.code }}{% if language.selected? %} selected{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.locale }}">
              <span class="menu-language-name">{{ language.title }}</span>
            </a>
          </li>
        {% endunless %}
      {% endfor %}
    </ul>

    {% if editmode %}
      <ul class="menu menu-vertical menu-cms js-menu-language-popover-setting-parent">
        <li class="menu-item menu-item-cms-add">{% languageadd %}</li>

        {% if language_menu_mode == "language-menu-mode-popover" %}
          <li class="menu-item menu-item-cms-settings js-menu-language-settings">
            <button class="btn btn-js-styled js-menu-language-settings-toggle"></button>
          </li>
        {% endif %}
      </ul>
    {% endif %}
  </nav>
</div>
