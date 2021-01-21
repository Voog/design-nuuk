;(function($) {
  var editmode = function () {
    return $('html').hasClass('editmode');
  };

  // ===========================================================================
  // Binds site search functionality.
  // ===========================================================================
  var bindSiteSearch = function(searchForm, languageCode, noResultsString) {
    if (searchForm) {
      var search = new VoogSearch(searchForm, {
        // This defines the number of results per query.
        per_page: 10,
        // Language code for restricting the search to page language.
        lang: languageCode,
        // If given, an DOM element results are rendered inside that element
        resultsContainer: $('.js-voog-search-modal').get(0),
        // Defines if modal should close on sideclick.
        sideclick: true,
        // Mobile checkpoint.
        mobileModeWidth: 640,
        // Updates results on every keypress.
        updateOnKeypress: true,
        // String for feedback if no results are found.
        noResults: noResultsString
      });
    }
  };

  // Remove comments if debouncing is used.
  // Function to limit the rate at which a function can fire.
  var debounce = function(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  var bindSideClicks = function() {
    $('.container, .bg_img-cover, .content_wrap, .header_fixed, swiper-container').on('mousedown', function(event) {
      if (!$(event.target).closest('.js-prevent-sideclick').length) {
        $('.js-semimodal-toggle').removeClass('semimodal-open');
        $('.js-popover').removeClass('expanded');
        $('html').removeClass('search-open');
        $('.js-search, .menu_popover').removeClass('active');
        $('.search-btn').removeClass('open');
        $('html').removeClass('menu-language-popover-open');
        $('body').removeClass('layout_settings-visible');
        $('.editor_default-container').removeClass('active');
        $('.js-image-settings-popover').toggleClass('active');
      };
    });

    $('body').click(function(event) {
      if (
        !$(event.target).closest('.layout_settings-btn, .edy-settings-editor, .layout_settings-btn--container').length
      ) {
        $('body').removeClass('layout_settings-visible');
      }
    });
  };

  // Switches the site language to the selected value from the language menu.
  var handleLanguageSwitch = function() {
    $('.menu-lang').find('.menu').change(function() {
      window.location = $(this).find(':selected').val();
    });
  };

  // Shows/hides the popover main menu (visible on smalles screens).
  var toggleMainMenu = function() {
    $('.js-menu-btn, .js-close-menu').click(function() {
      $('.js-semimodal-toggle').toggleClass('semimodal-open');
    });
  };

  // Removes optional content elements if element doesn't have any content.
  var removeOptionalContent = function() {
    optionalContent = $('.js-content-optional');
    $.each( $(optionalContent), function(){
      optionalContentLength = $(this).text().trim().length;

      if (!optionalContentLength > 0) {
        $(this).remove();
      }
    });
  };

  // Scrolls to the comment_form if comment submit failed (to show the error messages to the user)
  var focusFormWithErrors = function() {
    $(document).ready(function() {
      if ($('.comment_form').hasClass('form_with_errors')) {
        $('html, body').scrollTop($('.comment_form').offset().top);
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
      }
    });
  };

  // Wraps tables in the container.
  // TODO: remove if edicy is going to wrap table with the container.
  var wrapTables = function() {
    $('.content-formatted table').wrap('<div class="table-container"></div>');
  };

  var handleFocus = function(el, func) {
    el.focus(function() {
      $(window).keyup(function (e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if (code == 9) {
          func()
        }
      });
    });
  }

  var handleElementsClick = function() {
    if ($('.js-search').hasClass('active')) {
      $('.js-search').removeClass('active');
      $('.search-btn').removeClass('open');
    }

    $('.js-cart-btn').click(function() {
      if ($(this).data('product-id')) {
        Voog.ShoppingCart.addProductById($(this).data('product-id'))
      }
    });

    var toggleSearch = function() {
      $('html').removeClass('mobilemenu-open');
      $('.js-search').toggleClass('active');
      $('.js-search').hasClass('active') ? $('.js-search-input').focus() : '';
      $('html').toggleClass('search-open');
      $('html').removeClass('menu-language-popover-open');
    }

    var toggleImageSettingsPopover = function() {
      $('.js-image-settings-popover').toggleClass('active');
    }

    $('.js-toggle-image-settings').click(function() {
      toggleImageSettingsPopover();
    });

    handleFocus($('.js-toggle-image-settings'), toggleImageSettingsPopover);

    var toggleMenuPopover = function() {
      $('.menu_popover').toggleClass('active');
    }

    $('.js-menu-popover-btn').click(function() {
      toggleMenuPopover();
    });

    $('.editor_default-btn').click(function() {
      $(this).closest('.editor_default-container').addClass('active');
    });

    handleFocus($('.js-menu-popover-btn'), toggleMenuPopover);

    handleFocus($('.js-search-toggle-btn'), toggleSearch);

    $('.js-search-toggle-btn').click(function() {
      toggleSearch();
    });

    $('.js-search-input').on('input', function() {
      var searchCleanBtn = $(this).parent().next();

      if ($(this).val().length > 1) {
        searchCleanBtn.addClass('active');
      } else {
        searchCleanBtn.removeClass('active');
      }
    });

    $('.js-search-reset-btn').click(function() {
      $('html').removeClass('search-open');
      $('.js-search').removeClass('active');
    });
  };

  // ===========================================================================
  // Function to detect if site language menu popover is open.
  // ===========================================================================
  var languageMenuPopoverOpen = function() {
    return $('html').hasClass('menu-language-popover-open');
  };

  // ===========================================================================
  // Positions popover menus under the toggleing button.
  // ===========================================================================
  var positionPopoverMenu = function(popoverButton, popoverMenu) {
    var $popoverButton = $(popoverButton);
    var rect = $popoverButton.offset();
    if ($( window ).width() >= 900) {
      var rightPos = $(window).width() - rect.left - $popoverButton.outerWidth();
    } else {
      var rightPos = 'unset';
    }

    $(popoverMenu).css({
      top: rect.top - $(window).scrollTop(),
      right: rightPos
    });
  };

  // ===========================================================================
  // Toggles language menu mode.
  // ===========================================================================
  var bindLanguageMenuSettings = function(languageMenuValuesObj, dataKey) {
    if (!('type' in languageMenuValuesObj)) {
      languageMenuValuesObj.type = 'popover';
    }

    if (!('item_state' in languageMenuValuesObj)) {
      languageMenuValuesObj.item_state = 'names_only';
    }

    var langSettingsEditor = new Edicy.SettingsEditor($('.js-menu-language-settings-toggle').get(0), {
      menuItems: [
        {
          "titleI18n": "show",
          "type": "radio",
          "key": "item_state",
          "list": [
            {
              "titleI18n": "flags_only",
              "value": "flags_only"
            },
            {
              "titleI18n": "names_only",
              "value": "names_only"
            }
          ]
        }
      ],

      buttonTitleI18n: "settings",
      values: languageMenuValuesObj,
      containerClass: ['editor_default', 'js-prevent-sideclick'],
      preview: function(data) {
        var $html = $('html'),
          $languageSettingsMenuElement = $('.js-menu-language-settings');

        if (data.item_state === 'flags_only') {
          $html.removeClass('language-flags-disabled');
          $html.removeClass('language-names-enabled');
          $html.addClass('language-flags-enabled');
          $html.addClass('language-names-disabled');
        } else if (data.item_state === 'names_only') {
          $html.removeClass('language-flags-enabled');
          $html.removeClass('language-names-disabled');
          $html.addClass('language-flags-disabled');
          $html.addClass('language-names-enabled');
        }

        positionPopoverMenu('.js-toggle-menu-language', '.js-menu-language-popover');
        this.setPosition();
      },

      commit: function(data) {
        siteData.set(dataKey, data);
      }
    });
  };

  // ===========================================================================
  // Load article cover images only when they are close or appearing in the
  // viewport.
  // ===========================================================================
  var callback_loaded = function (element) {
    var $contentItemBox = $(element).closest('.js-content-item-box');
    $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');
  };

  var bindContentItemImageLazyload = new LazyLoad({
    threshold : 500,
    elements_selector: ".js-lazyload",
    callback_loaded: callback_loaded
  });

  // Initiates the table horisontal scroll function when window is resized.
  var handleWindowResize = function() {
    $(window).resize(debounce(function() {
      handleActivLangMenu();
      handleMenuTopPos();
      if (languageMenuPopoverOpen()) {
        positionPopoverMenu('.js-toggle-menu-language', '.js-menu-language-popover');
      }


    }, 25));
  };

  var handleWindowScroll = function() {
    window.addEventListener('scroll', function(e) {
      var wrapperHeight = $('.header_fixed').height();

      if (window.scrollY > wrapperHeight) {
        $('.header_fixed:not(.relative)').addClass('scroll');
      } else {
        $('.header_fixed').removeClass('scroll');
      }
    });
  };

  var bindLanguageMenuButttons = function() {
    // Toggles language menu popover.
    var togglePopover = function() {
      var $html = $('html');

      $html.toggleClass('menu-language-popover-open');
      if ($html.hasClass('menu-main-opened') || $html.hasClass('site-search-opened')) {
        $html.removeClass('menu-main-opened site-search-opened');

        setTimeout(function(){
          positionPopoverMenu('.js-toggle-menu-language', '.js-menu-language-popover');
        }, 300);
      } else if ($html.hasClass('menu-language-popover-open')) {
        positionPopoverMenu('.js-toggle-menu-language', '.js-menu-language-popover');
      }
    }

    if (editmode()) {
      $('.js-toggle-menu-language .menu-language-btn').click(function() {
        togglePopover();
      });
    } else {
      if ("ontouchstart" in document.documentElement) {
        handleFocus($('.js-toggle-menu-language'), togglePopover);
        $('.js-toggle-menu-language .menu-language-btn').click(function() {
          togglePopover();
        });
      } else {
        $('.js-toggle-menu-language').hover(function() {
          positionPopoverMenu('.js-toggle-menu-language', '.js-menu-language-popover');
        });
      }
    }
  };

  // ===========================================================================
  // Builds an inline svg icon for custom shopping cart button.
  // ===========================================================================
  var buildCustomShoppingCartIcon = function() {
    var icoElement = document.createElement('div');

    icoElement.classList.add('edy-ecommerce-custom-ico')
    icoElement.innerHTML = '<svg fill="none" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><g clip-rule="evenodd" fill="#000" fill-rule="evenodd"><path d="m18.1446 11.8439-.6974 4.1848c-.0008.0049-.0017.0097-.0026.0145-.0988.5434-.6193.9038-1.1627.805l-11.36887-2.0671c-.37461-.0681-.67804-.343-.78264-.7091l-1.82479-6.3868c-.02553-.08934-.03848-.1818-.03848-.27472 0-.55228.44772-1 1-1h13.72588l.6132-2.62795c.1246-.53401.6007-.9118 1.149-.9118h2.0649c.6516 0 1.1799.52826 1.1799 1.17992 0 .65165-.5283 1.17991-1.1799 1.17991h-1.1286z"/><path d="m6.5 21c-.82843 0-1.5-.6716-1.5-1.5s.67157-1.5 1.5-1.5 1.5.6716 1.5 1.5-.67157 1.5-1.5 1.5zm9 0c-.8284 0-1.5-.6716-1.5-1.5s.6716-1.5 1.5-1.5 1.5.6716 1.5 1.5-.6716 1.5-1.5 1.5z" opacity=".8"/></g></svg>';

    $('.cart_btn-container').append($('.edy-ecommerce-shopping-cart-button').append(icoElement));
  };

  // FUNCTIONS INITIATIONS
  var initFrontPage = function() {
    // Add front page layout specific functions here.
    removeOptionalContent();
  };

  var initCommonPage = function() {
    // Add common page specific functions here.
  };

  var initBlogPage = function() {
  };

  var initPostPage = function() {
    // Add single post layout specific functions here.
  };

  var handleMenuTopPos = function() {
    if ($( window ).width() >= 900) {
      var topPos = $('.header_fixed').height() + 80;

      if ($('.semimodal-relative').length <= 0) {
        $('.semimodal_bottom').css({'top': topPos, 'margin-top': topPos + 16});
      }
    }
  };

  var handleDocument = function() {
    if ($('.form_field-cms input').length) {
      if ($('.form_field-cms input').val().length >= 1) {
        $('.form_field-cms input').closest('.form_field-cms').addClass('with-input');
      } else {
        $('.form_field-cms input').closest('.form_field-cms').removeClass('with-input');
      }
    }


    $(document).ready(function() {
      handleActivLangMenu();
      handleMenuTopPos();

      $('.header_title').keyup(function(e) {
        handleMenuTopPos();
      });

      $('.form_field-cms input').keyup(function(e) {
        if ($(this).val().length >= 1) {
          $(this).closest('.form_field-cms').addClass('with-input');
        } else {
          $(this).closest('.form_field-cms').removeClass('with-input');
        }
      });
    });
  };

  var handleActivLangMenu = function() {
    if ($( window ).width() >= 900) {
      $('.header_components-tablet .menu-language-toggle').removeClass('js-toggle-menu-language');
      $('.header_components-desktop .menu-language-toggle').addClass('js-toggle-menu-language');
    } else {
      $('.header_components-desktop .menu-language-toggle').removeClass('js-toggle-menu-language');
      $('.header_components-tablet .menu-language-toggle').addClass('js-toggle-menu-language');
    }
  };

  var init = function() {
    // Add site wide functions here.
    bindSideClicks();
    handleLanguageSwitch();
    handleElementsClick();
    toggleMainMenu();
    focusFormWithErrors();
    handleWindowResize();
    handleWindowScroll();
    bindLanguageMenuButttons();
    handleDocument();

    $(document).on('voog:shoppingcart:button:created', function() {
      buildCustomShoppingCartIcon();
    });

    if (editmode()) {
      wrapTables();
    }
  };

  // Enables the usage of the initiations outside this file.
  // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
  window.site = $.extend(window.site || {}, {
    initFrontPage: initFrontPage,
    initCommonPage: initCommonPage,
    initBlogPage: initBlogPage,
    initPostPage: initPostPage,
    bindSiteSearch: bindSiteSearch,
    bindLanguageMenuSettings: bindLanguageMenuSettings
  });

  // Initiates site wide functions.
  init();
})(jQuery);
