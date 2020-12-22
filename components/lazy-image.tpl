{%- if _targetWidth != blank -%}
  {%- assign _maxWidth = _targetWidth | plus:0 -%}
  {%- assign sizes = "(min-width: " | append: _targetWidth | append: ") " | append: _targetWidth | append: 'px' -%}
{%- else -%}
  {%- assign _maxWidth = _data.width -%}
  {%- assign sizes = '100vw' -%}
{%- endif -%}

{% include 'image_src_variable', _data: _data, _targetWidth: _maxWidth %}

<img class="{% if disableLazyLoad != true %}js-lazyload{% endif %} {{ _className }}"
  data-src="{{_src}}" data-sizes="{{sizes}}" {% if _altAttr != blank %}alt="{{_altAttr}}"{% endif %}
  {% if _src == blank %}style="display: none;"{%- endif -%}
  {% if _data.imageSizes != blank -%}
    {%- if _data.imageSizes.size >= 1 %}
      data-srcset="
        {%- for image in _data.imageSizes -%}
          {{image.url}} {{image.width}}w
          {%- unless forloop.last -%}
          ,
          {%- endunless -%}
        {%- endfor -%}
      "
    {%- endif -%}
  {%- endif -%}
/>
