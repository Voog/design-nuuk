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

.comments .comment_form .form_area .form_field_with_errors .form_field_textfield,
.comments .comment_form .form_area .form_field_with_errors .form_field_textarea {
  border-color: #C5292A;
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

.post .post_author,
.post .post_date,
.post .date-separator {
  color: var(--secondary-color);
}

.dark-background .post .post_author, .dark-background
.post .post_date, .dark-background
.post .date-separator {
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

.edy-ecommerce-product-count {
  color: var(--header-mainmenu-active-color);
}

@media screen and (min-width: 900px) {
  :not(.scroll).dark-background .edy-ecommerce-product-count {
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

@media screen and (max-width: 900px) {
  .menu-main .menu .menu-item a {
    font-size: 24px;
    line-height: 28px;
  }
}

.menu-main .menu .menu-item a.untranslated {
  color: #C5292A;
}

.menu-main .menu .menu-item a::before {
  background-color: var(--header-mainmenu-color);
}

.menu-main .menu .menu-item a:hover {
  color: var(--header-mainmenu-hover-color);
  -webkit-text-decoration: var(--header-mainmenu-hover-decoration);
          text-decoration: var(--header-mainmenu-hover-decoration);
  font-weight: var(--header-mainmenu-hover-font-weight);
  font-style: var(--header-mainmenu-hover-font-style);
}

.menu-main .menu .menu-item a.selected {
  color: var(--header-mainmenu-active-color);
  font-weight: var(--header-mainmenu-active-font-weight);
  -webkit-text-decoration: var(--header-mainmenu-active-decoration);
          text-decoration: var(--header-mainmenu-active-decoration);
  font-style: var(--header-mainmenu-active-font-style);
  line-height: var(--header-mainmenu-line-height);
  text-transform: var(--header-mainmenu-text-transform);
}

@media screen and (max-width: 900px) {
  .menu-main .menu .menu-item a.selected {
    font-size: 24px;
    line-height: 28px;
  }
}

.menu-main .menu .menu-item a.selected.untranslated {
  color: #C5292A;
}

.menu-main .menu .menu-item a.selected::before {
  background-color: var(--header-mainmenu-active-color);
}

.menu-main .menu .menu-item a.selected:hover {
  color: var(--header-mainmenu-hover-color);
  -webkit-text-decoration: var(--header-mainmenu-hover-decoration);
          text-decoration: var(--header-mainmenu-hover-decoration);
  text-transform: var(--header-mainmenu-text-transform);
}

.menu-main .menu .menu-item a.selected:hover::before {
  background-color: var(--header-mainmenu-hover-color);
}

.semimodal .menu-main .menu .menu-sub .menu-item {
  border-left: 1px solid var(--menu-sub-color);
}

@media screen and (max-width: 900px) {
  .semimodal .menu-main .menu .menu-sub .menu-item {
    border-left: none;
  }
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

@media screen and (max-width: 900px) {
  .menu-main .menu .menu-sub .menu-item a {
    font-size: 18px;
    line-height: 21px;
  }
}

.menu-main .menu .menu-sub .menu-item a.untranslated {
  color: #C5292A;
}

.menu-main .menu .menu-sub .menu-item a:hover {
  color: var(--menu-sub-hover-color);
  -webkit-text-decoration: var(--menu-sub-hover-decoration);
          text-decoration: var(--menu-sub-hover-decoration);
  font-weight: var(--menu-sub-hover-font-weight);
  font-style: var(--menu-sub-hover-font-style);
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
  text-transform: var(--menu-sub-active-text-transform);
}

@media screen and (max-width: 900px) {
  .menu-main .menu .menu-sub .menu-item.active a {
    font-size: 18px;
    line-height: 21px;
  }
}

.menu-main .menu .menu-sub .menu-item.active a.untranslated {
  color: #C5292A;
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
}

.menu-main .menu .menu-sub .menu-item.active a:hover svg,
.menu-main .menu .menu-sub .menu-item.active a:hover path {
  fill: var(--menu-sub-color);
}

.menu-breadcrumbs.menu-sub .menu-item a {
  color: var(--secondary-color);
}

.menu-breadcrumbs.menu-sub .menu-item a:hover {
  color: var(--primary-color);
}

.dark-background .menu-breadcrumbs.menu-sub .menu-item a:hover svg, .dark-background
.menu-breadcrumbs.menu-sub .menu-item a:hover path {
  fill: var(--primary-color);
}

.dark-background .menu-breadcrumbs.menu-sub .menu-item a::after {
  background-color: var(--third-color);
}

.dark-background .menu-breadcrumbs.menu-sub .menu-item a {
  color: var(--third-color);
}

.menu-breadcrumbs.menu-sub .menu-item a.active {
  color: var(--secondary-color);
}

.dark-background .menu-breadcrumbs.menu-sub .menu-item a.active {
  color: var(--third-color);
}

.dark-background .menu-breadcrumbs.menu-sub .menu-item a.active::before {
  border-color: var(--third-color);
}

.menu-breadcrumbs.menu-sub .menu-item a.active:hover {
  color: var(--primary-color);
}

.dark-background .menu-breadcrumbs.menu-sub .menu-item a.active:hover svg, .dark-background
.menu-breadcrumbs.menu-sub .menu-item a.active:hover path {
  fill: var(--primary-color);
}

.dark-background .menu-breadcrumbs.menu-sub .menu-item a:hover {
  color: var(--third-color);
  opacity: .7;
}

.dark-background .dark-background .menu-breadcrumbs.menu-sub .menu-item a:hover svg, .dark-background
.dark-background .menu-breadcrumbs.menu-sub .menu-item a:hover path {
  fill: var(--third-color);
  opacity: .7;
}

.dark-background .menu-breadcrumbs.menu-sub .menu-item a:hover::before {
  border-color: var(--third-color);
  opacity: .7;
}

.dark-background .menu-breadcrumbs.menu-sub .menu-item a::before {
  border-color: var(--third-color);
}

.footer .content-formatted {
  font-size: var(--layout-footer-font-size);
  line-height: var(--layout-footer-line-height);
}

.footer .content-formatted .voog-reference svg path {
  fill: var(--primary-color);
}

.dark-background .footer .content-formatted .voog-reference svg path {
  fill: var(--third-color);
}

.content-formatted,
.content-formatted .product_item-btn,
.content-formatted p {
  font-size: var(--content-body-font-size);
  line-height: var(--content-body-line-height);
  color: var(--content-body-color);
  -webkit-hyphens: var(--content-body-hyphens);
      -ms-hyphens: var(--content-body-hyphens);
          hyphens: var(--content-body-hyphens);
}

.post_page .article_item .post_content .content-formatted, .post_page .article_item
.content-formatted .post_details, .post_page .article_item .post_content
.content-formatted .product_item-btn, .post_page .article_item
.content-formatted .product_item-btn .post_details, .post_page .article_item .post_content
.content-formatted p, .post_page .article_item
.content-formatted p .post_details {
  font-size: var(--blog-body-font-size);
  line-height: var(--blog-body-line-height);
}

.post_page .content-formatted.post_tags .menu a, .post_page
.content-formatted .product_item-btn.post_tags .menu a, .post_page
.content-formatted p.post_tags .menu a {
  font-size: var(--blog-body-font-size);
  line-height: var(--blog-body-line-height);
}

.dark-background .content-formatted, .dark-background
.content-formatted .product_item-btn, .dark-background
.content-formatted p {
  color: var(--third-color);
}

.content-formatted .horizontal-scroll,
.content-formatted .product_item-btn .horizontal-scroll,
.content-formatted p .horizontal-scroll {
  border-left: 1px dashed var(--content-body-color);
  border-right: 1px dashed var(--content-body-color);
}

.dark-background .content-formatted .horizontal-scroll, .dark-background
.content-formatted .product_item-btn .horizontal-scroll, .dark-background
.content-formatted p .horizontal-scroll {
  border-left: 1px dashed var(--third-color);
  border-right: 1px dashed var(--third-color);
}

.content-formatted h1, .content-formatted h2, .content-formatted h3, .content-formatted h4, .content-formatted h5, .content-formatted h6,
.content-formatted .product_item-btn h1,
.content-formatted .product_item-btn h2,
.content-formatted .product_item-btn h3,
.content-formatted .product_item-btn h4,
.content-formatted .product_item-btn h5,
.content-formatted .product_item-btn h6,
.content-formatted p h1,
.content-formatted p h2,
.content-formatted p h3,
.content-formatted p h4,
.content-formatted p h5,
.content-formatted p h6 {
  color: var(--secondary-color);
}

.dark-background .content-formatted h1, .dark-background .content-formatted h2, .dark-background .content-formatted h3, .dark-background .content-formatted h4, .dark-background .content-formatted h5, .dark-background .content-formatted h6, .dark-background
.content-formatted .product_item-btn h1, .dark-background
.content-formatted .product_item-btn h2, .dark-background
.content-formatted .product_item-btn h3, .dark-background
.content-formatted .product_item-btn h4, .dark-background
.content-formatted .product_item-btn h5, .dark-background
.content-formatted .product_item-btn h6, .dark-background
.content-formatted p h1, .dark-background
.content-formatted p h2, .dark-background
.content-formatted p h3, .dark-background
.content-formatted p h4, .dark-background
.content-formatted p h5, .dark-background
.content-formatted p h6 {
  color: var(--third-color);
}

.dark-background .content-formatted .edy-content-social-button svg, .dark-background .content-formatted .edy-content-social-button path, .dark-background
.content-formatted .product_item-btn .edy-content-social-button svg, .dark-background
.content-formatted .product_item-btn .edy-content-social-button path, .dark-background
.content-formatted p .edy-content-social-button svg, .dark-background
.content-formatted p .edy-content-social-button path {
  fill: var(--third-color);
  border-color: var(--third-color);
}

.content-formatted h1,
.content-formatted .product_item-btn h1,
.content-formatted p h1 {
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
  .content-formatted h1,
  .content-formatted .product_item-btn h1,
  .content-formatted p h1 {
    font-size: calc(var(--headings-title-font-size) / 2);
  }
}

@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted h1, .semimodal-relative
  .content-formatted .product_item-btn h1, .semimodal-relative
  .content-formatted p h1 {
    font-size: calc(var(--headings-title-font-size) / 2);
  }
}

.content-formatted h2,
.content-formatted .product_item-btn h2,
.content-formatted p h2 {
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
  .content-formatted h2,
  .content-formatted .product_item-btn h2,
  .content-formatted p h2 {
    font-size: calc(var(--headings-heading-font-size) / 1.8);
  }
}

@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted h2, .semimodal-relative
  .content-formatted .product_item-btn h2, .semimodal-relative
  .content-formatted p h2 {
    font-size: calc(var(--headings-heading-font-size) / 1.8);
  }
}

.content-formatted h3,
.content-formatted .product_item-btn h3,
.content-formatted p h3 {
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
  .content-formatted h3,
  .content-formatted .product_item-btn h3,
  .content-formatted p h3 {
    font-size: calc(var(--headings-subheading-font-size) / 1.4);
  }
}

@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted h3, .semimodal-relative
  .content-formatted .product_item-btn h3, .semimodal-relative
  .content-formatted p h3 {
    font-size: calc(var(--headings-subheading-font-size) / 1.4);
  }
}

.content-formatted h4,
.content-formatted .product_item-btn h4,
.content-formatted p h4 {
  font-size: var(--headings-heading-4-font-size);
  font-style: var(--headings-heading-4-font-style);
  font-weight: var(--headings-heading-4-font-weight);
  line-height: var(--headings-heading-4-line-height);
  color: var(--headings-heading-4-color);
  text-align: var(--headings-heading-4-text-alignment);
  -webkit-text-decoration: var(--headings-heading-4-text-decoration);
          text-decoration: var(--headings-heading-4-text-decoration);
  text-transform: var(--headings-heading-4-text-transform);
  -webkit-hyphens: var(--headings-heading-4-hyphens);
      -ms-hyphens: var(--headings-heading-4-hyphens);
          hyphens: var(--headings-heading-4-hyphens);
}

@media screen and (max-width: 900px) {
  .content-formatted h4,
  .content-formatted .product_item-btn h4,
  .content-formatted p h4 {
    font-size: calc(var(--headings-heading-4-font-size) / 1.2);
  }
}

@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted h4, .semimodal-relative
  .content-formatted .product_item-btn h4, .semimodal-relative
  .content-formatted p h4 {
    font-size: calc(var(--headings-heading-4-font-size) / 1.2);
  }
}

.content-formatted a:not(.custom-btn),
.content-formatted .product_item-btn a:not(.custom-btn),
.content-formatted p a:not(.custom-btn) {
  font-style: var(--content-link-font-style);
  font-weight: var(--content-link-font-weight);
  color: var(--content-link-color);
  -webkit-text-decoration: var(--content-link-text-decoration);
          text-decoration: var(--content-link-text-decoration);
  text-transform: var(--content-link-text-transform);
}

.dark-background .content-formatted a:not(.custom-btn), .dark-background
.content-formatted .product_item-btn a:not(.custom-btn), .dark-background
.content-formatted p a:not(.custom-btn) {
  color: var(--third-color);
}

.content-formatted a:not(.custom-btn):hover,
.content-formatted .product_item-btn a:not(.custom-btn):hover,
.content-formatted p a:not(.custom-btn):hover {
  font-style: var(--content-link-hover-font-style);
  font-weight: var(--content-link-hover-font-weight);
  color: var(--content-link-hover-color);
  -webkit-text-decoration: var(--content-link-hover-text-decoration);
          text-decoration: var(--content-link-hover-text-decoration);
  text-transform: var(--content-link-hover-text-transform);
}

.dark-background .content-formatted a:not(.custom-btn):hover, .dark-background
.content-formatted .product_item-btn a:not(.custom-btn):hover, .dark-background
.content-formatted p a:not(.custom-btn):hover {
  color: var(--third-color);
}

.content-formatted.header_title, .content-formatted.site_title,
.content-formatted .product_item-btn.header_title,
.content-formatted .product_item-btn.site_title,
.content-formatted p.header_title,
.content-formatted p.site_title {
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

.content-formatted.header_title a, .content-formatted.header_title p, .content-formatted.header_title h1, .content-formatted.header_title h2, .content-formatted.header_title h3, .content-formatted.header_title h4, .content-formatted.header_title h5, .content-formatted.header_title h6, .content-formatted.site_title a, .content-formatted.site_title p, .content-formatted.site_title h1, .content-formatted.site_title h2, .content-formatted.site_title h3, .content-formatted.site_title h4, .content-formatted.site_title h5, .content-formatted.site_title h6,
.content-formatted .product_item-btn.header_title a,
.content-formatted .product_item-btn.header_title p,
.content-formatted .product_item-btn.header_title h1,
.content-formatted .product_item-btn.header_title h2,
.content-formatted .product_item-btn.header_title h3,
.content-formatted .product_item-btn.header_title h4,
.content-formatted .product_item-btn.header_title h5,
.content-formatted .product_item-btn.header_title h6,
.content-formatted .product_item-btn.site_title a,
.content-formatted .product_item-btn.site_title p,
.content-formatted .product_item-btn.site_title h1,
.content-formatted .product_item-btn.site_title h2,
.content-formatted .product_item-btn.site_title h3,
.content-formatted .product_item-btn.site_title h4,
.content-formatted .product_item-btn.site_title h5,
.content-formatted .product_item-btn.site_title h6,
.content-formatted p.header_title a,
.content-formatted p.header_title p,
.content-formatted p.header_title h1,
.content-formatted p.header_title h2,
.content-formatted p.header_title h3,
.content-formatted p.header_title h4,
.content-formatted p.header_title h5,
.content-formatted p.header_title h6,
.content-formatted p.site_title a,
.content-formatted p.site_title p,
.content-formatted p.site_title h1,
.content-formatted p.site_title h2,
.content-formatted p.site_title h3,
.content-formatted p.site_title h4,
.content-formatted p.site_title h5,
.content-formatted p.site_title h6 {
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

@media screen and (max-width: 900px) {
  .content-formatted.header_title, .content-formatted.site_title,
  .content-formatted .product_item-btn.header_title,
  .content-formatted .product_item-btn.site_title,
  .content-formatted p.header_title,
  .content-formatted p.site_title {
    font-size: 18px;
    line-height: 18px;
  }
}

.content-formatted .custom-btn,
.content-formatted .form_submit input,
.content-formatted .product_item-btn .custom-btn,
.content-formatted .product_item-btn .form_submit input,
.content-formatted p .custom-btn,
.content-formatted p .form_submit input {
  padding: var(--button-padding);
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

.dark-background .content-formatted .custom-btn, .dark-background
.content-formatted .form_submit input, .dark-background
.content-formatted .product_item-btn .custom-btn, .dark-background
.content-formatted .product_item-btn .form_submit input, .dark-background
.content-formatted p .custom-btn, .dark-background
.content-formatted p .form_submit input {
  border: 1px solid var(--third-color);
}

.content-formatted .custom-btn:hover,
.content-formatted .form_submit input:hover,
.content-formatted .product_item-btn .custom-btn:hover,
.content-formatted .product_item-btn .form_submit input:hover,
.content-formatted p .custom-btn:hover,
.content-formatted p .form_submit input:hover {
  padding: var(--button-hover-padding);
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
  font-weight: 600;
}

.content-formatted .form_field.form_field_with_errors .form_field_label,
.content-formatted .form_field.form_field_with_errors .edy-fe-label {
  color: #C5292A;
}

.content-formatted .form_field_textfield,
.content-formatted .form_field_textarea,
.content-formatted .form_field_select,
.content-formatted .product_filters-item,
.content-formatted label:not(.form_field_label) {
  font-weight: var(--form-field-font-weight);
  font-size: var(--form-field-font-size);
  line-height: var(--form-field-line-height);
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

.light-background .swiper-container .swiper-button-next:after,
.light-background .swiper-container .swiper-button-prev:after,
.light-background .light-background .swiper-container .swiper-button-next:after,
.light-background .light-background .swiper-container .swiper-button-prev:after,
.dark-background .light-background .swiper-container .swiper-button-next:after,
.dark-background .light-background .swiper-container .swiper-button-prev:after,
.scroll.dark-background .dark-background .swiper-container .swiper-button-next:after,
.scroll.dark-background .dark-background .swiper-container .swiper-button-prev:after,
.scroll.light-background .dark-background .swiper-container .swiper-button-next:after,
.scroll.light-background .dark-background .swiper-container .swiper-button-prev:after,
* .swiper-container .swiper-button-next:after,
* .swiper-container .swiper-button-prev:after {
  color: var(--header-mainmenu-active-color);
}

.light-background .swiper-container .swiper-pagination-bullet,
.light-background .light-background .swiper-container .swiper-pagination-bullet,
.dark-background .light-background .swiper-container .swiper-pagination-bullet,
.scroll.dark-background .dark-background .swiper-container .swiper-pagination-bullet,
.scroll.light-background .dark-background .swiper-container .swiper-pagination-bullet,
* .swiper-container .swiper-pagination-bullet {
  background-color: var(--header-mainmenu-active-color);
}

.light-background .site_title.content-formatted,
.light-background .header_title.content-formatted,
.light-background .light-background .site_title.content-formatted,
.light-background .light-background .header_title.content-formatted,
.dark-background .light-background .site_title.content-formatted,
.dark-background .light-background .header_title.content-formatted,
.scroll.dark-background .dark-background .site_title.content-formatted,
.scroll.dark-background .dark-background .header_title.content-formatted,
.scroll.light-background .dark-background .site_title.content-formatted,
.scroll.light-background .dark-background .header_title.content-formatted,
* .site_title.content-formatted,
* .header_title.content-formatted {
  color: var(--header-site-title-color);
}

.light-background .site_title.content-formatted a, .light-background .site_title.content-formatted p, .light-background .site_title.content-formatted h1, .light-background .site_title.content-formatted h2, .light-background .site_title.content-formatted h3, .light-background .site_title.content-formatted h4, .light-background .site_title.content-formatted h5, .light-background .site_title.content-formatted h6,
.light-background .header_title.content-formatted a,
.light-background .header_title.content-formatted p,
.light-background .header_title.content-formatted h1,
.light-background .header_title.content-formatted h2,
.light-background .header_title.content-formatted h3,
.light-background .header_title.content-formatted h4,
.light-background .header_title.content-formatted h5,
.light-background .header_title.content-formatted h6,
.light-background .light-background .site_title.content-formatted a,
.light-background .light-background .site_title.content-formatted p,
.light-background .light-background .site_title.content-formatted h1,
.light-background .light-background .site_title.content-formatted h2,
.light-background .light-background .site_title.content-formatted h3,
.light-background .light-background .site_title.content-formatted h4,
.light-background .light-background .site_title.content-formatted h5,
.light-background .light-background .site_title.content-formatted h6,
.light-background .light-background .header_title.content-formatted a,
.light-background .light-background .header_title.content-formatted p,
.light-background .light-background .header_title.content-formatted h1,
.light-background .light-background .header_title.content-formatted h2,
.light-background .light-background .header_title.content-formatted h3,
.light-background .light-background .header_title.content-formatted h4,
.light-background .light-background .header_title.content-formatted h5,
.light-background .light-background .header_title.content-formatted h6,
.dark-background .light-background .site_title.content-formatted a,
.dark-background .light-background .site_title.content-formatted p,
.dark-background .light-background .site_title.content-formatted h1,
.dark-background .light-background .site_title.content-formatted h2,
.dark-background .light-background .site_title.content-formatted h3,
.dark-background .light-background .site_title.content-formatted h4,
.dark-background .light-background .site_title.content-formatted h5,
.dark-background .light-background .site_title.content-formatted h6,
.dark-background .light-background .header_title.content-formatted a,
.dark-background .light-background .header_title.content-formatted p,
.dark-background .light-background .header_title.content-formatted h1,
.dark-background .light-background .header_title.content-formatted h2,
.dark-background .light-background .header_title.content-formatted h3,
.dark-background .light-background .header_title.content-formatted h4,
.dark-background .light-background .header_title.content-formatted h5,
.dark-background .light-background .header_title.content-formatted h6,
.scroll.dark-background .dark-background .site_title.content-formatted a,
.scroll.dark-background .dark-background .site_title.content-formatted p,
.scroll.dark-background .dark-background .site_title.content-formatted h1,
.scroll.dark-background .dark-background .site_title.content-formatted h2,
.scroll.dark-background .dark-background .site_title.content-formatted h3,
.scroll.dark-background .dark-background .site_title.content-formatted h4,
.scroll.dark-background .dark-background .site_title.content-formatted h5,
.scroll.dark-background .dark-background .site_title.content-formatted h6,
.scroll.dark-background .dark-background .header_title.content-formatted a,
.scroll.dark-background .dark-background .header_title.content-formatted p,
.scroll.dark-background .dark-background .header_title.content-formatted h1,
.scroll.dark-background .dark-background .header_title.content-formatted h2,
.scroll.dark-background .dark-background .header_title.content-formatted h3,
.scroll.dark-background .dark-background .header_title.content-formatted h4,
.scroll.dark-background .dark-background .header_title.content-formatted h5,
.scroll.dark-background .dark-background .header_title.content-formatted h6,
.scroll.light-background .dark-background .site_title.content-formatted a,
.scroll.light-background .dark-background .site_title.content-formatted p,
.scroll.light-background .dark-background .site_title.content-formatted h1,
.scroll.light-background .dark-background .site_title.content-formatted h2,
.scroll.light-background .dark-background .site_title.content-formatted h3,
.scroll.light-background .dark-background .site_title.content-formatted h4,
.scroll.light-background .dark-background .site_title.content-formatted h5,
.scroll.light-background .dark-background .site_title.content-formatted h6,
.scroll.light-background .dark-background .header_title.content-formatted a,
.scroll.light-background .dark-background .header_title.content-formatted p,
.scroll.light-background .dark-background .header_title.content-formatted h1,
.scroll.light-background .dark-background .header_title.content-formatted h2,
.scroll.light-background .dark-background .header_title.content-formatted h3,
.scroll.light-background .dark-background .header_title.content-formatted h4,
.scroll.light-background .dark-background .header_title.content-formatted h5,
.scroll.light-background .dark-background .header_title.content-formatted h6,
* .site_title.content-formatted a,
* .site_title.content-formatted p,
* .site_title.content-formatted h1,
* .site_title.content-formatted h2,
* .site_title.content-formatted h3,
* .site_title.content-formatted h4,
* .site_title.content-formatted h5,
* .site_title.content-formatted h6,
* .header_title.content-formatted a,
* .header_title.content-formatted p,
* .header_title.content-formatted h1,
* .header_title.content-formatted h2,
* .header_title.content-formatted h3,
* .header_title.content-formatted h4,
* .header_title.content-formatted h5,
* .header_title.content-formatted h6 {
  color: var(--header-mainmenu-color);
}

.light-background .search-btn svg path,
.light-background .cart_btn svg g,
.light-background .cart_btn svg path,
.light-background .menu_popover-btn svg path,
.light-background .light-background .search-btn svg path,
.light-background .light-background .cart_btn svg g,
.light-background .light-background .cart_btn svg path,
.light-background .light-background .menu_popover-btn svg path,
.dark-background .light-background .search-btn svg path,
.dark-background .light-background .cart_btn svg g,
.dark-background .light-background .cart_btn svg path,
.dark-background .light-background .menu_popover-btn svg path,
.scroll.dark-background .dark-background .search-btn svg path,
.scroll.dark-background .dark-background .cart_btn svg g,
.scroll.dark-background .dark-background .cart_btn svg path,
.scroll.dark-background .dark-background .menu_popover-btn svg path,
.scroll.light-background .dark-background .search-btn svg path,
.scroll.light-background .dark-background .cart_btn svg g,
.scroll.light-background .dark-background .cart_btn svg path,
.scroll.light-background .dark-background .menu_popover-btn svg path,
* .search-btn svg path,
* .cart_btn svg g,
* .cart_btn svg path,
* .menu_popover-btn svg path {
  fill: var(--header-mainmenu-active-color);
}

.light-background .search-btn:hover svg path,
.light-background .cart_btn:hover svg g,
.light-background .cart_btn:hover svg path,
.light-background .menu_popover-btn:hover svg path,
.light-background .light-background .search-btn:hover svg path,
.light-background .light-background .cart_btn:hover svg g,
.light-background .light-background .cart_btn:hover svg path,
.light-background .light-background .menu_popover-btn:hover svg path,
.dark-background .light-background .search-btn:hover svg path,
.dark-background .light-background .cart_btn:hover svg g,
.dark-background .light-background .cart_btn:hover svg path,
.dark-background .light-background .menu_popover-btn:hover svg path,
.scroll.dark-background .dark-background .search-btn:hover svg path,
.scroll.dark-background .dark-background .cart_btn:hover svg g,
.scroll.dark-background .dark-background .cart_btn:hover svg path,
.scroll.dark-background .dark-background .menu_popover-btn:hover svg path,
.scroll.light-background .dark-background .search-btn:hover svg path,
.scroll.light-background .dark-background .cart_btn:hover svg g,
.scroll.light-background .dark-background .cart_btn:hover svg path,
.scroll.light-background .dark-background .menu_popover-btn:hover svg path,
* .search-btn:hover svg path,
* .cart_btn:hover svg g,
* .cart_btn:hover svg path,
* .menu_popover-btn:hover svg path {
  fill: var(--header-mainmenu-hover-color);
}

.light-background .menu-btn,
.light-background .light-background .menu-btn,
.dark-background .light-background .menu-btn,
.scroll.dark-background .dark-background .menu-btn,
.scroll.light-background .dark-background .menu-btn,
* .menu-btn {
  color: var(--header-mainmenu-active-color);
}

.light-background .menu-btn .menu-stripe,
.light-background .light-background .menu-btn .menu-stripe,
.dark-background .light-background .menu-btn .menu-stripe,
.scroll.dark-background .dark-background .menu-btn .menu-stripe,
.scroll.light-background .dark-background .menu-btn .menu-stripe,
* .menu-btn .menu-stripe {
  background-color: var(--header-mainmenu-active-color);
}

.light-background .menu-btn:hover,
.light-background .light-background .menu-btn:hover,
.dark-background .light-background .menu-btn:hover,
.scroll.dark-background .dark-background .menu-btn:hover,
.scroll.light-background .dark-background .menu-btn:hover,
* .menu-btn:hover {
  color: var(--header-mainmenu-color);
}

.light-background .menu-btn:hover .menu-stripe,
.light-background .light-background .menu-btn:hover .menu-stripe,
.dark-background .light-background .menu-btn:hover .menu-stripe,
.scroll.dark-background .dark-background .menu-btn:hover .menu-stripe,
.scroll.light-background .dark-background .menu-btn:hover .menu-stripe,
* .menu-btn:hover .menu-stripe {
  background-color: var(--header-mainmenu-color);
}

.light-background .menu-language-btn,
.light-background .menu-language-name,
.light-background .cart_btn .cart_btn-count,
.light-background .light-background .menu-language-btn,
.light-background .light-background .menu-language-name,
.light-background .light-background .cart_btn .cart_btn-count,
.dark-background .light-background .menu-language-btn,
.dark-background .light-background .menu-language-name,
.dark-background .light-background .cart_btn .cart_btn-count,
.scroll.dark-background .dark-background .menu-language-btn,
.scroll.dark-background .dark-background .menu-language-name,
.scroll.dark-background .dark-background .cart_btn .cart_btn-count,
.scroll.light-background .dark-background .menu-language-btn,
.scroll.light-background .dark-background .menu-language-name,
.scroll.light-background .dark-background .cart_btn .cart_btn-count,
* .menu-language-btn,
* .menu-language-name,
* .cart_btn .cart_btn-count {
  color: var(--header-mainmenu-active-color);
}

.light-background .menu-language-btn svg path,
.light-background .menu-language-name svg path,
.light-background .cart_btn .cart_btn-count svg path,
.light-background .light-background .menu-language-btn svg path,
.light-background .light-background .menu-language-name svg path,
.light-background .light-background .cart_btn .cart_btn-count svg path,
.dark-background .light-background .menu-language-btn svg path,
.dark-background .light-background .menu-language-name svg path,
.dark-background .light-background .cart_btn .cart_btn-count svg path,
.scroll.dark-background .dark-background .menu-language-btn svg path,
.scroll.dark-background .dark-background .menu-language-name svg path,
.scroll.dark-background .dark-background .cart_btn .cart_btn-count svg path,
.scroll.light-background .dark-background .menu-language-btn svg path,
.scroll.light-background .dark-background .menu-language-name svg path,
.scroll.light-background .dark-background .cart_btn .cart_btn-count svg path,
* .menu-language-btn svg path,
* .menu-language-name svg path,
* .cart_btn .cart_btn-count svg path {
  stroke: var(--header-mainmenu-active-color);
}

.light-background .menu-language-btn:hover,
.light-background .menu-language-name:hover,
.light-background .cart_btn .cart_btn-count:hover,
.light-background .light-background .menu-language-btn:hover,
.light-background .light-background .menu-language-name:hover,
.light-background .light-background .cart_btn .cart_btn-count:hover,
.dark-background .light-background .menu-language-btn:hover,
.dark-background .light-background .menu-language-name:hover,
.dark-background .light-background .cart_btn .cart_btn-count:hover,
.scroll.dark-background .dark-background .menu-language-btn:hover,
.scroll.dark-background .dark-background .menu-language-name:hover,
.scroll.dark-background .dark-background .cart_btn .cart_btn-count:hover,
.scroll.light-background .dark-background .menu-language-btn:hover,
.scroll.light-background .dark-background .menu-language-name:hover,
.scroll.light-background .dark-background .cart_btn .cart_btn-count:hover,
* .menu-language-btn:hover,
* .menu-language-name:hover,
* .cart_btn .cart_btn-count:hover {
  color: var(--header-mainmenu-color);
}

.light-background .menu-language-btn:hover svg path,
.light-background .menu-language-name:hover svg path,
.light-background .cart_btn .cart_btn-count:hover svg path,
.light-background .light-background .menu-language-btn:hover svg path,
.light-background .light-background .menu-language-name:hover svg path,
.light-background .light-background .cart_btn .cart_btn-count:hover svg path,
.dark-background .light-background .menu-language-btn:hover svg path,
.dark-background .light-background .menu-language-name:hover svg path,
.dark-background .light-background .cart_btn .cart_btn-count:hover svg path,
.scroll.dark-background .dark-background .menu-language-btn:hover svg path,
.scroll.dark-background .dark-background .menu-language-name:hover svg path,
.scroll.dark-background .dark-background .cart_btn .cart_btn-count:hover svg path,
.scroll.light-background .dark-background .menu-language-btn:hover svg path,
.scroll.light-background .dark-background .menu-language-name:hover svg path,
.scroll.light-background .dark-background .cart_btn .cart_btn-count:hover svg path,
* .menu-language-btn:hover svg path,
* .menu-language-name:hover svg path,
* .cart_btn .cart_btn-count:hover svg path {
  stroke: var(--header-mainmenu-color);
}

.light-background .menu-main .menu .menu-item a,
.light-background .light-background .menu-main .menu .menu-item a,
.dark-background .light-background .menu-main .menu .menu-item a,
.scroll.dark-background .dark-background .menu-main .menu .menu-item a,
.scroll.light-background .dark-background .menu-main .menu .menu-item a,
* .menu-main .menu .menu-item a {
  color: var(--header-mainmenu-color);
}

.light-background .menu-main .menu .menu-item a::before,
.light-background .light-background .menu-main .menu .menu-item a::before,
.dark-background .light-background .menu-main .menu .menu-item a::before,
.scroll.dark-background .dark-background .menu-main .menu .menu-item a::before,
.scroll.light-background .dark-background .menu-main .menu .menu-item a::before,
* .menu-main .menu .menu-item a::before {
  background-color: var(--header-mainmenu-color);
}

.light-background .menu-main .menu .menu-item a:hover,
.light-background .light-background .menu-main .menu .menu-item a:hover,
.dark-background .light-background .menu-main .menu .menu-item a:hover,
.scroll.dark-background .dark-background .menu-main .menu .menu-item a:hover,
.scroll.light-background .dark-background .menu-main .menu .menu-item a:hover,
* .menu-main .menu .menu-item a:hover {
  color: var(--header-mainmenu-hover-color);
}

.light-background .menu-main .menu .menu-item a.selected,
.light-background .light-background .menu-main .menu .menu-item a.selected,
.dark-background .light-background .menu-main .menu .menu-item a.selected,
.scroll.dark-background .dark-background .menu-main .menu .menu-item a.selected,
.scroll.light-background .dark-background .menu-main .menu .menu-item a.selected,
* .menu-main .menu .menu-item a.selected {
  color: var(--header-mainmenu-active-color);
  opacity: 1;
}

.light-background .menu-main .menu .menu-item a.selected::before,
.light-background .light-background .menu-main .menu .menu-item a.selected::before,
.dark-background .light-background .menu-main .menu .menu-item a.selected::before,
.scroll.dark-background .dark-background .menu-main .menu .menu-item a.selected::before,
.scroll.light-background .dark-background .menu-main .menu .menu-item a.selected::before,
* .menu-main .menu .menu-item a.selected::before {
  background-color: var(--header-mainmenu-active-color);
  opacity: 1;
}

.light-background .menu-main .menu .menu-item a.selected:hover,
.light-background .light-background .menu-main .menu .menu-item a.selected:hover,
.dark-background .light-background .menu-main .menu .menu-item a.selected:hover,
.scroll.dark-background .dark-background .menu-main .menu .menu-item a.selected:hover,
.scroll.light-background .dark-background .menu-main .menu .menu-item a.selected:hover,
* .menu-main .menu .menu-item a.selected:hover {
  color: var(--header-mainmenu-hover-color);
}

.light-background .menu-main .menu .menu-item a.selected:hover::before,
.light-background .light-background .menu-main .menu .menu-item a.selected:hover::before,
.dark-background .light-background .menu-main .menu .menu-item a.selected:hover::before,
.scroll.dark-background .dark-background .menu-main .menu .menu-item a.selected:hover::before,
.scroll.light-background .dark-background .menu-main .menu .menu-item a.selected:hover::before,
* .menu-main .menu .menu-item a.selected:hover::before {
  background-color: var(--header-mainmenu-hover-color);
}

.light-background .menu-main .menu .menu-sub .menu-item a,
.light-background .light-background .menu-main .menu .menu-sub .menu-item a,
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a,
.scroll.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a,
.scroll.light-background .dark-background .menu-main .menu .menu-sub .menu-item a,
* .menu-main .menu .menu-sub .menu-item a {
  color: var(--menu-sub-color);
}

.light-background .menu-main .menu .menu-sub .menu-item a::after,
.light-background .light-background .menu-main .menu .menu-sub .menu-item a::after,
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a::after,
.scroll.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a::after,
.scroll.light-background .dark-background .menu-main .menu .menu-sub .menu-item a::after,
* .menu-main .menu .menu-sub .menu-item a::after {
  background-color: var(--menu-sub-color);
}

.light-background .menu-main .menu .menu-sub .menu-item a.active,
.light-background .light-background .menu-main .menu .menu-sub .menu-item a.active,
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a.active,
.scroll.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a.active,
.scroll.light-background .dark-background .menu-main .menu .menu-sub .menu-item a.active,
* .menu-main .menu .menu-sub .menu-item a.active {
  color: var(--menu-sub-hover-color);
}

.light-background .menu-main .menu .menu-sub .menu-item a.active::before,
.light-background .light-background .menu-main .menu .menu-sub .menu-item a.active::before,
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a.active::before,
.scroll.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a.active::before,
.scroll.light-background .dark-background .menu-main .menu .menu-sub .menu-item a.active::before,
* .menu-main .menu .menu-sub .menu-item a.active::before {
  border-color: var(--menu-sub-active-color);
}

.light-background .menu-main .menu .menu-sub .menu-item a.active:hover,
.light-background .light-background .menu-main .menu .menu-sub .menu-item a.active:hover,
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a.active:hover,
.scroll.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a.active:hover,
.scroll.light-background .dark-background .menu-main .menu .menu-sub .menu-item a.active:hover,
* .menu-main .menu .menu-sub .menu-item a.active:hover {
  color: var(--menu-sub-color);
}

.light-background .menu-main .menu .menu-sub .menu-item a.active:hover svg,
.light-background .menu-main .menu .menu-sub .menu-item a.active:hover path,
.light-background .light-background .menu-main .menu .menu-sub .menu-item a.active:hover svg,
.light-background .light-background .menu-main .menu .menu-sub .menu-item a.active:hover path,
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a.active:hover svg,
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a.active:hover path,
.scroll.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a.active:hover svg,
.scroll.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a.active:hover path,
.scroll.light-background .dark-background .menu-main .menu .menu-sub .menu-item a.active:hover svg,
.scroll.light-background .dark-background .menu-main .menu .menu-sub .menu-item a.active:hover path,
* .menu-main .menu .menu-sub .menu-item a.active:hover svg,
* .menu-main .menu .menu-sub .menu-item a.active:hover path {
  fill: var(--menu-sub-color);
}

.light-background .menu-main .menu .menu-sub .menu-item a:hover,
.light-background .light-background .menu-main .menu .menu-sub .menu-item a:hover,
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a:hover,
.scroll.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a:hover,
.scroll.light-background .dark-background .menu-main .menu .menu-sub .menu-item a:hover,
* .menu-main .menu .menu-sub .menu-item a:hover {
  color: var(--menu-sub-hover-color);
}

.light-background .menu-main .menu .menu-sub .menu-item a:hover::before,
.light-background .light-background .menu-main .menu .menu-sub .menu-item a:hover::before,
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a:hover::before,
.scroll.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a:hover::before,
.scroll.light-background .dark-background .menu-main .menu .menu-sub .menu-item a:hover::before,
* .menu-main .menu .menu-sub .menu-item a:hover::before {
  border-color: var(--menu-sub-hover-color);
}

.light-background .menu-main .menu .menu-sub .menu-item a::before,
.light-background .light-background .menu-main .menu .menu-sub .menu-item a::before,
.dark-background .light-background .menu-main .menu .menu-sub .menu-item a::before,
.scroll.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a::before,
.scroll.light-background .dark-background .menu-main .menu .menu-sub .menu-item a::before,
* .menu-main .menu .menu-sub .menu-item a::before {
  border-color: var(--menu-sub-hover-color);
}

.dark-background .dark-background .swiper-container .swiper-button-next:after,
.dark-background .dark-background .swiper-container .swiper-button-prev:after,
.light-background .dark-background .swiper-container .swiper-button-next:after,
.light-background .dark-background .swiper-container .swiper-button-prev:after,
.dark-background .swiper-container .swiper-button-next:after,
.dark-background .swiper-container .swiper-button-prev:after {
  color: var(--third-color);
}

.dark-background .dark-background .swiper-container .swiper-pagination-bullet,
.light-background .dark-background .swiper-container .swiper-pagination-bullet,
.dark-background .swiper-container .swiper-pagination-bullet {
  background-color: var(--third-color);
}

.dark-background .dark-background .site_title.content-formatted,
.dark-background .dark-background .header_title.content-formatted,
.light-background .dark-background .site_title.content-formatted,
.light-background .dark-background .header_title.content-formatted,
.dark-background .site_title.content-formatted,
.dark-background .header_title.content-formatted {
  color: var(--third-color);
}

.dark-background .dark-background .site_title.content-formatted a, .dark-background .dark-background .site_title.content-formatted p, .dark-background .dark-background .site_title.content-formatted h1, .dark-background .dark-background .site_title.content-formatted h2, .dark-background .dark-background .site_title.content-formatted h3, .dark-background .dark-background .site_title.content-formatted h4, .dark-background .dark-background .site_title.content-formatted h5, .dark-background .dark-background .site_title.content-formatted h6,
.dark-background .dark-background .header_title.content-formatted a,
.dark-background .dark-background .header_title.content-formatted p,
.dark-background .dark-background .header_title.content-formatted h1,
.dark-background .dark-background .header_title.content-formatted h2,
.dark-background .dark-background .header_title.content-formatted h3,
.dark-background .dark-background .header_title.content-formatted h4,
.dark-background .dark-background .header_title.content-formatted h5,
.dark-background .dark-background .header_title.content-formatted h6,
.light-background .dark-background .site_title.content-formatted a,
.light-background .dark-background .site_title.content-formatted p,
.light-background .dark-background .site_title.content-formatted h1,
.light-background .dark-background .site_title.content-formatted h2,
.light-background .dark-background .site_title.content-formatted h3,
.light-background .dark-background .site_title.content-formatted h4,
.light-background .dark-background .site_title.content-formatted h5,
.light-background .dark-background .site_title.content-formatted h6,
.light-background .dark-background .header_title.content-formatted a,
.light-background .dark-background .header_title.content-formatted p,
.light-background .dark-background .header_title.content-formatted h1,
.light-background .dark-background .header_title.content-formatted h2,
.light-background .dark-background .header_title.content-formatted h3,
.light-background .dark-background .header_title.content-formatted h4,
.light-background .dark-background .header_title.content-formatted h5,
.light-background .dark-background .header_title.content-formatted h6,
.dark-background .site_title.content-formatted a,
.dark-background .site_title.content-formatted p,
.dark-background .site_title.content-formatted h1,
.dark-background .site_title.content-formatted h2,
.dark-background .site_title.content-formatted h3,
.dark-background .site_title.content-formatted h4,
.dark-background .site_title.content-formatted h5,
.dark-background .site_title.content-formatted h6,
.dark-background .header_title.content-formatted a,
.dark-background .header_title.content-formatted p,
.dark-background .header_title.content-formatted h1,
.dark-background .header_title.content-formatted h2,
.dark-background .header_title.content-formatted h3,
.dark-background .header_title.content-formatted h4,
.dark-background .header_title.content-formatted h5,
.dark-background .header_title.content-formatted h6 {
  color: var(--third-color);
}

.dark-background .dark-background .search-btn svg path,
.dark-background .dark-background .cart_btn svg g,
.dark-background .dark-background .cart_btn svg path,
.dark-background .dark-background .menu_popover-btn svg path,
.light-background .dark-background .search-btn svg path,
.light-background .dark-background .cart_btn svg g,
.light-background .dark-background .cart_btn svg path,
.light-background .dark-background .menu_popover-btn svg path,
.dark-background .search-btn svg path,
.dark-background .cart_btn svg g,
.dark-background .cart_btn svg path,
.dark-background .menu_popover-btn svg path {
  fill: var(--third-color);
}

.dark-background .dark-background .search-btn:hover svg path,
.dark-background .dark-background .cart_btn:hover svg g,
.dark-background .dark-background .cart_btn:hover svg path,
.dark-background .dark-background .menu_popover-btn:hover svg path,
.light-background .dark-background .search-btn:hover svg path,
.light-background .dark-background .cart_btn:hover svg g,
.light-background .dark-background .cart_btn:hover svg path,
.light-background .dark-background .menu_popover-btn:hover svg path,
.dark-background .search-btn:hover svg path,
.dark-background .cart_btn:hover svg g,
.dark-background .cart_btn:hover svg path,
.dark-background .menu_popover-btn:hover svg path {
  opacity: .7;
}

.dark-background .dark-background .menu-btn,
.light-background .dark-background .menu-btn,
.dark-background .menu-btn {
  color: var(--third-color);
}

.dark-background .dark-background .menu-btn .menu-stripe,
.light-background .dark-background .menu-btn .menu-stripe,
.dark-background .menu-btn .menu-stripe {
  background-color: var(--third-color);
}

.dark-background .dark-background .menu-btn:hover,
.light-background .dark-background .menu-btn:hover,
.dark-background .menu-btn:hover {
  opacity: .7;
}

.dark-background .dark-background .menu-language-btn,
.dark-background .dark-background .menu-language-name,
.dark-background .dark-background .cart_btn .cart_btn-count,
.light-background .dark-background .menu-language-btn,
.light-background .dark-background .menu-language-name,
.light-background .dark-background .cart_btn .cart_btn-count,
.dark-background .menu-language-btn,
.dark-background .menu-language-name,
.dark-background .cart_btn .cart_btn-count {
  color: var(--third-color);
}

.dark-background .dark-background .menu-language-btn svg path,
.dark-background .dark-background .menu-language-name svg path,
.dark-background .dark-background .cart_btn .cart_btn-count svg path,
.light-background .dark-background .menu-language-btn svg path,
.light-background .dark-background .menu-language-name svg path,
.light-background .dark-background .cart_btn .cart_btn-count svg path,
.dark-background .menu-language-btn svg path,
.dark-background .menu-language-name svg path,
.dark-background .cart_btn .cart_btn-count svg path {
  stroke: var(--third-color);
}

.dark-background .dark-background .menu-language-btn:hover,
.dark-background .dark-background .menu-language-name:hover,
.dark-background .dark-background .cart_btn .cart_btn-count:hover,
.light-background .dark-background .menu-language-btn:hover,
.light-background .dark-background .menu-language-name:hover,
.light-background .dark-background .cart_btn .cart_btn-count:hover,
.dark-background .menu-language-btn:hover,
.dark-background .menu-language-name:hover,
.dark-background .cart_btn .cart_btn-count:hover {
  opacity: .7;
}

.dark-background .dark-background .menu-main .menu .menu-item a,
.light-background .dark-background .menu-main .menu .menu-item a,
.dark-background .menu-main .menu .menu-item a {
  color: var(--third-color);
}

.dark-background .dark-background .menu-main .menu .menu-item a::before,
.light-background .dark-background .menu-main .menu .menu-item a::before,
.dark-background .menu-main .menu .menu-item a::before {
  background-color: var(--third-color);
}

.dark-background .dark-background .menu-main .menu .menu-item a:hover,
.light-background .dark-background .menu-main .menu .menu-item a:hover,
.dark-background .menu-main .menu .menu-item a:hover {
  opacity: .7;
}

.dark-background .dark-background .menu-main .menu .menu-item a.selected,
.light-background .dark-background .menu-main .menu .menu-item a.selected,
.dark-background .menu-main .menu .menu-item a.selected {
  color: var(--third-color);
}

.dark-background .dark-background .menu-main .menu .menu-item a.selected::before,
.light-background .dark-background .menu-main .menu .menu-item a.selected::before,
.dark-background .menu-main .menu .menu-item a.selected::before {
  background-color: var(--third-color);
}

.dark-background .dark-background .menu-main .menu .menu-item a.selected:hover,
.light-background .dark-background .menu-main .menu .menu-item a.selected:hover,
.dark-background .menu-main .menu .menu-item a.selected:hover {
  opacity: .7;
}

.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a,
.light-background .dark-background .menu-main .menu .menu-sub .menu-item a,
.dark-background .menu-main .menu .menu-sub .menu-item a {
  color: var(--third-color);
}

.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a::after,
.light-background .dark-background .menu-main .menu .menu-sub .menu-item a::after,
.dark-background .menu-main .menu .menu-sub .menu-item a::after {
  background-color: var(--third-color);
}

.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a.active,
.light-background .dark-background .menu-main .menu .menu-sub .menu-item a.active,
.dark-background .menu-main .menu .menu-sub .menu-item a.active {
  color: var(--third-color);
}

.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a.active::before,
.light-background .dark-background .menu-main .menu .menu-sub .menu-item a.active::before,
.dark-background .menu-main .menu .menu-sub .menu-item a.active::before {
  border-color: var(--menu-sub-active-color);
}

.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a.active:hover,
.light-background .dark-background .menu-main .menu .menu-sub .menu-item a.active:hover,
.dark-background .menu-main .menu .menu-sub .menu-item a.active:hover {
  opacity: .7;
}

.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a:hover,
.light-background .dark-background .menu-main .menu .menu-sub .menu-item a:hover,
.dark-background .menu-main .menu .menu-sub .menu-item a:hover {
  opacity: .7;
}

.dark-background .dark-background .menu-main .menu .menu-sub .menu-item a::before,
.light-background .dark-background .menu-main .menu .menu-sub .menu-item a::before,
.dark-background .menu-main .menu .menu-sub .menu-item a::before {
  border-color: var(--third-color);
}
