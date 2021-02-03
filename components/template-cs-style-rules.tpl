body {
  font-family: var(--main-font-family);
  color: var(--primary-color);
  background-color: var(--body-background-color);
}
body.dark-background {
  color: var(--fourth-color);
}

.container {
  max-width: var(--container-max-width);
}

.post .post_title, .post .post_title a {
  color: var(--primary-color);
}
.dark-background .post .post_title, .dark-background .post .post_title a {
  color: var(--fourth-color);
}
.post .post_title a:hover {
  color: var(--secondary-color);
}
.dark-background .post .post_title a:hover {
  color: var(--fourth-color);
}
.post .post_author, .post .post_date, .post .date-separator {
  color: var(--secondary-color);
}
.dark-background .post .post_author,
.dark-background .post .post_date,
.dark-background .post .date-separator {
  color: var(--fourth-color);
}
.dark-background .post .post_author {
  color: var(--fourth-color);
}
.post .post_comments-count a {
  color: var(--secondary-color);
}
.dark-background .post .post_comments-count a {
  color: var(--fourth-color);
}
.post .post_comments-count a:hover {
  color: var(--secondary-color);
}
.dark-background .post .post_comments-count a:hover {
  color: var(--fourth-color);
}

.menu-btn {
  color: var(--header-mainmenu-color);
}
.dark-background .menu-btn {
  color: var(--fourth-color);
}
.menu-btn .menu-stripe {
  background-color: var(--header-mainmenu-color);
}
.dark-background .menu-btn .menu-stripe {
  background-color: var(--fourth-color);
}
.menu-btn:hover {
  color: var(--header-mainmenu-hover-color);
}
.dark-background .menu-btn:hover {
  color: var(--fourth-color);
  opacity: .7;
}
.menu-btn:hover .menu-stripe {
  background-color: var(--header-mainmenu-hover-color);
}
.dark-background .menu-btn:hover .menu-stripe {
  background-color: var(--fourth-color);
}

.search-btn svg g, .edy-ecommerce-custom-ico svg g, .edy-ecommerce-custom-ico svg path {
  fill: var(--header-mainmenu-color);
}
.dark-background .search-btn svg g,
.dark-background .edy-ecommerce-custom-ico svg g,
.dark-background .edy-ecommerce-custom-ico svg path {
  fill: var(--fourth-color);
}

.search-btn:hover svg g, .edy-ecommerce-custom-ico:hover svg g, .edy-ecommerce-custom-ico:hover svg path {
  fill: var(--header-mainmenu-hover-color);
}
.dark-background .search-btn:hover svg g,
.dark-background .edy-ecommerce-custom-ico:hover svg g,
.dark-background .edy-ecommerce-custom-ico:hover svg path {
  opacity: .7;
  fill: var(--fourth-color);
}

.menu_popover-btn svg path {
  fill: var(--header-mainmenu-color);
}
.dark-background .menu_popover-btn svg path {
  fill: var(--fourth-color);
}
.menu_popover-btn svg path:hover {
  fill: var(--header-mainmenu-hover-color);
}
.dark-background .menu_popover-btn svg path:hover {
  opacity: .7;
  fill: var(--fourth-color);
}

.menu-language-btn, .menu-language-name {
  color: var(--header-mainmenu-color);
}
.menu-language-btn svg path, .menu-language-name svg path {
  stroke: var(--header-mainmenu-color);
}
.dark-background .menu-language-btn svg path,
.dark-background .menu-language-name svg path {
  stroke: var(--fourth-color);
}
.dark-background .menu-language-btn,
.dark-background .menu-language-name {
  color: var(--fourth-color);
}
.menu-language-btn:hover, .menu-language-name:hover {
  color: var(--header-mainmenu-hover-color);
}
.menu-language-btn:hover svg path, .menu-language-name:hover svg path {
  stroke: var(--header-mainmenu-hover-color);
}
.dark-background .menu-language-btn:hover svg path, .dark-background .menu-language-name:hover svg path {
  opacity: .7;
  stroke: var(--fourth-color);
}
.dark-background .menu-language-btn:hover, .dark-background .menu-language-name:hover {
  opacity: .7;
  color: var(--fourth-color);
}

