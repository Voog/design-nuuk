body {
  font-family: var(--main-font-family);
  color: var(--primary-color);
  background-color: var(--body-background-color);
}

body h1, body h2, body h3, body h4, body h5, body h6 {
  font-family: var(--headings-font-family);
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

.menu-btn {
  color: var(--header-mainmenu-active-color);
}

:not(.scroll).dark-background .menu-btn {
  color: var(--third-color);
}

.menu-btn .menu-stripe {
  background-color: var(--header-mainmenu-active-color);
}

:not(.scroll).dark-background .menu-btn .menu-stripe {
  background-color: var(--third-color);
}

.menu-btn:hover {
  color: var(--header-mainmenu-active-color);
}

@media screen and (min-width: 900px) {
  .header_fixed:not(.scroll).dark-background .menu-btn:hover {
    color: var(--third-color);
    opacity: .7;
  }
}

.menu-btn:hover .menu-stripe {
  background-color: var(--header-mainmenu-color);
}

@media screen and (min-width: 900px) {
  .header_fixed:not(.scroll).dark-background .menu-btn:hover .menu-stripe {
    background-color: var(--third-color);
  }
}

.scroll.dark-background .menu-main .menu .menu-item,
.scroll.dark-background .content-formatted.header_title {
  color: var(--header-mainmenu-color);
}

.scroll.dark-background .menu-main .menu .menu-item a, .scroll.dark-background .menu-main .menu .menu-item p, .scroll.dark-background .menu-main .menu .menu-item h1, .scroll.dark-background .menu-main .menu .menu-item h2, .scroll.dark-background .menu-main .menu .menu-item h3, .scroll.dark-background .menu-main .menu .menu-item h4, .scroll.dark-background .menu-main .menu .menu-item h5, .scroll.dark-background .menu-main .menu .menu-item h6,
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

.scroll.dark-background .menu-main .menu .menu-item.active a,
.scroll.dark-background .menu-main .menu .menu-item a.selected,
.scroll.dark-background .content-formatted.header_title.active a,
.scroll.dark-background .content-formatted.header_title a.selected {
  color: var(--header-mainmenu-active-color);
}

.scroll.dark-background .menu-main .menu .menu-item a:hover,
.scroll.dark-background .content-formatted.header_title a:hover {
  color: var(--header-mainmenu-color);
  opacity: .7;
}

.scroll.dark-background .menu-main .menu_popover .menu .menu-item {
  color: var(--third-color);
}

.scroll.dark-background .menu-main .menu_popover .menu .menu-item a, .scroll.dark-background .menu-main .menu_popover .menu .menu-item p, .scroll.dark-background .menu-main .menu_popover .menu .menu-item h1, .scroll.dark-background .menu-main .menu_popover .menu .menu-item h2, .scroll.dark-background .menu-main .menu_popover .menu .menu-item h3, .scroll.dark-background .menu-main .menu_popover .menu .menu-item h4, .scroll.dark-background .menu-main .menu_popover .menu .menu-item h5, .scroll.dark-background .menu-main .menu_popover .menu .menu-item h6 {
  color: var(--third-color);
}

.scroll.dark-background .menu-main .menu_popover .menu .menu-item a:hover,
.scroll.dark-background .menu-main .menu_popover .menu .menu-item.active a {
  color: var(--third-color);
}

.search-btn svg path,
.search-btn svg g,
.cart_btn svg path,
.cart_btn svg g {
  fill: var(--header-mainmenu-active-color);
}

.header_fixed:not(.scroll).dark-background .search-btn svg path, .header_fixed:not(.scroll).dark-background
.search-btn svg g, .header_fixed:not(.scroll).dark-background
.cart_btn svg path, .header_fixed:not(.scroll).dark-background
.cart_btn svg g {
  fill: var(--third-color);
}

.search-btn:hover svg path,
.search-btn:hover svg g,
.cart_btn:hover svg path,
.cart_btn:hover svg g {
  fill: var(--header-mainmenu-color);
}

.header_fixed:not(.scroll).dark-background .search-btn:hover svg path, .header_fixed:not(.scroll).dark-background
.search-btn:hover svg g, .header_fixed:not(.scroll).dark-background
.cart_btn:hover svg path, .header_fixed:not(.scroll).dark-background
.cart_btn:hover svg g {
  opacity: .7;
  fill: var(--third-color);
}

.cart_btn .cart_btn-count {
  color: var(--header-mainmenu-active-color);
}

:not(.scroll).dark-background .cart_btn .cart_btn-count {
  color: var(--third-color);
}

.cart_btn:hover svg path,
.cart_btn:hover svg g {
  color: var(--header-mainmenu-color);
  opacity: .7;
}

.menu_popover-btn svg path {
  fill: var(--header-mainmenu-color);
}

@media screen and (min-width: 900px) {
  .header_fixed:not(.scroll).dark-background .menu_popover-btn svg path {
    fill: var(--third-color);
  }
}

.menu_popover-btn:hover svg path {
  fill: var(--header-mainmenu-hover-color);
}

@media screen and (min-width: 900px) {
  .header_fixed:not(.scroll).dark-background .menu_popover-btn:hover svg path {
    opacity: .7;
    fill: var(--third-color);
  }
}

.menu-language-btn,
.menu-language-name {
  color: var(--header-mainmenu-active-color);
}

.menu-language-btn svg path,
.menu-language-name svg path {
  stroke: var(--header-mainmenu-act ive-color);
}

@media screen and (min-width: 900px) {
  .header_fixed:not(.scroll).dark-background .menu-language-btn svg path, .header_fixed:not(.scroll).dark-background
  .menu-language-name svg path {
    stroke: var(--third-color);
  }
}

@media screen and (min-width: 900px) {
  .header_fixed:not(.scroll).dark-background .menu-language-btn, .header_fixed:not(.scroll).dark-background
  .menu-language-name {
    color: var(--third-color);
  }
}

.menu-language-btn:hover,
.menu-language-name:hover {
  color: var(--header-mainmenu-color);
}

.menu-language-btn:hover svg path,
.menu-language-name:hover svg path {
  stroke: var(--header-mainmenu-color);
}

@media screen and (min-width: 900px) {
  .header_fixed:not(.scroll).dark-background .menu-language-btn:hover svg path, .header_fixed:not(.scroll).dark-background
  .menu-language-name:hover svg path {
    opacity: .7;
    stroke: var(--third-color);
  }
}

@media screen and (min-width: 900px) {
  .header_fixed:not(.scroll).dark-background .menu-language-btn:hover, .header_fixed:not(.scroll).dark-background
  .menu-language-name:hover {
    opacity: .7;
    color: var(--third-color);
  }
}

.edy-ecommerce-product-count {
  color: var(--header-mainmenu-active-color);
}

@media screen and (min-width: 900px) {
  .header_fixed:not(.scroll).dark-background .edy-ecommerce-product-count {
    color: var(--third-color);
  }
}

.menu-main .menu .menu-item .dropdown_menu-popover--wrap .dropdown_menu-popover {
  background-color: var(--menu-dropdown-background-color);
}

.menu-main .menu .menu-item .dropdown_menu-popover--wrap .dropdown_menu-popover a {
  color: var(--menu-dropdown-text-color);
}

.menu-main .menu .menu-item .dropdown_menu-popover--wrap .dropdown_menu-popover a:hover {
  color: var(--menu-dropdown-hover-text-color);
}

.menu-main .menu .menu-item .dropdown_menu-popover--wrap .dropdown_menu-popover .menu .menu-item:hover {
  background-color: var(--menu-dropdown-hover-background-color);
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

.dark-background .menu-main .menu .menu-item a.selected::before {
  background-color: var(--third-color);
  opacity: .7;
}

.dark-background .menu-main .menu .menu-item a.selected {
  color: var(--third-color);
  opacity: .7;
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

.dark-background .menu-main .menu .menu-item a.selected:hover {
  color: var(--third-color);
  opacity: 1;
}

.menu-main .menu .menu_popover-list {
  background-color: var(--menu-dropdown-background-color);
}

.menu-main .menu .menu_popover .menu .menu-item:hover {
  background-color: var(--menu-dropdown-hover-background-color);
}

.menu-main .menu .menu_popover .menu .menu-item .dropdown_menu-popover {
  background-color: var(--menu-dropdown-background-color);
}

.header_fixed .menu-main .menu .menu_popover .menu .menu-item a {
  color: var(--menu-dropdown-text-color);
}

.header_fixed .menu-main .menu .menu_popover .menu .menu-item a:hover {
  color: var(--menu-dropdown-hover-text-color);
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

.dark-background .menu-main .menu .menu-sub .menu-item a {
  color: var(--third-color);
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

.dark-background .menu-main .menu .menu-sub .menu-item a:hover {
  color: var(--third-color);
}

.menu-main .menu .menu-sub .menu-item a:hover::before {
  border-color: var(--menu-sub-hover-color);
}

.dark-background .menu-main .menu .menu-sub .menu-item a:hover::before {
  border-color: var(--third-color);
}

.menu-main .menu .menu-sub .menu-item a::before {
  border-color: var(--menu-sub-hover-color);
}

.dark-background .menu-main .menu .menu-sub .menu-item a::before {
  border-color: var(--third-color);
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

.dark-background .menu-main .menu .menu-sub .menu-item.active a {
  color: var(--third-color);
}

.menu-main .menu .menu-sub .menu-item.active a::before {
  border-color: var(--menu-sub-active-color);
}

.dark-background .menu-main .menu .menu-sub .menu-item.active a::before {
  border-color: var(--third-color);
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

.dark-background .menu-main .menu .menu-sub .menu-item.active a:hover svg, .dark-background
.menu-main .menu .menu-sub .menu-item.active a:hover path {
  fill: var(--third-color);
}

.header_fixed:not(.relative) .menu-main .menu .menu-item,
.header_fixed:not(.relative) .menu-language-btn {
  color: var(--header-mainmenu-color);
}

.header_fixed:not(.relative) .menu-main .menu .menu-item a,
.header_fixed:not(.relative) .menu-language-btn a {
  color: var(--header-mainmenu-color);
}

.header_fixed:not(.relative) .menu-main .menu .menu-item a.untranslated,
.header_fixed:not(.relative) .menu-language-btn a.untranslated {
  color: #C5292A;
}

.header_fixed:not(.relative) .menu-main .menu .menu-item .dropdown_menu-popover--wrap .dropdown_menu-popover a,
.header_fixed:not(.relative) .menu-language-btn .dropdown_menu-popover--wrap .dropdown_menu-popover a {
  color: var(--menu-dropdown-text-color);
}

.header_fixed:not(.relative) .menu-main .menu .menu-item .dropdown_menu-popover--wrap .dropdown_menu-popover a:hover,
.header_fixed:not(.relative) .menu-language-btn .dropdown_menu-popover--wrap .dropdown_menu-popover a:hover {
  color: var(--menu-dropdown-hover-text-color);
}

.header_fixed:not(.relative) .menu-main .menu .menu-item.active a,
.header_fixed:not(.relative) .menu-main .menu .menu-item a.selected,
.header_fixed:not(.relative) .menu-language-btn.active a,
.header_fixed:not(.relative) .menu-language-btn a.selected {
  color: var(--header-mainmenu-active-color);
}

.header_fixed:not(.relative) .menu-main .menu .menu-item.active a:hover,
.header_fixed:not(.relative) .menu-main .menu .menu-item a.selected:hover,
.header_fixed:not(.relative) .menu-language-btn.active a:hover,
.header_fixed:not(.relative) .menu-language-btn a.selected:hover {
  color: var(--header-mainmenu-hover-color);
}

.header_fixed:not(.relative) .menu-main .menu .menu-item a:hover,
.header_fixed:not(.relative) .menu-language-btn a:hover {
  color: var(--header-mainmenu-hover-color);
}

.header_fixed:not(.relative) .menu-btn .menu-stripe {
  background-color: var(--header-mainmenu-active-color);
}

.header_fixed:not(.relative) .header_fixed-content .header_title.content-formatted:not(.product_filters) {
  color: var(--header-site-title-color);
}

.header_fixed:not(.relative) .header_fixed-content .header_title.content-formatted:not(.product_filters) a, .header_fixed:not(.relative) .header_fixed-content .header_title.content-formatted:not(.product_filters) p, .header_fixed:not(.relative) .header_fixed-content .header_title.content-formatted:not(.product_filters) h1, .header_fixed:not(.relative) .header_fixed-content .header_title.content-formatted:not(.product_filters) h2, .header_fixed:not(.relative) .header_fixed-content .header_title.content-formatted:not(.product_filters) h3, .header_fixed:not(.relative) .header_fixed-content .header_title.content-formatted:not(.product_filters) h4, .header_fixed:not(.relative) .header_fixed-content .header_title.content-formatted:not(.product_filters) h5, .header_fixed:not(.relative) .header_fixed-content .header_title.content-formatted:not(.product_filters) h6 {
  color: var(--header-site-title-color);
}

.header_fixed:not(.relative):not(.scroll) .menu_popover-btn svg path {
  fill: var(--header-mainmenu-color);
}

.header_fixed:not(.relative):not(.scroll) .menu_popover-btn:hover svg path {
  fill: var(--header-mainmenu-hover-color);
}

.header_fixed:not(.relative):not(.scroll) .search-btn:hover svg g, .header_fixed:not(.relative):not(.scroll) .search-btn:hover svg path,
.header_fixed:not(.relative):not(.scroll) .cart-btn:hover svg g,
.header_fixed:not(.relative):not(.scroll) .cart-btn:hover svg path {
  fill: var(--header-mainmenu-color);
}

.header_fixed:not(.relative):not(.scroll) .search-btn svg g, .header_fixed:not(.relative):not(.scroll) .search-btn svg path,
.header_fixed:not(.relative):not(.scroll) .cart-btn svg g,
.header_fixed:not(.relative):not(.scroll) .cart-btn svg path {
  fill: var(--header-mainmenu-active-color);
}

.header_fixed:not(.relative):not(.scroll) .cart_btn-count {
  color: var(--header-mainmenu-active-color);
}

.header_fixed:not(.relative):not(.scroll) .menu-language-btn {
  color: var(--header-mainmenu-active-color);
}

.header_fixed:not(.relative):not(.scroll) .menu-language-btn:hover {
  color: var(--header-mainmenu-color);
}

.header_fixed:not(.relative):not(.scroll) .menu-language-btn:hover svg path {
  stroke: var(--header-mainmenu-color);
}

.header_fixed:not(.relative):not(.scroll) .menu-language-btn svg path {
  stroke: var(--header-mainmenu-active-color);
}

.header_fixed:not(.relative).dark-background.scroll .menu-main .menu .menu-item a,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-main .menu .menu-item a {
  color: var(--third-color);
}

.header_fixed:not(.relative).dark-background.scroll .menu-main .menu .menu-item a:hover,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-main .menu .menu-item a:hover {
  opacity: 0.7;
}

.header_fixed:not(.relative).dark-background.scroll .menu-main .menu .menu-item a.untranslated,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-main .menu .menu-item a.untranslated {
  color: #C5292A;
}

.header_fixed:not(.relative).dark-background.scroll .menu-main .menu .menu-item.active a,
.header_fixed:not(.relative).dark-background.scroll .menu-main .menu .menu-item a.selected,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-main .menu .menu-item.active a,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-main .menu .menu-item a.selected {
  color: var(--third-color);
  opacity: 0.7;
}

.header_fixed:not(.relative).dark-background.scroll .menu-main .menu .menu-item.active a:hover,
.header_fixed:not(.relative).dark-background.scroll .menu-main .menu .menu-item a.selected:hover,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-main .menu .menu-item.active a:hover,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-main .menu .menu-item a.selected:hover {
  opacity: 1;
}

.header_fixed:not(.relative).dark-background.scroll .menu-main .menu.menu_popover-list .menu-item a,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-main .menu.menu_popover-list .menu-item a {
  color: var(--menu-dropdown-text-color);
}

.header_fixed:not(.relative).dark-background.scroll .menu-main .menu.menu_popover-list .menu-item a:hover,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-main .menu.menu_popover-list .menu-item a:hover {
  color: var(--menu-dropdown-hover-text-color);
}

.header_fixed:not(.relative).dark-background.scroll .menu_popover-btn svg path,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu_popover-btn svg path {
  fill: var(--third-color);
}

.header_fixed:not(.relative).dark-background.scroll .menu_popover-btn:hover svg path,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu_popover-btn:hover svg path {
  fill: var(--third-color);
  opacity: 0.7;
}

.header_fixed:not(.relative).dark-background.scroll .search-btn:hover svg g, .header_fixed:not(.relative).dark-background.scroll .search-btn:hover svg path,
.header_fixed:not(.relative).dark-background.scroll .cart_btn:hover svg g,
.header_fixed:not(.relative).dark-background.scroll .cart_btn:hover svg path,
.dark-background .header_fixed:not(.relative):not(.scroll) .search-btn:hover svg g,
.dark-background .header_fixed:not(.relative):not(.scroll) .search-btn:hover svg path,
.dark-background .header_fixed:not(.relative):not(.scroll) .cart_btn:hover svg g,
.dark-background .header_fixed:not(.relative):not(.scroll) .cart_btn:hover svg path {
  fill: var(--third-color);
  opacity: 0.7;
}

.header_fixed:not(.relative).dark-background.scroll .search-btn svg g, .header_fixed:not(.relative).dark-background.scroll .search-btn svg path,
.header_fixed:not(.relative).dark-background.scroll .cart_btn svg g,
.header_fixed:not(.relative).dark-background.scroll .cart_btn svg path,
.dark-background .header_fixed:not(.relative):not(.scroll) .search-btn svg g,
.dark-background .header_fixed:not(.relative):not(.scroll) .search-btn svg path,
.dark-background .header_fixed:not(.relative):not(.scroll) .cart_btn svg g,
.dark-background .header_fixed:not(.relative):not(.scroll) .cart_btn svg path {
  fill: var(--third-color);
}

.header_fixed:not(.relative).dark-background.scroll .cart_btn-count,
.dark-background .header_fixed:not(.relative):not(.scroll) .cart_btn-count {
  color: var(--third-color);
}

.header_fixed:not(.relative).dark-background.scroll .menu-language-btn,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-language-btn {
  color: var(--third-color);
}

.header_fixed:not(.relative).dark-background.scroll .menu-language-btn:hover,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-language-btn:hover {
  color: var(--third-color);
  opacity: 0.7;
}

.header_fixed:not(.relative).dark-background.scroll .menu-language-btn:hover svg path,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-language-btn:hover svg path {
  stroke: var(--third-color);
  opacity: 0.7;
}

.header_fixed:not(.relative).dark-background.scroll .menu-language-btn svg path,
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-language-btn svg path {
  stroke: var(--third-color);
}

:not(.semimodal-open) .header_fixed:not(.relative).dark-background.scroll .menu-stripe, :not(.semimodal-open)
.dark-background .header_fixed:not(.relative):not(.scroll) .menu-stripe {
  background-color: var(--third-color);
}

.header_fixed:not(.relative).dark-background.scroll .header_fixed-content .header_title.content-formatted:not(.product_filters),
.dark-background .header_fixed:not(.relative):not(.scroll) .header_fixed-content .header_title.content-formatted:not(.product_filters) {
  color: var(--third-color);
}

.header_fixed:not(.relative).dark-background.scroll .header_fixed-content .header_title.content-formatted:not(.product_filters) a, .header_fixed:not(.relative).dark-background.scroll .header_fixed-content .header_title.content-formatted:not(.product_filters) p, .header_fixed:not(.relative).dark-background.scroll .header_fixed-content .header_title.content-formatted:not(.product_filters) h1, .header_fixed:not(.relative).dark-background.scroll .header_fixed-content .header_title.content-formatted:not(.product_filters) h2, .header_fixed:not(.relative).dark-background.scroll .header_fixed-content .header_title.content-formatted:not(.product_filters) h3, .header_fixed:not(.relative).dark-background.scroll .header_fixed-content .header_title.content-formatted:not(.product_filters) h4, .header_fixed:not(.relative).dark-background.scroll .header_fixed-content .header_title.content-formatted:not(.product_filters) h5, .header_fixed:not(.relative).dark-background.scroll .header_fixed-content .header_title.content-formatted:not(.product_filters) h6,
.dark-background .header_fixed:not(.relative):not(.scroll) .header_fixed-content .header_title.content-formatted:not(.product_filters) a,
.dark-background .header_fixed:not(.relative):not(.scroll) .header_fixed-content .header_title.content-formatted:not(.product_filters) p,
.dark-background .header_fixed:not(.relative):not(.scroll) .header_fixed-content .header_title.content-formatted:not(.product_filters) h1,
.dark-background .header_fixed:not(.relative):not(.scroll) .header_fixed-content .header_title.content-formatted:not(.product_filters) h2,
.dark-background .header_fixed:not(.relative):not(.scroll) .header_fixed-content .header_title.content-formatted:not(.product_filters) h3,
.dark-background .header_fixed:not(.relative):not(.scroll) .header_fixed-content .header_title.content-formatted:not(.product_filters) h4,
.dark-background .header_fixed:not(.relative):not(.scroll) .header_fixed-content .header_title.content-formatted:not(.product_filters) h5,
.dark-background .header_fixed:not(.relative):not(.scroll) .header_fixed-content .header_title.content-formatted:not(.product_filters) h6 {
  color: var(--third-color);
}

.semimodal-open .semimodal.dark-background .menu-stripe {
  background-color: var(--third-color);
}

.semimodal-open .semimodal.dark-background .menu-language-toggle .menu-language-btn {
  color: var(--third-color);
}

.semimodal-open .semimodal.dark-background .menu-language-toggle .menu-language-btn svg path {
  stroke: var(--third-color);
}

.dark-background .light-background .header_components-semimodal,
.dark-background .light-background .site_title.content-formatted,
.dark-background .light-background .semimodal_bottom-content,
.dark-background .light-background .menu-language-btn,
.dark-background .light-background .menu-language-name {
  color: var(--header-mainmenu-active-color);
}

.dark-background .light-background .header_components-semimodal a, .dark-background .light-background .header_components-semimodal p, .dark-background .light-background .header_components-semimodal h1, .dark-background .light-background .header_components-semimodal h2, .dark-background .light-background .header_components-semimodal h3, .dark-background .light-background .header_components-semimodal h4, .dark-background .light-background .header_components-semimodal h5, .dark-background .light-background .header_components-semimodal h6,
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
.dark-background .light-background .cart_btn svg g,
.dark-background .light-background .cart_btn svg path {
  fill: var(--header-mainmenu-active-color);
}

.dark-background .light-background .search-btn:hover svg g,
.dark-background .light-background .cart_btn:hover svg g,
.dark-background .light-background .cart_btn:hover svg path {
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

.dark-background .light-background .menu-main .menu .menu-item a.selected {
  color: var(--header-mainmenu-active-color);
  opacity: 1;
}

.dark-background .light-background .menu-main .menu .menu-item a.selected::before {
  background-color: var(--header-mainmenu-active-color);
  opacity: 1;
}

.dark-background .light-background .menu-main .menu .menu-item a.selected:hover {
  color: var(--header-mainmenu-hover-color);
}

.dark-background .light-background .menu-main .menu .menu-item a.selected:hover::before {
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

.dropwdown_menu-popover {
  background-color: var(--menu-dropdown-background-color);
}

.dropwdown_menu-popover .menu .menu-item a {
  color: var(--menu-dropdown-text-color);
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

.content-formatted:not(.product_filters),
.content-formatted .product_item-btn,
.content-formatted p {
  font-size: var(--content-body-font-size);
  line-height: var(--content-body-line-height);
  color: var(--content-body-color);
  -webkit-hyphens: var(--content-body-hyphens);
      -ms-hyphens: var(--content-body-hyphens);
          hyphens: var(--content-body-hyphens);
}

.post_page .article_item .post_content .content-formatted:not(.product_filters), .post_page .article_item
.content-formatted:not(.product_filters) .post_details, .post_page .article_item .post_content
.content-formatted .product_item-btn, .post_page .article_item
.content-formatted .product_item-btn .post_details, .post_page .article_item .post_content
.content-formatted p, .post_page .article_item
.content-formatted p .post_details {
  font-size: var(--blog-body-font-size);
  line-height: var(--blog-body-line-height);
}

.post_page .content-formatted:not(.product_filters).post_tags .menu a, .post_page
.content-formatted .product_item-btn.post_tags .menu a, .post_page
.content-formatted p.post_tags .menu a {
  font-size: var(--blog-body-font-size);
  line-height: var(--blog-body-line-height);
}

.dark-background .content-formatted:not(.product_filters), .dark-background
.content-formatted .product_item-btn, .dark-background
.content-formatted p {
  color: var(--third-color);
}

.content-formatted:not(.product_filters) .horizontal-scroll,
.content-formatted .product_item-btn .horizontal-scroll,
.content-formatted p .horizontal-scroll {
  border-left: 1px dashed var(--content-body-color);
  border-right: 1px dashed var(--content-body-color);
}

.dark-background .content-formatted:not(.product_filters) .horizontal-scroll, .dark-background
.content-formatted .product_item-btn .horizontal-scroll, .dark-background
.content-formatted p .horizontal-scroll {
  border-left: 1px dashed var(--third-color);
  border-right: 1px dashed var(--third-color);
}

.content-formatted:not(.product_filters) h1, .content-formatted:not(.product_filters) h2, .content-formatted:not(.product_filters) h3, .content-formatted:not(.product_filters) h4, .content-formatted:not(.product_filters) h5, .content-formatted:not(.product_filters) h6,
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

.dark-background .content-formatted:not(.product_filters) h1, .dark-background .content-formatted:not(.product_filters) h2, .dark-background .content-formatted:not(.product_filters) h3, .dark-background .content-formatted:not(.product_filters) h4, .dark-background .content-formatted:not(.product_filters) h5, .dark-background .content-formatted:not(.product_filters) h6, .dark-background
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

.dark-background .content-formatted:not(.product_filters) .edy-content-social-button svg, .dark-background .content-formatted:not(.product_filters) .edy-content-social-button path, .dark-background
.content-formatted .product_item-btn .edy-content-social-button svg, .dark-background
.content-formatted .product_item-btn .edy-content-social-button path, .dark-background
.content-formatted p .edy-content-social-button svg, .dark-background
.content-formatted p .edy-content-social-button path {
  fill: var(--third-color);
  border-color: var(--third-color);
}

.content-formatted:not(.product_filters) h1,
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
  .content-formatted:not(.product_filters) h1,
  .content-formatted .product_item-btn h1,
  .content-formatted p h1 {
    font-size: calc(var(--headings-title-font-size) / 2);
  }
}

@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted:not(.product_filters) h1, .semimodal-relative
  .content-formatted .product_item-btn h1, .semimodal-relative
  .content-formatted p h1 {
    font-size: calc(var(--headings-title-font-size) / 2);
  }
}

.content-formatted:not(.product_filters) h2,
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
  .content-formatted:not(.product_filters) h2,
  .content-formatted .product_item-btn h2,
  .content-formatted p h2 {
    font-size: calc(var(--headings-heading-font-size) / 1.8);
  }
}

@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted:not(.product_filters) h2, .semimodal-relative
  .content-formatted .product_item-btn h2, .semimodal-relative
  .content-formatted p h2 {
    font-size: calc(var(--headings-heading-font-size) / 1.8);
  }
}

.content-formatted:not(.product_filters) h3,
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
  .content-formatted:not(.product_filters) h3,
  .content-formatted .product_item-btn h3,
  .content-formatted p h3 {
    font-size: calc(var(--headings-subheading-font-size) / 1.4);
  }
}

@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted:not(.product_filters) h3, .semimodal-relative
  .content-formatted .product_item-btn h3, .semimodal-relative
  .content-formatted p h3 {
    font-size: calc(var(--headings-subheading-font-size) / 1.4);
  }
}

.content-formatted:not(.product_filters) h4,
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
  .content-formatted:not(.product_filters) h4,
  .content-formatted .product_item-btn h4,
  .content-formatted p h4 {
    font-size: calc(var(--headings-heading-4-font-size) / 1.2);
  }
}

@media screen and (max-width: 1024px) {
  .semimodal-relative .content-formatted:not(.product_filters) h4, .semimodal-relative
  .content-formatted .product_item-btn h4, .semimodal-relative
  .content-formatted p h4 {
    font-size: calc(var(--headings-heading-4-font-size) / 1.2);
  }
}

.content-formatted:not(.product_filters) a:not(.custom-btn),
.content-formatted .product_item-btn a:not(.custom-btn),
.content-formatted p a:not(.custom-btn) {
  font-style: var(--content-link-font-style);
  font-weight: var(--content-link-font-weight);
  color: var(--content-link-color);
  -webkit-text-decoration: var(--content-link-text-decoration);
          text-decoration: var(--content-link-text-decoration);
  text-transform: var(--content-link-text-transform);
}

.dark-background .content-formatted:not(.product_filters) a:not(.custom-btn), .dark-background
.content-formatted .product_item-btn a:not(.custom-btn), .dark-background
.content-formatted p a:not(.custom-btn) {
  color: var(--third-color);
}

.content-formatted:not(.product_filters) a:not(.custom-btn):hover,
.content-formatted .product_item-btn a:not(.custom-btn):hover,
.content-formatted p a:not(.custom-btn):hover {
  font-style: var(--content-link-hover-font-style);
  font-weight: var(--content-link-hover-font-weight);
  color: var(--content-link-hover-color);
  -webkit-text-decoration: var(--content-link-hover-text-decoration);
          text-decoration: var(--content-link-hover-text-decoration);
  text-transform: var(--content-link-hover-text-transform);
}

.dark-background .content-formatted:not(.product_filters) a:not(.custom-btn):hover, .dark-background
.content-formatted .product_item-btn a:not(.custom-btn):hover, .dark-background
.content-formatted p a:not(.custom-btn):hover {
  color: var(--third-color);
}

.content-formatted:not(.product_filters).header_title, .content-formatted:not(.product_filters).site_title,
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

.header_fixed.dark-background .content-formatted:not(.product_filters).header_title,
.semimodal.dark-background .content-formatted:not(.product_filters).header_title,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).header_title, .header_fixed.dark-background .content-formatted:not(.product_filters).site_title,
.semimodal.dark-background .content-formatted:not(.product_filters).site_title,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).site_title, .header_fixed.dark-background
.content-formatted .product_item-btn.header_title,
.semimodal.dark-background
.content-formatted .product_item-btn.header_title,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.header_title, .header_fixed.dark-background
.content-formatted .product_item-btn.site_title,
.semimodal.dark-background
.content-formatted .product_item-btn.site_title,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.site_title, .header_fixed.dark-background
.content-formatted p.header_title,
.semimodal.dark-background
.content-formatted p.header_title,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.header_title, .header_fixed.dark-background
.content-formatted p.site_title,
.semimodal.dark-background
.content-formatted p.site_title,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.site_title {
  color: var(--third-color);
}

.content-formatted:not(.product_filters).header_title a:not(.custom-btn), .content-formatted:not(.product_filters).header_title p, .content-formatted:not(.product_filters).header_title h1, .content-formatted:not(.product_filters).header_title h2, .content-formatted:not(.product_filters).header_title h3, .content-formatted:not(.product_filters).header_title h4, .content-formatted:not(.product_filters).header_title h5, .content-formatted:not(.product_filters).header_title h6, .content-formatted:not(.product_filters).site_title a:not(.custom-btn), .content-formatted:not(.product_filters).site_title p, .content-formatted:not(.product_filters).site_title h1, .content-formatted:not(.product_filters).site_title h2, .content-formatted:not(.product_filters).site_title h3, .content-formatted:not(.product_filters).site_title h4, .content-formatted:not(.product_filters).site_title h5, .content-formatted:not(.product_filters).site_title h6,
.content-formatted .product_item-btn.header_title a:not(.custom-btn),
.content-formatted .product_item-btn.header_title p,
.content-formatted .product_item-btn.header_title h1,
.content-formatted .product_item-btn.header_title h2,
.content-formatted .product_item-btn.header_title h3,
.content-formatted .product_item-btn.header_title h4,
.content-formatted .product_item-btn.header_title h5,
.content-formatted .product_item-btn.header_title h6,
.content-formatted .product_item-btn.site_title a:not(.custom-btn),
.content-formatted .product_item-btn.site_title p,
.content-formatted .product_item-btn.site_title h1,
.content-formatted .product_item-btn.site_title h2,
.content-formatted .product_item-btn.site_title h3,
.content-formatted .product_item-btn.site_title h4,
.content-formatted .product_item-btn.site_title h5,
.content-formatted .product_item-btn.site_title h6,
.content-formatted p.header_title a:not(.custom-btn),
.content-formatted p.header_title p,
.content-formatted p.header_title h1,
.content-formatted p.header_title h2,
.content-formatted p.header_title h3,
.content-formatted p.header_title h4,
.content-formatted p.header_title h5,
.content-formatted p.header_title h6,
.content-formatted p.site_title a:not(.custom-btn),
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

.header_fixed.dark-background .content-formatted:not(.product_filters).header_title a:not(.custom-btn),
.semimodal.dark-background .content-formatted:not(.product_filters).header_title a:not(.custom-btn),
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).header_title a:not(.custom-btn), .header_fixed.dark-background .content-formatted:not(.product_filters).header_title p,
.semimodal.dark-background .content-formatted:not(.product_filters).header_title p,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).header_title p, .header_fixed.dark-background .content-formatted:not(.product_filters).header_title h1,
.semimodal.dark-background .content-formatted:not(.product_filters).header_title h1,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).header_title h1, .header_fixed.dark-background .content-formatted:not(.product_filters).header_title h2,
.semimodal.dark-background .content-formatted:not(.product_filters).header_title h2,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).header_title h2, .header_fixed.dark-background .content-formatted:not(.product_filters).header_title h3,
.semimodal.dark-background .content-formatted:not(.product_filters).header_title h3,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).header_title h3, .header_fixed.dark-background .content-formatted:not(.product_filters).header_title h4,
.semimodal.dark-background .content-formatted:not(.product_filters).header_title h4,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).header_title h4, .header_fixed.dark-background .content-formatted:not(.product_filters).header_title h5,
.semimodal.dark-background .content-formatted:not(.product_filters).header_title h5,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).header_title h5, .header_fixed.dark-background .content-formatted:not(.product_filters).header_title h6,
.semimodal.dark-background .content-formatted:not(.product_filters).header_title h6,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).header_title h6, .header_fixed.dark-background .content-formatted:not(.product_filters).site_title a:not(.custom-btn),
.semimodal.dark-background .content-formatted:not(.product_filters).site_title a:not(.custom-btn),
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).site_title a:not(.custom-btn), .header_fixed.dark-background .content-formatted:not(.product_filters).site_title p,
.semimodal.dark-background .content-formatted:not(.product_filters).site_title p,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).site_title p, .header_fixed.dark-background .content-formatted:not(.product_filters).site_title h1,
.semimodal.dark-background .content-formatted:not(.product_filters).site_title h1,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).site_title h1, .header_fixed.dark-background .content-formatted:not(.product_filters).site_title h2,
.semimodal.dark-background .content-formatted:not(.product_filters).site_title h2,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).site_title h2, .header_fixed.dark-background .content-formatted:not(.product_filters).site_title h3,
.semimodal.dark-background .content-formatted:not(.product_filters).site_title h3,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).site_title h3, .header_fixed.dark-background .content-formatted:not(.product_filters).site_title h4,
.semimodal.dark-background .content-formatted:not(.product_filters).site_title h4,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).site_title h4, .header_fixed.dark-background .content-formatted:not(.product_filters).site_title h5,
.semimodal.dark-background .content-formatted:not(.product_filters).site_title h5,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).site_title h5, .header_fixed.dark-background .content-formatted:not(.product_filters).site_title h6,
.semimodal.dark-background .content-formatted:not(.product_filters).site_title h6,
.dark-background .header_fixed:not(.relative):not(.scroll) .content-formatted:not(.product_filters).site_title h6, .header_fixed.dark-background
.content-formatted .product_item-btn.header_title a:not(.custom-btn),
.semimodal.dark-background
.content-formatted .product_item-btn.header_title a:not(.custom-btn),
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.header_title a:not(.custom-btn), .header_fixed.dark-background
.content-formatted .product_item-btn.header_title p,
.semimodal.dark-background
.content-formatted .product_item-btn.header_title p,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.header_title p, .header_fixed.dark-background
.content-formatted .product_item-btn.header_title h1,
.semimodal.dark-background
.content-formatted .product_item-btn.header_title h1,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.header_title h1, .header_fixed.dark-background
.content-formatted .product_item-btn.header_title h2,
.semimodal.dark-background
.content-formatted .product_item-btn.header_title h2,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.header_title h2, .header_fixed.dark-background
.content-formatted .product_item-btn.header_title h3,
.semimodal.dark-background
.content-formatted .product_item-btn.header_title h3,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.header_title h3, .header_fixed.dark-background
.content-formatted .product_item-btn.header_title h4,
.semimodal.dark-background
.content-formatted .product_item-btn.header_title h4,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.header_title h4, .header_fixed.dark-background
.content-formatted .product_item-btn.header_title h5,
.semimodal.dark-background
.content-formatted .product_item-btn.header_title h5,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.header_title h5, .header_fixed.dark-background
.content-formatted .product_item-btn.header_title h6,
.semimodal.dark-background
.content-formatted .product_item-btn.header_title h6,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.header_title h6, .header_fixed.dark-background
.content-formatted .product_item-btn.site_title a:not(.custom-btn),
.semimodal.dark-background
.content-formatted .product_item-btn.site_title a:not(.custom-btn),
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.site_title a:not(.custom-btn), .header_fixed.dark-background
.content-formatted .product_item-btn.site_title p,
.semimodal.dark-background
.content-formatted .product_item-btn.site_title p,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.site_title p, .header_fixed.dark-background
.content-formatted .product_item-btn.site_title h1,
.semimodal.dark-background
.content-formatted .product_item-btn.site_title h1,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.site_title h1, .header_fixed.dark-background
.content-formatted .product_item-btn.site_title h2,
.semimodal.dark-background
.content-formatted .product_item-btn.site_title h2,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.site_title h2, .header_fixed.dark-background
.content-formatted .product_item-btn.site_title h3,
.semimodal.dark-background
.content-formatted .product_item-btn.site_title h3,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.site_title h3, .header_fixed.dark-background
.content-formatted .product_item-btn.site_title h4,
.semimodal.dark-background
.content-formatted .product_item-btn.site_title h4,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.site_title h4, .header_fixed.dark-background
.content-formatted .product_item-btn.site_title h5,
.semimodal.dark-background
.content-formatted .product_item-btn.site_title h5,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.site_title h5, .header_fixed.dark-background
.content-formatted .product_item-btn.site_title h6,
.semimodal.dark-background
.content-formatted .product_item-btn.site_title h6,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted .product_item-btn.site_title h6, .header_fixed.dark-background
.content-formatted p.header_title a:not(.custom-btn),
.semimodal.dark-background
.content-formatted p.header_title a:not(.custom-btn),
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.header_title a:not(.custom-btn), .header_fixed.dark-background
.content-formatted p.header_title p,
.semimodal.dark-background
.content-formatted p.header_title p,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.header_title p, .header_fixed.dark-background
.content-formatted p.header_title h1,
.semimodal.dark-background
.content-formatted p.header_title h1,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.header_title h1, .header_fixed.dark-background
.content-formatted p.header_title h2,
.semimodal.dark-background
.content-formatted p.header_title h2,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.header_title h2, .header_fixed.dark-background
.content-formatted p.header_title h3,
.semimodal.dark-background
.content-formatted p.header_title h3,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.header_title h3, .header_fixed.dark-background
.content-formatted p.header_title h4,
.semimodal.dark-background
.content-formatted p.header_title h4,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.header_title h4, .header_fixed.dark-background
.content-formatted p.header_title h5,
.semimodal.dark-background
.content-formatted p.header_title h5,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.header_title h5, .header_fixed.dark-background
.content-formatted p.header_title h6,
.semimodal.dark-background
.content-formatted p.header_title h6,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.header_title h6, .header_fixed.dark-background
.content-formatted p.site_title a:not(.custom-btn),
.semimodal.dark-background
.content-formatted p.site_title a:not(.custom-btn),
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.site_title a:not(.custom-btn), .header_fixed.dark-background
.content-formatted p.site_title p,
.semimodal.dark-background
.content-formatted p.site_title p,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.site_title p, .header_fixed.dark-background
.content-formatted p.site_title h1,
.semimodal.dark-background
.content-formatted p.site_title h1,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.site_title h1, .header_fixed.dark-background
.content-formatted p.site_title h2,
.semimodal.dark-background
.content-formatted p.site_title h2,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.site_title h2, .header_fixed.dark-background
.content-formatted p.site_title h3,
.semimodal.dark-background
.content-formatted p.site_title h3,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.site_title h3, .header_fixed.dark-background
.content-formatted p.site_title h4,
.semimodal.dark-background
.content-formatted p.site_title h4,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.site_title h4, .header_fixed.dark-background
.content-formatted p.site_title h5,
.semimodal.dark-background
.content-formatted p.site_title h5,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.site_title h5, .header_fixed.dark-background
.content-formatted p.site_title h6,
.semimodal.dark-background
.content-formatted p.site_title h6,
.dark-background .header_fixed:not(.relative):not(.scroll)
.content-formatted p.site_title h6 {
  color: var(--third-color);
}

