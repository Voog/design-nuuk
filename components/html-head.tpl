{%- comment -%}IE SETTINGS{%- endcomment -%}
<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge"><![endif]-->

{%- comment -%}BASIC META INFO{%- endcomment -%}
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="format-detection" content="telephone=no">

{%- comment -%}FAV ICON{%- endcomment -%}
{% if site.has_favicon? %}
  <link rel="icon" href="/favicon.ico" type="image/x-icon">
  <link rel="shortcut icon" href="/favicon.ico" type="image/ico">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
{% endif %}

{%- comment -%}STYLESHEETS{%- endcomment -%}
<link href="{{ stylesheets_path }}/main.min.css?v={{ template_settings.version }}" media="screen" rel="stylesheet" type="text/css"/>
{% if editmode %}
  <link rel="stylesheet" href="{{ site.static_asset_host }}/libs/edicy-tools/latest/edicy-tools.css">
{% endif %}

{%- comment -%}Swiper javascript{%- endcomment -%}
{%- if swiperSettingsData.slides_count >= 2 -%}
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/5.4.5/css/swiper.min.css" integrity="sha512-uCQmAoax6aJTxC03VlH0uCEtE0iLi83TW1Qh6VezEZ5Y17rTrIE+8irz4H4ehM7Fbfbm8rb30OkxVkuwhXxrRg==" crossorigin="anonymous" />
{%- endif -%}

{%- customstyle -%}
  {%- include "template-cs-main-styles" -%}
  {%- include "template-cs-header" -%}
  {%- include "template-cs-headings" -%}
  {%- include "template-cs-content" -%}
  {%- include "template-cs-product-list" -%}
  {%- include "template-cs-product" -%}
  {%- include "template-cs-button" -%}
  {%- include "template-cs-form" -%}
  {%- include "template-cs-article-list" -%}
  {%- include "template-cs-footer" -%}
{%- endcustomstyle -%}

{%- comment -%}MODERNIZR - HTML5 SUPPORT FOR OLDER BROWSERS, SVG SUPPORT DETECTION ETC{%- endcomment -%}
<script src="{{ javascripts_path }}/modernizr-custom.min.js"></script>

{%- comment -%}SITE TITLE{%- endcomment -%}
<title>{% title %}</title>

{%- comment -%}MISC{%- endcomment -%}
{% include "template-meta" %}

{%- comment -%}BREADCRUMBS{%- endcomment -%}
{%- capture breadcrumbsScript -%}
  {%- sd_breadcrumbs -%}
{%- endcapture -%}

{% sd_breadcrumbs %}

{% if blog %}{{ blog.rss_link }}{% endif %}
{{ site.stats_header }}