.edy-ecommerce-product-count {
  color: var(--header-mainmenu-color);
}
.dark-background .edy-ecommerce-product-count {
  color: var(--fourth-color);
}

.menu-main .menu .menu-item a {
  color: var(--header-mainmenu-color);
  -webkit-text-decoration: var(--header-mainmenu-decoration);
          text-decoration: var(--header-mainmenu-decoration);
  font-weight: var(--header-mainmenu-font-weight);
  font-style: var(--header-mainmenu-font-style);
  font-size: var(--header-mainmenu-font-size);
  -webkit-hyphens: var(--header-mainmenu-hyphens);
      -ms-hyphens: var(--header-mainmenu-hyphens);
          hyphens: var(--header-mainmenu-hyphens);
}
.dark-background .menu-main .menu .menu-item a {
  color: var(--fourth-color);
}
.menu-main .menu .menu-item a::before {
  background-color: var(--header-mainmenu-color);
}
.dark-background .menu-main .menu .menu-item a::before {
  background-color: var(--fourth-color);
}
.menu-main .menu .menu-item a:hover {
  color: var(--header-mainmenu-hover-color);
  -webkit-text-decoration: var(--header-mainmenu-hover-decoration);
          text-decoration: var(--header-mainmenu-hover-decoration);
  font-weight: var(--header-mainmenu-hover-font-weight);
  font-style: var(--header-mainmenu-hover-font-style);
}
.dark-background .menu-main .menu .menu-item a:hover {
  color: var(--fourth-color);
  opacity: .7;
}
.menu-main .menu .menu-item.active a {
  color: var(--header-mainmenu-active-color);
  font-weight: var(--header-mainmenu-active-font-weight);
  -webkit-text-decoration: var(--header-mainmenu-active-decoration);
          text-decoration: var(--header-mainmenu-active-decoration);
  font-style: var(--header-mainmenu-active-font-style);
}
.menu-main .menu .menu-item.active a::before {
  background-color: var(--header-mainmenu-active-color);
}
.dark-background .menu-main .menu .menu-item.active a::before {
  background-color: var(--fourth-color);
  opacity: .7;
}
.dark-background .menu-main .menu .menu-item.active a {
  color: var(--fourth-color);
  opacity: .7;
}
.menu-main .menu .menu-item.active a:hover {
  color: var(--header-mainmenu-hover-color);
  -webkit-text-decoration: var(--header-mainmenu-hover-decoration);
          text-decoration: var(--header-mainmenu-hover-decoration);
}
.menu-main .menu .menu-item.active a:hover::before {
  background-color: var(--header-mainmenu-hover-color);
}
.dark-background .menu-main .menu .menu-item.active a:hover {
  color: var(--fourth-color);
  opacity: 1;
}

