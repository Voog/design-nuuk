body {
  font-family: var(--main-font-family);
  color: var(--primary-color);
  background-color: var(--body-background-color);
}
body.dark-background {
  color: var(--third-color);
}

.container {
  max-width: var(--container-max-width);
}

.comments .comment_form .form_area {
  background-color: var(--article-comment-area-backgroundcolor);
  color: var(--article-comment-area-color);
}
.comments .comment_form .form_area .form_field_textfield,
.comments .comment_form .form_area .form_field_textarea {
  color: var(--article-comment-area-color);
  border-color: var(--article-comment-area-color);
}
.comments .comment_form .form_area .form_submit input {
  background-color: var(--article-comment-area-color);
  color: var(--article-comment-area-backgroundcolor);
}

.post .post_title, .post .post_title a {
  color: var(--primary-color);
}
.dark-background .post .post_title, .dark-background .post .post_title a {
  color: var(--third-color);
}
.post .post_title a:hover {
  color: var(--secondary-color);
}
.dark-background .post .post_title a:hover {
  color: var(--third-color);
}
.post .post_author, .post .post_date, .post .date-separator {
  color: var(--secondary-color);
}
.dark-background .post .post_author,
.dark-background .post .post_date,
.dark-background .post .date-separator {
  color: var(--third-color);
}
.dark-background .post .post_author {
  color: var(--third-color);
}
.post .post_comments-count a {
  color: var(--secondary-color);
}
.dark-background .post .post_comments-count a {
  color: var(--third-color);
}
.post .post_comments-count a:hover {
  color: var(--secondary-color);
}
.dark-background .post .post_comments-count a:hover {
  color: var(--third-color);
}

.menu-btn {
  color: var(--header-mainmenu-active-color);
}
:not(.scroll).dark-background .menu-btn {
  color: var(--third-color);
}
.menu-btn .menu-stripe {
  background-color: var(--header-mainmenu-active-color);
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .menu-btn .menu-stripe {
    background-color: var(--third-color);
  }
}
.menu-btn:hover {
  color: var(--header-mainmenu-active-color);
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .menu-btn:hover {
    color: var(--third-color);
    opacity: .7;
  }
}
.menu-btn:hover .menu-stripe {
  background-color: var(--header-mainmenu-color);
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .menu-btn:hover .menu-stripe {
    background-color: var(--third-color);
  }
}

.scroll.dark-background .menu-main :not(.menu_popover-item).menu-item,
.scroll.dark-background .content-formatted.header_title {
  color: var(--header-mainmenu-color);
}
.scroll.dark-background .menu-main :not(.menu_popover-item).menu-item a, .scroll.dark-background .menu-main :not(.menu_popover-item).menu-item p, .scroll.dark-background .menu-main :not(.menu_popover-item).menu-item h1, .scroll.dark-background .menu-main :not(.menu_popover-item).menu-item h2, .scroll.dark-background .menu-main :not(.menu_popover-item).menu-item h3, .scroll.dark-background .menu-main :not(.menu_popover-item).menu-item h4, .scroll.dark-background .menu-main :not(.menu_popover-item).menu-item h5, .scroll.dark-background .menu-main :not(.menu_popover-item).menu-item h6,
.scroll.dark-background .content-formatted.header_title a,
.scroll.dark-background .content-formatted.header_title p,
.scroll.dark-background .content-formatted.header_title h1,
.scroll.dark-background .content-formatted.header_title h2,
.scroll.dark-background .content-formatted.header_title h3,
.scroll.dark-background .content-formatted.header_title h4,
.scroll.dark-background .content-formatted.header_title h5,
.scroll.dark-background .content-formatted.header_title h6 {
  color: var(--header-mainmenu-color);
}
.scroll.dark-background .menu-main :not(.menu_popover-item).menu-item a:hover, .scroll.dark-background .menu-main :not(.menu_popover-item).menu-item.active a,
.scroll.dark-background .content-formatted.header_title a:hover,
.scroll.dark-background .content-formatted.header_title.active a {
  color: var(--header-mainmenu-color);
}
.scroll.dark-background .menu-main :not(.menu_popover-item).menu-item a:hover,
.scroll.dark-background .content-formatted.header_title a:hover {
  opacity: .7;
}

.search-btn svg g, .edy-ecommerce-custom-ico svg g, .edy-ecommerce-custom-ico svg path {
  fill: var(--header-mainmenu-active-color);
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .search-btn svg g,
  :not(.scroll).dark-background .edy-ecommerce-custom-ico svg g,
  :not(.scroll).dark-background .edy-ecommerce-custom-ico svg path {
    fill: var(--third-color);
  }
}

