<div class="js-prevent-sideclick layout_settings-btn {{_wrapClassName}}">
<button class="{{_className}} js-settings-editor-btn edy-cbtn">
  <span>
    <span class="edy-cbtn-content">
      <span class="edy-cbtn-ico"></span>
      <span>
        {%- if _titleKey != blank -%}
          <div class="bold">{{ _titleKey | lce  }}</div>
        {%- endif -%}
        {%- if _descriptionKey != blank -%}
          <div class="grey">{{ _descriptionKey | lce  }}</div>
        {%- endif -%}
      </span>
    </span>
  </span>
</button>