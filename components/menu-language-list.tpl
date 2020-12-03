<nav class="menu-language menu-language-list">
  <ul class="menu menu-horizontal menu-public">
    {% for language in site.languages %}
      <li class="menu-item">
        <a class="ico-flags ico-flag-{{ language.code }}{% if language.selected? %} selected{% endif %}" href="{{ language.url }}" data-lang-code="{{ language.locale }}">
          <span class="menu-language-name">{{ language.title }}</span>
        </a>
      </li>
    {% endfor %}

    {% if editmode %}
      <li class="menu-item">
        <ul class="menu menu-horizontal menu-cms js-menu-language-list-setting-parent">
          <li class="menu-item menu-item-cms-add" {{ edy_intro_add_lang }}>{% languageadd %}</li>
        </ul>
      </li>
    {% endif %}
  </ul>
</nav>