.search-btn:hover svg g, .edy-ecommerce-custom-ico:hover svg g, .edy-ecommerce-custom-ico:hover svg path {
  fill: var(--header-mainmenu-color);
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .search-btn:hover svg g,
  :not(.scroll).dark-background .edy-ecommerce-custom-ico:hover svg g,
  :not(.scroll).dark-background .edy-ecommerce-custom-ico:hover svg path {
    opacity: .7;
    fill: var(--third-color);
  }
}

.menu_popover-btn svg path {
  fill: var(--header-mainmenu-color);
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .menu_popover-btn svg path {
    fill: var(--third-color);
  }
}
.menu_popover-btn:hover svg path {
  fill: var(--header-mainmenu-hover-color);
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .menu_popover-btn:hover svg path {
    opacity: .7;
    fill: var(--third-color);
  }
}

.menu-language-btn, .menu-language-name {
  color: var(--header-mainmenu-active-color);
}
.menu-language-btn svg path, .menu-language-name svg path {
  stroke: var(--header-mainmenu-act ive-color);
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .menu-language-btn svg path,
  :not(.scroll).dark-background .menu-language-name svg path {
    stroke: var(--third-color);
  }
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .menu-language-btn,
  :not(.scroll).dark-background .menu-language-name {
    color: var(--third-color);
  }
}
.menu-language-btn:hover, .menu-language-name:hover {
  color: var(--header-mainmenu-color);
}
.menu-language-btn:hover svg path, .menu-language-name:hover svg path {
  stroke: var(--header-mainmenu-color);
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .menu-language-btn:hover svg path, :not(.scroll).dark-background .menu-language-name:hover svg path {
    opacity: .7;
    stroke: var(--third-color);
  }
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .menu-language-btn:hover, :not(.scroll).dark-background .menu-language-name:hover {
    opacity: .7;
    color: var(--third-color);
  }
}

.edy-ecommerce-product-count {
  color: var(--header-mainmenu-active-color);
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .edy-ecommerce-product-count {
    color: var(--third-color);
  }
}

