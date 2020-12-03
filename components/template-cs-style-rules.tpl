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

.header_fixed .header_title {
  font-size: var(--header-site-title-font-size);
  font-weight: var(--header-site-title-font-weight);
  font-style: var(--header-site-title-font-style);
  -webkit-text-decoration: var(--header-site-title-text-decoration);
          text-decoration: var(--header-site-title-text-decoration);
  text-transform: var(--header-site-title-text-transform);
  color: var(--header-site-title-color);
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
.post .post_author, .post .post_date {
  color: var(--secondary-color);
}
.dark-background .post .post_author,
.dark-background .post .post_date {
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

.menu-btn .menu-stripe {
  background-color: var(--primary-color);
}
.dark-background .menu-btn .menu-stripe {
  background-color: var(--fourth-color);
}

.menu_popover-btn svg path {
  fill: var(--header-mainmenu-color);
}
.menu_popover-btn svg path:hover {
  fill: var(--header-mainmenu-hover-color);
}

.menu-language-btn,
.menu-language-name {
  color: var(--header-mainmenu-color);
}
.menu-language-btn:hover,
.menu-language-name:hover {
  color: var(--header-mainmenu-hover-color);
}

.menu-main .menu .menu-item a {
  color: var(--header-mainmenu-color);
  -webkit-text-decoration: var(--header-mainmenu-decoration);
          text-decoration: var(--header-mainmenu-decoration);
}
.menu-main .menu .menu-item a::before {
  background-color: var(--header-mainmenu-color);
}
.menu-main .menu .menu-item a:hover {
  color: var(--header-mainmenu-hover-color);
}
.menu-main .menu .menu-item.active a {
  color: var(--header-mainmenu-active-color);
  font-weight: var(--header-mainmenu-active-font-weight);
  -webkit-text-decoration: var(--header-mainmenu-active-decoration);
          text-decoration: var(--header-mainmenu-active-decoration);
}
.menu-main .menu .menu-item.active a::before {
  background-color: var(--header-mainmenu-active-color);
}
.menu-main .menu .menu-item.active a:hover {
  color: var(--header-mainmenu-color);
  -webkit-text-decoration: var(--header-mainmenu-hover-decoration);
          text-decoration: var(--header-mainmenu-hover-decoration);
}
.menu-main .menu .menu-item.active a:hover::before {
  background-color: var(--header-mainmenu-color);
}
.menu-main .menu .menu-sub .menu-item a.active {
  font-weight: 400;
}
@media screen and (max-width: 752px) {
  .menu-main.expanded .menu-lang .menu-item .menu-item a {
    color: var(--secondary-color);
  }
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

.footer .voog-reference a {
  color: var(--primary-color);
}

.content-formatted, .content-formatted p {
  font-size: var(--content-body-font-size);
  line-height: var(--content-body-line-height);
  color: var(--content-body-color);
}
.dark-background .content-formatted,
.dark-background .content-formatted p {
  color: var(--fourth-color);
}
.content-formatted h1, .content-formatted h2, .content-formatted h3, .content-formatted h4, .content-formatted h5, .content-formatted h6, .content-formatted p h1, .content-formatted p h2, .content-formatted p h3, .content-formatted p h4, .content-formatted p h5, .content-formatted p h6 {
  color: var(--secondary-color);
}
.dark-background .content-formatted h1, .dark-background .content-formatted h2, .dark-background .content-formatted h3, .dark-background .content-formatted h4, .dark-background .content-formatted h5, .dark-background .content-formatted h6, .dark-background .content-formatted p h1, .dark-background .content-formatted p h2, .dark-background .content-formatted p h3, .dark-background .content-formatted p h4, .dark-background .content-formatted p h5, .dark-background .content-formatted p h6 {
  color: var(--fourth-color);
}
.content-formatted h1, .content-formatted p h1 {
  font-size: var(--headings-title-font-size);
  font-style: var(--headings-title-font-style);
  font-weight: var(--headings-title-font-weight);
  line-height: var(--headings-title-line-height);
  color: var(--headings-title-color);
  text-align: var(--headings-title-text-alignment);
  -webkit-text-decoration: var(--headings-title-text-decoration);
          text-decoration: var(--headings-title-text-decoration);
  text-transform: var(--headings-title-text-transform);
}
.content-formatted h2, .content-formatted p h2 {
  font-size: var(--headings-heading-font-size);
  font-style: var(--headings-heading-font-style);
  font-weight: var(--headings-heading-font-weight);
  line-height: var(--headings-heading-line-height);
  color: var(--headings-heading-color);
  text-align: var(--headings-heading-text-alignment);
  -webkit-text-decoration: var(--headings-heading-text-decoration);
          text-decoration: var(--headings-heading-text-decoration);
  text-transform: var(--headings-heading-text-transform);
}
.content-formatted h3, .content-formatted p h3 {
  font-size: var(--headings-subheading-font-size);
  font-style: var(--headings-subheading-font-style);
  font-weight: var(--headings-subheading-font-weight);
  line-height: var(--headings-subheading-line-height);
  color: var(--headings-subheading-color);
  text-align: var(--headings-subheading-text-alignment);
  -webkit-text-decoration: var(--headings-subheading-text-decoration);
          text-decoration: var(--headings-subheading-text-decoration);
  text-transform: var(--headings-subheading-text-transform);
}
.content-formatted a:not(.custom-btn), .content-formatted p a:not(.custom-btn) {
  font-style: var(--content-link-font-style);
  font-weight: var(--content-link-font-weight);
  color: var(--content-link-color);
  -webkit-text-decoration: var(--content-link-text-decoration);
          text-decoration: var(--content-link-text-decoration);
  text-transform: var(--content-link-text-transform);
}
.dark-background .content-formatted a:not(.custom-btn), .dark-background .content-formatted p a:not(.custom-btn) {
  color: var(--fourth-color);
}
.content-formatted a:not(.custom-btn):hover, .content-formatted p a:not(.custom-btn):hover {
  font-style: var(--content-link-hover-font-style);
  font-weight: var(--content-link-hover-font-weight);
  color: var(--content-link-hover-color);
  -webkit-text-decoration: var(--content-link-hover-text-decoration);
          text-decoration: var(--content-link-hover-text-decoration);
  text-transform: var(--content-link-hover-text-transform);
}
.dark-background .content-formatted a:not(.custom-btn):hover, .dark-background .content-formatted p a:not(.custom-btn):hover {
  color: var(--fourth-color);
}
.content-formatted .custom-btn,
.content-formatted .form_submit input, .content-formatted p .custom-btn,
.content-formatted p .form_submit input {
  padding: calc(var(--button-padding) - 8px) var(--button-padding) calc(var(--button-padding) - 7px);
  color: var(--button-color);
  font-size: var(--button-font-size);
  font-style: var(--button-font-style);
  font-weight: var(--button-font-weight);
  -webkit-text-decoration: var(--button-text-decoration);
          text-decoration: var(--button-text-decoration);
  text-transform: var(--button-text-transform);
  background-color: var(--button-background-color);
}
.content-formatted .custom-btn:hover,
.content-formatted .form_submit input:hover, .content-formatted p .custom-btn:hover,
.content-formatted p .form_submit input:hover {
  padding: calc(var(--button-hover-padding) - 8px) var(--button-hover-padding) calc(var(--button-hover-padding) - 7px);
  color: var(--button-hover-color);
  font-size: var(--button-hover-font-size);
  font-style: var(--button-hover-font-style);
  font-weight: var(--button-hover-font-weight);
  -webkit-hyphens: var(--button-hover-hyphens);
      -ms-hyphens: var(--button-hover-hyphens);
          hyphens: var(--button-hover-hyphens);
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

.content-formatted .form_field .form_field_label,
.content-formatted .form_field .edy-fe-label {
  font-size: var(--form-label-font-size);
}
.content-formatted .form_field_textfield,
.content-formatted .form_field_textarea,
.content-formatted label:not(.form_field_label) {
  font-style: var(--form-field-font-style);
  font-weight: var(--form-field-font-weight);
  font-size: var(--form-field-font-size);
  -webkit-text-decoration: var(--form-field-text-decoration);
          text-decoration: var(--form-field-text-decoration);
  text-transform: var(--form-field-text-transform);
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
.dark-background .content-formatted .form_field_textfield:-ms-input-placeholder,
.dark-background .content-formatted .form_field_textarea:-ms-input-placeholder,
.dark-background .content-formatted .form_field_select:-ms-input-placeholder {
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
.light-background .content-formatted .form_field_textfield:-ms-input-placeholder,
.light-background .content-formatted .form_field_textarea:-ms-input-placeholder,
.light-background .content-formatted .form_field_select:-ms-input-placeholder {
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
