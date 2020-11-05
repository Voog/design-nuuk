{% if isSemimodalRelative or isSemimodalOpen %}
  semimodal-relative
{% endif %}
{% if isSemimodalOpen %}
  semimodal-open
{% else %}
  js-semimodal-toggle
{% endif %}