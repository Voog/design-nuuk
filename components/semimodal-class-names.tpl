{% if site.data[menuSettingsKey].positioning == 'is_side_always_open' %}
  {% assign isSemimodalAlwaysOpen = true %}
{% elsif site.data[menuSettingsKey].positioning == 'is_side_absolute' %}
  {% assign isMenuSideAbsolute = true %}
{% endif %}

{% if isMenuSideAbsolute %} semimodal-absolute{% elsif isSemimodalAlwaysOpen %} semimodal-relative{% endif %} js-semimodal-toggle