.edy-ecommerce-shopping-cart-button:hover .edy-ecommerce-product-count {
  color: var(--header-mainmenu-color);
}
@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .edy-ecommerce-shopping-cart-button:hover .edy-ecommerce-product-count {
    color: var(--third-color);
  }
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
  line-height: var(--header-mainmenu-line-height);
  text-transform: var(--header-mainmenu-text-transform);
}
.menu-main .menu .menu-item a.untranslated {
  color: #cc0000;
}
.dark-background .menu-main .menu .menu-item a {
  color: var(--third-color);
}
.menu-main .menu .menu-item a::before {
  background-color: var(--header-mainmenu-color);
}
.dark-background .menu-main .menu .menu-item a::before {
  background-color: var(--third-color);
}
.menu-main .menu .menu-item a:hover {
  color: var(--header-mainmenu-hover-color);
  -webkit-text-decoration: var(--header-mainmenu-hover-decoration);
          text-decoration: var(--header-mainmenu-hover-decoration);
  font-weight: var(--header-mainmenu-hover-font-weight);
  font-style: var(--header-mainmenu-hover-font-style);
}
.dark-background .menu-main .menu .menu-item a:hover {
  color: var(--third-color);
  opacity: .7;
}
.menu-main .menu .menu-item.active a {
  color: var(--header-mainmenu-active-color);
  font-weight: var(--header-mainmenu-active-font-weight);
  -webkit-text-decoration: var(--header-mainmenu-active-decoration);
          text-decoration: var(--header-mainmenu-active-decoration);
  font-style: var(--header-mainmenu-active-font-style);
  line-height: var(--header-mainmenu-line-height);
  text-transform: var(--header-mainmenu-text-transform);
}
.menu-main .menu .menu-item.active a.untranslated {
  color: #cc0000;
}
.menu-main .menu .menu-item.active a::before {
  background-color: var(--header-mainmenu-active-color);
}
.dark-background .menu-main .menu .menu-item.active a::before {
  background-color: var(--third-color);
  opacity: .7;
}
.dark-background .menu-main .menu .menu-item.active a {
  color: var(--third-color);
  opacity: .7;
}
.menu-main .menu .menu-item.active a:hover {
  color: var(--header-mainmenu-hover-color);
  -webkit-text-decoration: var(--header-mainmenu-hover-decoration);
          text-decoration: var(--header-mainmenu-hover-decoration);
  text-transform: var(--header-mainmenu-text-transform);
}
.menu-main .menu .menu-item.active a:hover::before {
  background-color: var(--header-mainmenu-hover-color);
}
.dark-background .menu-main .menu .menu-item.active a:hover {
  color: var(--third-color);
  opacity: 1;
}
.menu-main .menu .menu-sub .menu-item a {
  color: var(--menu-sub-color);
  -webkit-text-decoration: var(--menu-sub-text-decoration);
          text-decoration: var(--menu-sub-text-decoration);
  font-weight: var(--menu-sub-font-weight);
  font-style: var(--menu-sub-font-style);
  font-size: var(--menu-sub-font-size);
  line-height: var(--menu-sub-line-height);
  text-transform: var(--menu-sub-text-transform);
}
.menu-main .menu .menu-sub .menu-item a.untranslated {
  color: #cc0000;
}
.menu-main .menu .menu-sub .menu-item a::after {
  background-color: var(--menu-sub-color);
}
.menu-main .menu .menu-sub .menu-item a:hover {
  color: var(--menu-sub-hover-color);
  -webkit-text-decoration: var(--menu-sub-hover-decoration);
          text-decoration: var(--menu-sub-hover-decoration);
  font-weight: var(--menu-sub-hover-font-weight);
  font-style: var(--menu-sub-hover-font-style);
  line-height: var(--menu-sub-hover-line-height);
  text-transform: var(--menu-sub-hover-text-transform);
}
.menu-main .menu .menu-sub .menu-item a:hover::before {
  border-color: var(--menu-sub-hover-color);
}
.menu-main .menu .menu-sub .menu-item a::before {
  border-color: var(--menu-sub-hover-color);
}
.menu-main .menu .menu-sub .menu-item.active a {
  color: var(--menu-sub-active-color);
  -webkit-text-decoration: var(--menu-sub-active-text-decoration);
          text-decoration: var(--menu-sub-active-text-decoration);
  font-weight: var(--menu-sub-active-font-weight);
  font-style: var(--menu-sub-active-font-style);
  font-size: var(--menu-sub-active-font-size);
  line-height: var(--menu-sub-active-line-height);
  text-transform: var(--menu-sub-active-text-transform);
}
.menu-main .menu .menu-sub .menu-item.active a.untranslated {
  color: #cc0000;
}
.menu-main .menu .menu-sub .menu-item.active a::before {
  border-color: var(--menu-sub-active-color);
}
.menu-main .menu .menu-sub .menu-item.active a:hover {
  color: var(--menu-sub-color);
  -webkit-text-decoration: var(--menu-sub-text-decoration);
          text-decoration: var(--menu-sub-text-decoration);
  font-weight: var(--menu-sub-font-weight);
  font-style: var(--menu-sub-font-style);
  line-height: var(--menu-sub-line-height);
}
.menu-main .menu .menu-sub .menu-item.active a:hover svg,
.menu-main .menu .menu-sub .menu-item.active a:hover path {
  fill: var(--menu-sub-color);
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
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a {
  color: var(--menu-sub-color);
}
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a::after {
  background-color: var(--menu-sub-color);
}
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a.active {
  color: var(--menu-sub-hover-color);
}
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a.active::before {
  border-color: var(--menu-sub-active-color);
}
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a.active:hover {
  color: var(--menu-sub-color);
}
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a.active:hover svg,
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a.active:hover path {
  fill: var(--menu-sub-color);
}
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a:hover {
  color: var(--menu-sub-hover-color);
}
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a:hover::before {
  border-color: var(--menu-sub-hover-color);
}
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a::before {
  border-color: var(--menu-sub-hover-color);
}

.dark-background .menu-breadcrumbs.menu-sub .menu-item a::after {
  background-color: var(--third-color);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a {
  color: var(--third-color);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a.active {
  color: var(--third-color);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a.active::before {
  border-color: var(--third-color);
}
.menu-breadcrumbs.menu-sub .menu-item a.active:hover {
  color: var(--header-mainmenu-color);
  -webkit-text-decoration: var(--header-mainmenu-hover-decoration);
          text-decoration: var(--header-mainmenu-hover-decoration);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a.active:hover svg,
.dark-background .menu-breadcrumbs.menu-sub .menu-item a.active:hover path {
  fill: var(--third-color);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a:hover {
  color: var(--third-color);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a:hover::before {
  border-color: var(--third-color);
}
.dark-background .menu-breadcrumbs.menu-sub .menu-item a::before {
  border-color: var(--third-color);
}

.footer .voog-reference svg path {
  fill: var(--primary-color);
}
.dark-background .footer .voog-reference svg path {
  fill: var(--third-color);
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
  color: var(--third-color);
}
.content-formatted .horizontal-scroll, .content-formatted .product_item-btn .horizontal-scroll, .content-formatted p .horizontal-scroll {
  border-left: 1px dashed var(--content-body-color);
  border-right: 1px dashed var(--content-body-color);
}
.dark-background .content-formatted .horizontal-scroll, .dark-background .content-formatted .product_item-btn .horizontal-scroll, .dark-background .content-formatted p .horizontal-scroll {
  border-left: 1px dashed var(--third-color);
  border-right: 1px dashed var(--third-color);
}
.content-formatted table td, .content-formatted .product_item-btn table td, .content-formatted p table td {
  border-top: 1px solid var(--content-body-color);
  border-bottom: 1px solid var(--content-body-color);
}
.dark-background .content-formatted table td, .dark-background .content-formatted .product_item-btn table td, .dark-background .content-formatted p table td {
  border-top: 1px solid var(--third-color);
  border-bottom: 1px solid var(--third-color);
}
.content-formatted h1, .content-formatted h2, .content-formatted h3, .content-formatted h4, .content-formatted h5, .content-formatted h6, .content-formatted .product_item-btn h1, .content-formatted .product_item-btn h2, .content-formatted .product_item-btn h3, .content-formatted .product_item-btn h4, .content-formatted .product_item-btn h5, .content-formatted .product_item-btn h6, .content-formatted p h1, .content-formatted p h2, .content-formatted p h3, .content-formatted p h4, .content-formatted p h5, .content-formatted p h6 {
  color: var(--secondary-color);
}
.dark-background .content-formatted h1, .dark-background .content-formatted h2, .dark-background .content-formatted h3, .dark-background .content-formatted h4, .dark-background .content-formatted h5, .dark-background .content-formatted h6, .dark-background .content-formatted .product_item-btn h1, .dark-background .content-formatted .product_item-btn h2, .dark-background .content-formatted .product_item-btn h3, .dark-background .content-formatted .product_item-btn h4, .dark-background .content-formatted .product_item-btn h5, .dark-background .content-formatted .product_item-btn h6, .dark-background .content-formatted p h1, .dark-background .content-formatted p h2, .dark-background .content-formatted p h3, .dark-background .content-formatted p h4, .dark-background .content-formatted p h5, .dark-background .content-formatted p h6 {
  color: var(--third-color);
}
.dark-background .content-formatted .edy-content-social-button svg, .dark-background .content-formatted .edy-content-social-button path, .dark-background .content-formatted .product_item-btn .edy-content-social-button svg, .dark-background .content-formatted .product_item-btn .edy-content-social-button path, .dark-background .content-formatted p .edy-content-social-button svg, .dark-background .content-formatted p .edy-content-social-button path {
  fill: var(--third-color);
  border-color: var(--third-color);
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
    font-size: calc(var(--headings-title-font-size) / 2);
    line-height: calc(var(--headings-title-line-height) / 2);
  }
}
@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted h1, .semimodal-relative .content-formatted .product_item-btn h1, .semimodal-relative .content-formatted p h1 {
    font-size: calc(var(--headings-title-font-size) / 2);
    line-height: calc(var(--headings-title-line-height) / 2);
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
    font-size: calc(var(--headings-heading-font-size) / 1.8);
    line-height: calc(var(--headings-heading-line-height) / 1.8);
  }
}
@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted h2, .semimodal-relative .content-formatted .product_item-btn h2, .semimodal-relative .content-formatted p h2 {
    font-size: calc(var(--headings-heading-font-size) / 1.8);
    line-height: calc(var(--headings-heading-line-height) / 1.8);
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
    font-size: calc(var(--headings-subheading-font-size) / 1.8);
    line-height: calc(var(--headings-subheading-line-height) / 1.8);
  }
}
@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted h3, .semimodal-relative .content-formatted .product_item-btn h3, .semimodal-relative .content-formatted p h3 {
    font-size: calc(var(--headings-subheading-font-size) / 1.8);
    line-height: calc(var(--headings-subheading-line-height) / 1.8);
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
  color: var(--third-color);
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
  color: var(--third-color);
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
  color: var(--third-color);
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
  color: var(--third-color);
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
  border: 1px solid var(--third-color);
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
  color: var(--third-color);
  border-color: var(--third-color);
}
.dark-background .content-formatted .form_field_textfield::-webkit-input-placeholder,
.dark-background .content-formatted .form_field_textarea::-webkit-input-placeholder,
.dark-background .content-formatted .form_field_select::-webkit-input-placeholder {
  color: var(--third-color);
}
.dark-background .content-formatted .form_field_textfield::-moz-placeholder,
.dark-background .content-formatted .form_field_textarea::-moz-placeholder,
.dark-background .content-formatted .form_field_select::-moz-placeholder {
  color: var(--third-color);
}
.dark-background .content-formatted .form_field_textfield::-ms-input-placeholder,
.dark-background .content-formatted .form_field_textarea::-ms-input-placeholder,
.dark-background .content-formatted .form_field_select::-ms-input-placeholder {
  color: var(--third-color);
}
.dark-background .content-formatted .form_field_textfield::placeholder,
.dark-background .content-formatted .form_field_textarea::placeholder,
.dark-background .content-formatted .form_field_select::placeholder {
  color: var(--third-color);
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