.dark-background .light-background .header_components-tablet,
.dark-background .light-background .site_title.content-formatted,
.dark-background .light-background .semimodal_bottom-content,
.dark-background .light-background .menu-language-btn,
.dark-background .light-background .menu-language-name {
  color: var(--header-mainmenu-color);
}
.dark-background .light-background .header_components-tablet a, .dark-background .light-background .header_components-tablet p, .dark-background .light-background .header_components-tablet h1, .dark-background .light-background .header_components-tablet h2, .dark-background .light-background .header_components-tablet h3, .dark-background .light-background .header_components-tablet h4, .dark-background .light-background .header_components-tablet h5, .dark-background .light-background .header_components-tablet h6,
.dark-background .light-background .site_title.content-formatted a,
.dark-background .light-background .site_title.content-formatted p,
.dark-background .light-background .site_title.content-formatted h1,
.dark-background .light-background .site_title.content-formatted h2,
.dark-background .light-background .site_title.content-formatted h3,
.dark-background .light-background .site_title.content-formatted h4,
.dark-background .light-background .site_title.content-formatted h5,
.dark-background .light-background .site_title.content-formatted h6,
.dark-background .light-background .semimodal_bottom-content a,
.dark-background .light-background .semimodal_bottom-content p,
.dark-background .light-background .semimodal_bottom-content h1,
.dark-background .light-background .semimodal_bottom-content h2,
.dark-background .light-background .semimodal_bottom-content h3,
.dark-background .light-background .semimodal_bottom-content h4,
.dark-background .light-background .semimodal_bottom-content h5,
.dark-background .light-background .semimodal_bottom-content h6,
.dark-background .light-background .menu-language-btn a,
.dark-background .light-background .menu-language-btn p,
.dark-background .light-background .menu-language-btn h1,
.dark-background .light-background .menu-language-btn h2,
.dark-background .light-background .menu-language-btn h3,
.dark-background .light-background .menu-language-btn h4,
.dark-background .light-background .menu-language-btn h5,
.dark-background .light-background .menu-language-btn h6,
.dark-background .light-background .menu-language-name a,
.dark-background .light-background .menu-language-name p,
.dark-background .light-background .menu-language-name h1,
.dark-background .light-background .menu-language-name h2,
.dark-background .light-background .menu-language-name h3,
.dark-background .light-background .menu-language-name h4,
.dark-background .light-background .menu-language-name h5,
.dark-background .light-background .menu-language-name h6 {
  color: var(--header-mainmenu-color);
}
.dark-background .light-background .menu-btn {
  color: var(--header-mainmenu-color);
}
.dark-background .light-background .menu-btn .menu-stripe {
  background-color: var(--header-mainmenu-color);
}
.dark-background .light-background .search-btn svg g,
.dark-background .light-background .edy-ecommerce-custom-ico svg g,
.dark-background .light-background .edy-ecommerce-custom-ico svg path {
  fill: var(--header-mainmenu-color);
}
.dark-background .light-background .search-btn:hover svg g,
.dark-background .light-background .edy-ecommerce-custom-ico:hover svg g,
.dark-background .light-background .edy-ecommerce-custom-ico:hover svg path {
  fill: var(--header-mainmenu-hover-color);
}
.dark-background .light-background .menu-main .menu .menu-item a {
  color: var(--header-mainmenu-color);
}
.dark-background .light-background .menu-main .menu .menu-item a::before {
  background-color: var(--header-mainmenu-color);
}
.dark-background .light-background .menu-main .menu .menu-item a:hover {
  color: var(--header-mainmenu-hover-color);
}
.dark-background .light-background .menu-main .menu .menu-item.active a {
  color: var(--header-mainmenu-active-color);
}
.dark-background .light-background .menu-main .menu .menu-item.active a::before {
  background-color: var(--header-mainmenu-active-color);
}
.dark-background .light-background .menu-main .menu .menu-item.active a:hover {
  color: var(--header-mainmenu-hover-color);
}
.dark-background .light-background .menu-main .menu .menu-item.active a:hover::before {
  background-color: var(--header-mainmenu-hover-color);
}

