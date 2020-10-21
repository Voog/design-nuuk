{%- assign _src = _data.imageSizes.first.url -%}

{%- assign _maxWidth = _targetWidth | plus:0 -%}

{%- for image in _data.imageSizes -%}
  {%- if image.width < _maxWidth -%}
    {% break %}
  {%- endif -%}
    {%- assign _src = image.url -%}
{%- endfor -%}