@media screen and (max-width: 900px) {
  .content-formatted:not(.product_filters).header_title, .content-formatted:not(.product_filters).site_title,
  .content-formatted .product_item-btn.header_title,
  .content-formatted .product_item-btn.site_title,
  .content-formatted p.header_title,
  .content-formatted p.site_title {
    font-size: 18px;
    line-height: 18px;
  }
}

.content-formatted:not(.product_filters) .custom-btn,
.content-formatted:not(.product_filters) .form_submit input,
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
  border-radius: var(--button-border-radius);
  border: var(--button-border-size) solid;
  border-color: var(--button-border-color);
}

.dark-background .content-formatted:not(.product_filters) .custom-btn, .dark-background
.content-formatted:not(.product_filters) .form_submit input, .dark-background
.content-formatted .product_item-btn .custom-btn, .dark-background
.content-formatted .product_item-btn .form_submit input, .dark-background
.content-formatted p .custom-btn, .dark-background
.content-formatted p .form_submit input {
  border: 1px solid var(--third-color);
}

.content-formatted:not(.product_filters) .custom-btn:hover,
.content-formatted:not(.product_filters) .form_submit input:hover,
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
  border-color: var(--button-hover-border-color);
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

.content-formatted .form_field_textfield:not(#product-list-search),
.content-formatted .form_field_textarea,
.content-formatted .form_field_select:not(#field_field_filter),
.content-formatted .edy-fe-fieldinputs > label:not(.form_field_label) {
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