.dark-background .menu-breadcrumbs.menu-sub .menu-item a::after {
  background-color: var(--fourth-color);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a {
  color: var(--fourth-color);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a.active {
  color: var(--fourth-color);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a.active::before {
  border-color: var(--fourth-color);
}
.menu-breadcrumbs.menu-sub .menu-item a.active:hover {
  color: var(--header-mainmenu-color);
  -webkit-text-decoration: var(--header-mainmenu-hover-decoration);
          text-decoration: var(--header-mainmenu-hover-decoration);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a.active:hover svg,
.dark-background .menu-breadcrumbs.menu-sub .menu-item a.active:hover path {
  fill: var(--fourth-color);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a:hover {
  color: var(--fourth-color);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a:hover::before {
  border-color: var(--fourth-color);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a::before {
  border-color: var(--fourth-color);
}

.menu-sub .menu-item a {
  color: var(--header-mainmenu-color);
  -webkit-text-decoration: var(--header-mainmenu-decoration);
          text-decoration: var(--header-mainmenu-decoration);
  font-size: var(--header-mainmenu-font-size);
}
.menu-sub .menu-item a::after {
  background-color: var(--header-mainmenu-color);
}
.menu-sub .menu-item a.active {
  color: var(--header-mainmenu-active-color);
  font-weight: var(--header-mainmenu-active-font-weight);
  -webkit-text-decoration: var(--header-mainmenu-active-decoration);
          text-decoration: var(--header-mainmenu-active-decoration);
}
.menu-sub .menu-item a.active::before {
  border-color: var(--header-mainmenu-active-color);
}
.menu-sub .menu-item a.active:hover {
  color: var(--header-mainmenu-color);
  -webkit-text-decoration: var(--header-mainmenu-hover-decoration);
          text-decoration: var(--header-mainmenu-hover-decoration);
}
.menu-sub .menu-item a.active:hover svg,
.menu-sub .menu-item a.active:hover path {
  fill: var(--header-mainmenu-color);
}
.menu-sub .menu-item a:hover {
  color: var(--header-mainmenu-hover-color);
}
.menu-sub .menu-item a:hover::before {
  border-color: var(--header-mainmenu-hover-color);
}
.menu-sub .menu-item a::before {
  border-color: var(--header-mainmenu-color);
}

.footer .voog-reference svg path {
  fill: var(--primary-color);
}
.dark-background .footer .voog-reference svg path {
  fill: var(--fourth-color);
}

.content-formatted, .content-formatted .product_item-btn, .content-formatted p {
  font-size: var(--content-body-font-size);
  line-height: var(--content-body-line-height);
  color: var(--content-body-color);
  -webkit-hyphens: var(--content-body-hyphens);
      -ms-hyphens: var(--content-body-hyphens);
          hyphens: var(--content-body-hyphens);
}
.dark-background .content-formatted,
.dark-background .content-formatted .product_item-btn,
.dark-background .content-formatted p {
  color: var(--fourth-color);
}
.content-formatted h1, .content-formatted h2, .content-formatted h3, .content-formatted h4, .content-formatted h5, .content-formatted h6, .content-formatted .product_item-btn h1, .content-formatted .product_item-btn h2, .content-formatted .product_item-btn h3, .content-formatted .product_item-btn h4, .content-formatted .product_item-btn h5, .content-formatted .product_item-btn h6, .content-formatted p h1, .content-formatted p h2, .content-formatted p h3, .content-formatted p h4, .content-formatted p h5, .content-formatted p h6 {
  color: var(--secondary-color);
}
.dark-background .content-formatted h1, .dark-background .content-formatted h2, .dark-background .content-formatted h3, .dark-background .content-formatted h4, .dark-background .content-formatted h5, .dark-background .content-formatted h6, .dark-background .content-formatted .product_item-btn h1, .dark-background .content-formatted .product_item-btn h2, .dark-background .content-formatted .product_item-btn h3, .dark-background .content-formatted .product_item-btn h4, .dark-background .content-formatted .product_item-btn h5, .dark-background .content-formatted .product_item-btn h6, .dark-background .content-formatted p h1, .dark-background .content-formatted p h2, .dark-background .content-formatted p h3, .dark-background .content-formatted p h4, .dark-background .content-formatted p h5, .dark-background .content-formatted p h6 {
  color: var(--fourth-color);
}
.dark-background .content-formatted .edy-content-social-button svg, .dark-background .content-formatted .edy-content-social-button path, .dark-background .content-formatted .product_item-btn .edy-content-social-button svg, .dark-background .content-formatted .product_item-btn .edy-content-social-button path, .dark-background .content-formatted p .edy-content-social-button svg, .dark-background .content-formatted p .edy-content-social-button path {
  fill: var(--fourth-color);
  border-color: var(--fourth-color);
}
.content-formatted h1, .content-formatted .product_item-btn h1, .content-formatted p h1 {
  font-size: var(--headings-title-font-size);
  font-style: var(--headings-title-font-style);
  font-weight: var(--headings-title-font-weight);
  line-height: var(--headings-title-line-height);
  color: var(--headings-title-color);
  text-align: var(--headings-title-text-alignment);
  -webkit-text-decoration: var(--headings-title-text-decoration);
          text-decoration: var(--headings-title-text-decoration);
  text-transform: var(--headings-title-text-transform);
  -webkit-hyphens: var(--headings-title-hyphens);
      -ms-hyphens: var(--headings-title-hyphens);
          hyphens: var(--headings-title-hyphens);
}
@media screen and (max-width: 900px) {
  .content-formatted h1, .content-formatted .product_item-btn h1, .content-formatted p h1 {
    font-size: calc(var(--headings-title-font-size) / 1.4);
    line-height: calc(var(--headings-title-line-height) / 1.4);
  }
}
@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted h1, .semimodal-relative .content-formatted .product_item-btn h1, .semimodal-relative .content-formatted p h1 {
    font-size: calc(var(--headings-title-font-size) / 1.4);
    line-height: calc(var(--headings-title-line-height) / 1.4);
  }
}
.content-formatted h2, .content-formatted .product_item-btn h2, .content-formatted p h2 {
  font-size: var(--headings-heading-font-size);
  font-style: var(--headings-heading-font-style);
  font-weight: var(--headings-heading-font-weight);
  line-height: var(--headings-heading-line-height);
  color: var(--headings-heading-color);
  text-align: var(--headings-heading-text-alignment);
  -webkit-text-decoration: var(--headings-heading-text-decoration);
          text-decoration: var(--headings-heading-text-decoration);
  text-transform: var(--headings-heading-text-transform);
  -webkit-hyphens: var(--headings-heading-hyphens);
      -ms-hyphens: var(--headings-heading-hyphens);
          hyphens: var(--headings-heading-hyphens);
}
@media screen and (max-width: 900px) {
  .content-formatted h2, .content-formatted .product_item-btn h2, .content-formatted p h2 {
    font-size: calc(var(--headings-heading-font-size) / 1.4);
    line-height: calc(var(--headings-heading-line-height) / 1.4);
  }
}
@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted h2, .semimodal-relative .content-formatted .product_item-btn h2, .semimodal-relative .content-formatted p h2 {
    font-size: calc(var(--headings-heading-font-size) / 1.4);
    line-height: calc(var(--headings-heading-line-height) / 1.4);
  }
}
.content-formatted h3, .content-formatted .product_item-btn h3, .content-formatted p h3 {
  font-size: var(--headings-subheading-font-size);
  font-style: var(--headings-subheading-font-style);
  font-weight: var(--headings-subheading-font-weight);
  line-height: var(--headings-subheading-line-height);
  color: var(--headings-subheading-color);
  text-align: var(--headings-subheading-text-alignment);
  -webkit-text-decoration: var(--headings-subheading-text-decoration);
          text-decoration: var(--headings-subheading-text-decoration);
  text-transform: var(--headings-subheading-text-transform);
  -webkit-hyphens: var(--headings-subheading-hyphens);
      -ms-hyphens: var(--headings-subheading-hyphens);
          hyphens: var(--headings-subheading-hyphens);
}
@media screen and (max-width: 900px) {
  .content-formatted h3, .content-formatted .product_item-btn h3, .content-formatted p h3 {
    font-size: calc(var(--headings-subheading-font-size) / 1.4);
    line-height: calc(var(--headings-subheading-line-height) / 1.4);
  }
}
@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted h3, .semimodal-relative .content-formatted .product_item-btn h3, .semimodal-relative .content-formatted p h3 {
    font-size: calc(var(--headings-subheading-font-size) / 1.4);
    line-height: calc(var(--headings-subheading-line-height) / 1.4);
  }
}
.content-formatted a:not(.custom-btn), .content-formatted .product_item-btn a:not(.custom-btn), .content-formatted p a:not(.custom-btn) {
  font-style: var(--content-link-font-style);
  font-weight: var(--content-link-font-weight);
  color: var(--content-link-color);
  -webkit-text-decoration: var(--content-link-text-decoration);
          text-decoration: var(--content-link-text-decoration);
  text-transform: var(--content-link-text-transform);
}
.dark-background .content-formatted a:not(.custom-btn), .dark-background .content-formatted .product_item-btn a:not(.custom-btn), .dark-background .content-formatted p a:not(.custom-btn) {
  color: var(--fourth-color);
}
.content-formatted a:not(.custom-btn):hover, .content-formatted .product_item-btn a:not(.custom-btn):hover, .content-formatted p a:not(.custom-btn):hover {
  font-style: var(--content-link-hover-font-style);
  font-weight: var(--content-link-hover-font-weight);
  color: var(--content-link-hover-color);
  -webkit-text-decoration: var(--content-link-hover-text-decoration);
          text-decoration: var(--content-link-hover-text-decoration);
  text-transform: var(--content-link-hover-text-transform);
}
.dark-background .content-formatted a:not(.custom-btn):hover, .dark-background .content-formatted .product_item-btn a:not(.custom-btn):hover, .dark-background .content-formatted p a:not(.custom-btn):hover {
  color: var(--fourth-color);
}
.content-formatted.header_title, .content-formatted.site_title, .content-formatted .product_item-btn.header_title, .content-formatted .product_item-btn.site_title, .content-formatted p.header_title, .content-formatted p.site_title {
  font-size: var(--header-site-title-font-size);
  line-height: var(--header-site-title-font-size);
  font-weight: var(--header-site-title-font-weight);
  font-style: var(--header-site-title-font-style);
  -webkit-text-decoration: var(--header-site-title-text-decoration);
          text-decoration: var(--header-site-title-text-decoration);
  text-transform: var(--header-site-title-text-transform);
  color: var(--header-site-title-color);
  -webkit-hyphens: var(--header-site-title-hyphens);
      -ms-hyphens: var(--header-site-title-hyphens);
          hyphens: var(--header-site-title-hyphens);
}
.dark-background .content-formatted.header_title, .dark-background .content-formatted.site_title, .dark-background .content-formatted .product_item-btn.header_title, .dark-background .content-formatted .product_item-btn.site_title, .dark-background .content-formatted p.header_title, .dark-background .content-formatted p.site_title {
  color: var(--fourth-color);
}
.content-formatted.header_title a, .content-formatted.header_title p, .content-formatted.header_title h1, .content-formatted.header_title h2, .content-formatted.header_title h3, .content-formatted.header_title h4, .content-formatted.header_title h5, .content-formatted.header_title h6, .content-formatted.site_title a, .content-formatted.site_title p, .content-formatted.site_title h1, .content-formatted.site_title h2, .content-formatted.site_title h3, .content-formatted.site_title h4, .content-formatted.site_title h5, .content-formatted.site_title h6, .content-formatted .product_item-btn.header_title a, .content-formatted .product_item-btn.header_title p, .content-formatted .product_item-btn.header_title h1, .content-formatted .product_item-btn.header_title h2, .content-formatted .product_item-btn.header_title h3, .content-formatted .product_item-btn.header_title h4, .content-formatted .product_item-btn.header_title h5, .content-formatted .product_item-btn.header_title h6, .content-formatted .product_item-btn.site_title a, .content-formatted .product_item-btn.site_title p, .content-formatted .product_item-btn.site_title h1, .content-formatted .product_item-btn.site_title h2, .content-formatted .product_item-btn.site_title h3, .content-formatted .product_item-btn.site_title h4, .content-formatted .product_item-btn.site_title h5, .content-formatted .product_item-btn.site_title h6, .content-formatted p.header_title a, .content-formatted p.header_title p, .content-formatted p.header_title h1, .content-formatted p.header_title h2, .content-formatted p.header_title h3, .content-formatted p.header_title h4, .content-formatted p.header_title h5, .content-formatted p.header_title h6, .content-formatted p.site_title a, .content-formatted p.site_title p, .content-formatted p.site_title h1, .content-formatted p.site_title h2, .content-formatted p.site_title h3, .content-formatted p.site_title h4, .content-formatted p.site_title h5, .content-formatted p.site_title h6 {
  font-size: var(--header-site-title-font-size);
  line-height: var(--header-site-title-font-size);
  font-weight: var(--header-site-title-font-weight);
  font-style: var(--header-site-title-font-style);
  -webkit-text-decoration: var(--header-site-title-text-decoration);
          text-decoration: var(--header-site-title-text-decoration);
  text-transform: var(--header-site-title-text-transform);
  color: var(--header-site-title-color);
  -webkit-hyphens: var(--header-site-title-hyphens);
      -ms-hyphens: var(--header-site-title-hyphens);
          hyphens: var(--header-site-title-hyphens);
}
.dark-background .content-formatted.header_title a, .dark-background .content-formatted.header_title p, .dark-background .content-formatted.header_title h1, .dark-background .content-formatted.header_title h2, .dark-background .content-formatted.header_title h3, .dark-background .content-formatted.header_title h4, .dark-background .content-formatted.header_title h5, .dark-background .content-formatted.header_title h6, .dark-background .content-formatted.site_title a, .dark-background .content-formatted.site_title p, .dark-background .content-formatted.site_title h1, .dark-background .content-formatted.site_title h2, .dark-background .content-formatted.site_title h3, .dark-background .content-formatted.site_title h4, .dark-background .content-formatted.site_title h5, .dark-background .content-formatted.site_title h6, .dark-background .content-formatted .product_item-btn.header_title a, .dark-background .content-formatted .product_item-btn.header_title p, .dark-background .content-formatted .product_item-btn.header_title h1, .dark-background .content-formatted .product_item-btn.header_title h2, .dark-background .content-formatted .product_item-btn.header_title h3, .dark-background .content-formatted .product_item-btn.header_title h4, .dark-background .content-formatted .product_item-btn.header_title h5, .dark-background .content-formatted .product_item-btn.header_title h6, .dark-background .content-formatted .product_item-btn.site_title a, .dark-background .content-formatted .product_item-btn.site_title p, .dark-background .content-formatted .product_item-btn.site_title h1, .dark-background .content-formatted .product_item-btn.site_title h2, .dark-background .content-formatted .product_item-btn.site_title h3, .dark-background .content-formatted .product_item-btn.site_title h4, .dark-background .content-formatted .product_item-btn.site_title h5, .dark-background .content-formatted .product_item-btn.site_title h6, .dark-background .content-formatted p.header_title a, .dark-background .content-formatted p.header_title p, .dark-background .content-formatted p.header_title h1, .dark-background .content-formatted p.header_title h2, .dark-background .content-formatted p.header_title h3, .dark-background .content-formatted p.header_title h4, .dark-background .content-formatted p.header_title h5, .dark-background .content-formatted p.header_title h6, .dark-background .content-formatted p.site_title a, .dark-background .content-formatted p.site_title p, .dark-background .content-formatted p.site_title h1, .dark-background .content-formatted p.site_title h2, .dark-background .content-formatted p.site_title h3, .dark-background .content-formatted p.site_title h4, .dark-background .content-formatted p.site_title h5, .dark-background .content-formatted p.site_title h6 {
  color: var(--fourth-color);
}
.content-formatted .custom-btn, .content-formatted .form_submit input, .content-formatted .product_item-btn .custom-btn, .content-formatted .product_item-btn .form_submit input, .content-formatted p .custom-btn, .content-formatted p .form_submit input {
  padding: calc(var(--button-padding) - 8px) var(--button-padding) calc(var(--button-padding) - 7px);
  color: var(--button-color);
  font-size: var(--button-font-size);
  font-style: var(--button-font-style);
  font-weight: var(--button-font-weight);
  -webkit-text-decoration: var(--button-text-decoration);
          text-decoration: var(--button-text-decoration);
  text-transform: var(--button-text-transform);
  -webkit-hyphens: var(--button-hyphens);
      -ms-hyphens: var(--button-hyphens);
          hyphens: var(--button-hyphens);
  background-color: var(--button-background-color);
}
.dark-background .content-formatted .custom-btn,
.dark-background .content-formatted .form_submit input,
.dark-background .content-formatted .product_item-btn .custom-btn,
.dark-background .content-formatted .product_item-btn .form_submit input,
.dark-background .content-formatted p .custom-btn,
.dark-background .content-formatted p .form_submit input {
  border: 1px solid var(--fourth-color);
}
.content-formatted .custom-btn:hover, .content-formatted .form_submit input:hover, .content-formatted .product_item-btn .custom-btn:hover, .content-formatted .product_item-btn .form_submit input:hover, .content-formatted p .custom-btn:hover, .content-formatted p .form_submit input:hover {
  padding: calc(var(--button-hover-padding) - 8px) var(--button-hover-padding) calc(var(--button-hover-padding) - 7px);
  color: var(--button-hover-color);
  font-size: var(--button-hover-font-size);
  font-style: var(--button-hover-font-style);
  font-weight: var(--button-hover-font-weight);
  -webkit-text-decoration: var(--button-hover-text-decoration);
          text-decoration: var(--button-hover-text-decoration);
  text-transform: var(--button-hover-text-transform);
  background-color: var(--button-hover-background-color);
}

.blog-page .post_read-more-btn {
  font-style: var(--content-link-font-style);
  font-weight: var(--content-link-font-weight);
  color: var(--content-link-color);
  -webkit-text-decoration: var(--content-link-text-decoration);
          text-decoration: var(--content-link-text-decoration);
  text-transform: var(--content-link-text-transform);
}

.loader::before {
  border-top-color: var(--secondary-color);
}

.content-formatted .form_field {
  line-height: var(--form-field-line-height);
}
.content-formatted .form_field .form_field_label,
.content-formatted .form_field .edy-fe-label {
  font-size: var(--form-label-font-size);
  -webkit-text-decoration: var(--form-field-text-decoration);
          text-decoration: var(--form-field-text-decoration);
  text-transform: var(--form-field-text-transform);
  font-style: var(--form-field-font-style);
  font-weight: var(--form-field-font-weight);
}
.content-formatted .form_field_textfield,
.content-formatted .form_field_textarea,
.content-formatted .form_field_select,
.content-formatted .product_filters-item,
.content-formatted label:not(.form_field_label) {
  font-weight: var(--form-field-font-weight);
  font-size: var(--form-field-font-size);
}
.dark-background .content-formatted .form_field_textfield,
.dark-background .content-formatted .form_field_textarea,
.dark-background .content-formatted .form_field_select {
  color: var(--fourth-color);
  border-color: var(--fourth-color);
}
.dark-background .content-formatted .form_field_textfield::-webkit-input-placeholder,
.dark-background .content-formatted .form_field_textarea::-webkit-input-placeholder,
.dark-background .content-formatted .form_field_select::-webkit-input-placeholder {
  color: var(--fourth-color);
}
.dark-background .content-formatted .form_field_textfield::-moz-placeholder,
.dark-background .content-formatted .form_field_textarea::-moz-placeholder,
.dark-background .content-formatted .form_field_select::-moz-placeholder {
  color: var(--fourth-color);
}
.dark-background .content-formatted .form_field_textfield::-ms-input-placeholder,
.dark-background .content-formatted .form_field_textarea::-ms-input-placeholder,
.dark-background .content-formatted .form_field_select::-ms-input-placeholder {
  color: var(--fourth-color);
}
.dark-background .content-formatted .form_field_textfield::placeholder,
.dark-background .content-formatted .form_field_textarea::placeholder,
.dark-background .content-formatted .form_field_select::placeholder {
  color: var(--fourth-color);
}
.light-background .content-formatted .form_field_textfield,
.light-background .content-formatted .form_field_textarea,
.light-background .content-formatted .form_field_select {
  color: var(--primary-color);
}
.light-background .content-formatted .form_field_textfield::-webkit-input-placeholder,
.light-background .content-formatted .form_field_textarea::-webkit-input-placeholder,
.light-background .content-formatted .form_field_select::-webkit-input-placeholder {
  color: var(--primary-color);
}
.light-background .content-formatted .form_field_textfield::-moz-placeholder,
.light-background .content-formatted .form_field_textarea::-moz-placeholder,
.light-background .content-formatted .form_field_select::-moz-placeholder {
  color: var(--primary-color);
}
.light-background .content-formatted .form_field_textfield::-ms-input-placeholder,
.light-background .content-formatted .form_field_textarea::-ms-input-placeholder,
.light-background .content-formatted .form_field_select::-ms-input-placeholder {
  color: var(--primary-color);
}
.light-background .content-formatted .form_field_textfield::placeholder,
.light-background .content-formatted .form_field_textarea::placeholder,
.light-background .content-formatted .form_field_select::placeholder {
  color: var(--primary-color);
}
.content-formatted .form_field_radio + .form_control_indicator:before {
  background-color: var(--primary-color);
}
