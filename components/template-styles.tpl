<style>
  {% comment %}/* Body background color style */{% endcomment %}
  body > .body-bg_color {
    background-color: {{ body_bg_color }};
  }

  {% comment %}/* Container background color style */{% endcomment %}
  .container .body-bg_color {
    background-color: {{ container_bg_color }};
  }
</style>
