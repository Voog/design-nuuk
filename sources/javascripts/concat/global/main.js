;(function ($) {
  var editmode = function () {
    return $('html').hasClass('editmode');
  };

  // ===========================================================================
  // Binds site search functionality.
  // ===========================================================================
  var bindSiteSearch = function (searchForm, languageCode, noResultsString) {
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
  var debounce = function (func, wait, immediate) {
    var timeout;
    return function () {
      var context = this,
        args = arguments;
      var later = function () {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  var bindSideClicks = function () {
    $('.container, .bg_img-cover, .content_wrap, .header_fixed, swiper-container').on('mousedown', function (event) {
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

    $('body').click(function (event) {
      if (
        !$(event.target).closest('.layout_settings-btn, .edy-settings-editor, .layout_settings-btn--container').length
      ) {
        $('body').removeClass('layout_settings-visible');
      }
    });
  };

  // Switches the site language to the selected value from the language menu.
  var handleLanguageSwitch = function () {
    $('.menu-lang').find('.menu').change(function () {
      window.location = $(this).find(':selected').val();
    });
  };

  // Shows/hides the popover main menu (visible on smalles screens).
  var toggleMainMenu = function () {
    $('.js-menu-btn, .js-close-menu').click(function () {
      $('.js-semimodal-toggle').toggleClass('semimodal-open');
    });
  };

  // Removes optional content elements if element doesn't have any content.
  var removeOptionalContent = function () {
    optionalContent = $('.js-content-optional');
    $.each($(optionalContent), function () {
      optionalContentLength = $(this).text().trim().length;

      if (!optionalContentLength > 0) {
        $(this).remove();
      }
    });
  };

  // Scrolls to the comment_form if comment submit failed (to show the error messages to the user)
  var focusFormWithErrors = function () {
    $(document).ready(function () {
      if ($('.comment_form').hasClass('form_with_errors')) {
        $('html, body').scrollTop($('.comment_form').offset().top);
      } else if ($('form').find('.form_error, .form_notice').length > 0) {
        $('html, body').scrollTop($('.form_error, .form_notice').closest('form').offset().top);
      }
    });
  };

  // Wraps tables in the container.
  // TODO: remove if edicy is going to wrap table with the container.
  var wrapTables = function () {
    $('.content-formatted table').wrap('<div class="table-container"></div>');
  };

  var handleFocus = function (el, func) {
    el.focus(function () {
      $(window).keyup(function (e) {
        var code = (e.keyCode ? e.keyCode : e.which);
        if (code == 9) {
          func()
        }
      });
    });
  }

  var handleElementsClick = function () {
    if ($('.js-search').hasClass('active')) {
      $('.js-search').removeClass('active');
      $('.search-btn').removeClass('open');
    }

    $('.js-read-more-comments').click(function () {
      togglecomments();
    });

    $('.js-cart-btn').click(function () {
      if ($(this).data('product-id')) {
        Voog.ShoppingCart.addProductById($(this).data('product-id'))
      }
    });

    var togglecomments = function () {
      var hiddenComments = $('.comments_secondary .comment');
      var hiddenCommentsHeight = hiddenComments.outerHeight() * hiddenComments.length;
      $('.comments_secondary').toggleClass('comments_hidden');

      if ($('.comments_secondary.comments_hidden').length) {
        $('.comments_secondary').css('max-height', 0);
      } else {
        $('.comments_secondary').css('max-height', hiddenCommentsHeight);
      }
    }

    var toggleSearch = function () {
      $('html').removeClass('mobilemenu-open');
      $('.js-search').toggleClass('active');
      $('.js-search').hasClass('active') ? $('.js-search-input').focus() : '';
      $('html').toggleClass('search-open');
      $('html').removeClass('menu-language-popover-open');
    }

    var toggleImageSettingsPopover = function () {
      $('.js-image-settings-popover').toggleClass('active');
    }

    $('.js-toggle-image-settings').click(function () {
      toggleImageSettingsPopover();
    });

    handleFocus($('.js-toggle-image-settings'), toggleImageSettingsPopover);

    var toggleMenuDropdown = function (data_url) {
      $('div[data-url="' + data_url + '"]:visible').toggleClass("active");
    }

    $('.menu-main').on('mouseenter mouseleave', '.dd-arrow', function () {
      let popoverDiv = $(this).children()[1];

      if ($('header').hasClass('menu-top') && window.innerWidth > 900 && $(popoverDiv).find('.menu').children(':visible').length > 0) {
        let data_url = $(this).data('url');
        toggleMenuDropdown(data_url);
      }
    });

    $('.js-menu-popover-btn').on('click', function (e) {
      setTimeout(function () {
        toggleMenuPopover();
        checkIfDropdownEmpty();
      })
    });

    var toggleMenuPopover = function () {
      $('.menu_popover').toggleClass('active');
    }

    $('.editor_default-btn').click(function () {
      $(this).closest('.editor_default-container').addClass('active');
    });

    handleFocus($('.js-menu-popover-btn'), toggleMenuPopover);

    handleFocus($('.js-search-toggle-btn'), toggleSearch);

    $('.js-search-toggle-btn').click(function () {
      toggleSearch();
    });

    $('.js-search-input').on('input', function () {
      var searchCleanBtn = $(this).parent().next();

      if ($(this).val().length > 1) {
        searchCleanBtn.addClass('active');
      } else {
        searchCleanBtn.removeClass('active');
      }
    });

    $('.js-search-reset-btn').click(function () {
      $('html').removeClass('search-open');
      $('.js-search').removeClass('active');
    });
  };

  // ===========================================================================
  // Function to detect if site language menu popover is open.
  // ===========================================================================
  var languageMenuPopoverOpen = function () {
    return $('html').hasClass('menu-language-popover-open');
  };

  // ===========================================================================
  // Toggles language menu mode.
  // ===========================================================================
  var bindLanguageMenuSettings = function (languageMenuValuesObj, dataKey) {
    if (!('type' in languageMenuValuesObj)) {
      languageMenuValuesObj.type = 'popover';
    }

    if (!('item_state' in languageMenuValuesObj)) {
      languageMenuValuesObj.item_state = 'names_only';
    }

    var langSettingsEditor = new Edicy.SettingsEditor($('.js-menu-language-settings-toggle').get(0), {
      menuItems: [{
        "titleI18n": "show",
        "type": "radio",
        "key": "item_state",
        "list": [{
            "titleI18n": "flags_only",
            "value": "flags_only"
          },
          {
            "titleI18n": "names_only",
            "value": "names_only"
          }
        ]
      }],

      buttonTitleI18n: "settings",
      values: languageMenuValuesObj,
      containerClass: ['editor_default', 'js-prevent-sideclick'],
      preview: function (data) {
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

        this.setPosition();
      },

      commit: function (data) {
        siteData.set(dataKey, data);
      }
    });
  };

  // ===========================================================================
  // Load images only when they are close or appearing in the
  // viewport.
  // ===========================================================================
  var callback_loaded = function (element) {
    var $contentItemBox = $(element).closest('.js-content-item-box');
    $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');
  };

  var bindContentItemImageLazyload = new LazyLoad({
    threshold: 300,
    elements_selector: ".js-lazyload",
    callback_loaded: callback_loaded
  });

  var handleProductPageContent = function () {
    $(document).ready(function () {
      changeProductImagePos();
    });

    $(window).resize(debounce(function () {
      changeProductImagePos();
    }, 25));

    var changeProductImagePos = function () {
      var paroductImage = $('.js-product-page-image');
      var paroductImageWrap = $('.js-product-page-image-wrap');
      var buyBtnContent = $('.js-buy-btn-content');

      if ($('.js-buy-btn-content .edy-buy-button-container').length >= 1) {
        if ($(window).width() <= 752) {
          if ($('.js-buy-btn-content .js-product-page-image').length <= 0) {
            buyBtnContent.prepend(paroductImage);
          }
        } else {
          if ($('.js-product-page-image-wrap .js-product-page-image').length <= 0) {
            paroductImageWrap.prepend(paroductImage);
          }
        }
      }
    }
  }

  var checkIfDropdownEmpty = function () {
    $.each($('.dd-arrow'), function () {
      let popoverDiv = $(this).children()[1];
      if ($(popoverDiv).find('.dropdown_menu-popover .menu').children(':visible').length > 0) {
        $(this).attr('data-arrow', 'active');
      } else {
        $(this).attr('data-arrow', 'inactive');
      }
    })
  }

  // Initiates the table horisontal scroll function when window is resized.
  var handleWindowResize = function () {
    $(window).resize(debounce(function () {
      handleActivLangMenu();
      handleMenuTopPos();
    }, 25));
  };

  var handleWindowScroll = function () {
    window.addEventListener('scroll', function (e) {
      var wrapperHeight = $('.header_fixed').height();
      $('.t-sticky').css('top', $('.header_fixed').outerHeight() + 32);

      if (window.scrollY > wrapperHeight) {
        $('.header_fixed:not(.relative)').addClass('scroll');
        $('body').addClass('scroll');
      } else {
        $('.header_fixed').removeClass('scroll');
        $('body').removeClass('scroll');
      }
    });
  };

  var bindLanguageMenuButttons = function () {
    // Toggles language menu popover.
    var togglePopover = function () {
      var $html = $('html');

      $html.toggleClass('menu-language-popover-open');
      if ($html.hasClass('menu-main-opened') || $html.hasClass('site-search-opened')) {
        $html.removeClass('menu-main-opened site-search-opened');
      }
    }

    if (editmode()) {
      $('.js-toggle-menu-language .menu-language-btn').click(function () {
        togglePopover();
      });
    } else {
      if ("ontouchstart" in document.documentElement) {
        handleFocus($('.js-toggle-menu-language'), togglePopover);
        $('.js-toggle-menu-language .menu-language-btn').click(function () {
          togglePopover();
        });
      }
    }
  };

  var getCartItemsCount = function () {
    var cartItemsCount = 0;
    var cartItems = Voog.ShoppingCart.getContents().items;

    for (var i = 0; i < cartItems.length; i++) {
      cartItemsCount += parseInt(cartItems[i].quantity);
    }

    return cartItemsCount;
  }

  var buildCustomShoppingCartIcon = function () {
    // Emitted when the shopping cart button element is added to the DOM.
    $(document).on('voog:shoppingcart:button:created', function () {
      if (getCartItemsCount() >= 1) {
        $('.cart_btn').addClass('visible');
        $('.cart_btn .cart_btn-count').text(getCartItemsCount());
      } else {
        $('.cart_btn').removeClass('visible');
      }
    });

    var handleProductCountChange = function (e, addProduct) {
      var itemsCount = getCartItemsCount();
      var counterElement = $('.cart_btn .cart_btn-count');
      var prevCount = parseInt(counterElement.text()) || 0;
      var isCartModalOpen = $('.edy-ecommerce-modal-open').length >= 1;

      if (itemsCount >= 1 || addProduct == true) {
        if (this.timer != null) {
          clearTimeout(this.timer);
        }

        if (itemsCount > prevCount && !isCartModalOpen) {
          $('.cart_popover-content--product').text(e.detail.product_name);
          $(':not(body.edy-ecommerce-modal-open) .cart_popover-wrap').addClass('visible');

          this.timer = setTimeout(function () {
            $('.cart_popover-wrap').removeClass('visible');
          }, 3000);
        }

        $('.cart_btn').addClass('visible');
        counterElement.text(itemsCount);
      } else {
        $('.cart_btn').removeClass('visible');
        counterElement.text('');
      }
    }

    var handleProductCountSync = function (e) {
      var itemsCount = getCartItemsCount();
      var counterElement = $('.cart_btn .cart_btn-count');

      if (itemsCount >= 1) {
        $('.cart_btn').addClass('visible');
        counterElement.text(itemsCount);
      } else {
        $('.cart_btn').removeClass('visible');
        counterElement.text('');
      }
    }

    // Emitted when a product is removed from the shopping cart
    $(document).on('voog:shoppingcart:removeproduct', function (e) {
      handleProductCountChange(e, false);
    });

    // Emitted when a product's quantity changes
    $(document).on('voog:shoppingcart:changequantity', function (e) {
      handleProductCountChange(e, true);
    });

    // Emitted when a new product is added to the cart
    $(document).on('voog:shoppingcart:addproduct', function (e) {
      handleProductCountChange(e, true);
    });

    $(document).on('voog:shoppingcart:contentschanged', function (e) {
      handleProductCountSync(e);
    })

    $('.cart_btn, .cart_popover-wrap').click(function () {
      Voog.ShoppingCart.showCart()
    });
  };

  var initProductListPage = function () {
    if ($(".js-product-whith-data").length >= 2) {
      $(".product_filters").removeClass('d-none');
    }

    function fadeAnimation(wrapper) {
      wrapper.find('.js-product-item').each(function () {
        var item = $(this);
        var delay = item.index();
        item.css({
          'opacity': '0',
          'transition': 'none'
        });
        setTimeout((function () {
          item.animate({
            'opacity': '1'
          }, 500);
        }), delay * 40);
      });
    }

    $(".product_list-search").on("keyup", function () {
      var value = $(this).val().toLowerCase();
      fadeAnimation($('.product_list'));
      $(".product_list .js-product-item").filter(function () {
        $(this).toggle($(this).attr("data-title").toLowerCase().indexOf(value) > -1)
      });
    });

    $('.product_list-filter').on('change', function () {
      if (this.value === 'price-default') {
        var $wrapper = $('.product_list');
        fadeAnimation($wrapper);
        $wrapper.find('.js-product-item').sort(function (a, b) {
            return +a.dataset.index - +b.dataset.index;
          })
          .prependTo($wrapper);
      } else if (this.value === 'price-ascending') {
        var $wrapper = $('.product_list');
        fadeAnimation($wrapper);
        $wrapper.find('.js-product-item[data-price]').sort(function (a, b) {
            return +a.dataset.price - +b.dataset.price;
          })
          .prependTo($wrapper);
      } else if (this.value === 'price-descending') {
        var $wrapper = $('.product_list');
        fadeAnimation($wrapper);
        $wrapper.find('.js-product-item[data-price]').sort(function (a, b) {
            return +b.dataset.price - +a.dataset.price;
          })
          .prependTo($wrapper);
      } else if (this.value === 'title-ascending') {
        var $wrapper = $('.product_list');
        fadeAnimation($wrapper);
        $wrapper.find('.js-product-item').sort(function (a, b) {
            if (a.dataset.title < b.dataset.title) {
              return -1;
            }
            if (a.dataset.title > b.dataset.title) {
              return 1;
            }
            return 0;
          })
          .prependTo($wrapper);
      } else if (this.value === 'title-descending') {
        var $wrapper = $('.product_list');
        fadeAnimation($wrapper);
        $wrapper.find('.js-product-item').sort(function (a, b) {
            if (a.dataset.title < b.dataset.title) {
              return 1;
            }
            if (a.dataset.title > b.dataset.title) {
              return -1;
            }
            return 0;
          })
          .prependTo($wrapper);
      }
    });
  };

  var handleMenuTopPos = function () {
    if ($(window).width() >= 900) {
      var topPos = $('.header_fixed').height() + 80;

      if ($('.semimodal-relative').length <= 0) {
        $('.semimodal_bottom').css({
          'top': topPos,
          'margin-top': topPos + 16
        });
      }

      if ($('.js-menu-language').length >= 1) {
        $('.header_components-menu--top').prepend($('.js-menu-language'));
      }
    } else {
      if ($('.js-menu-language').length >= 1) {
        $('.header_components-semimodal').append($('.js-menu-language'));
      }
    }
  };

  var handleDocument = function () {
    $(document).ready(function () {
      handleActivLangMenu();
      handleMenuTopPos();

      $('.header_title').keyup(function (e) {
        handleMenuTopPos();
      });

      $('.js-menu-popover-btn').one("click", function () {
        if (editmode()) {
          $('.semimodal_bottom .menu .menu-item.lvl-1').clone().appendTo('.menu_popover-list');
        } else {
          // Popover has items starting from 6th
          $('.semimodal_bottom .menu .menu-item.lvl-1:nth-of-type(n+6)').clone().appendTo('.menu_popover-list');
        }
      });
    });
  };

  var handleActivLangMenu = function () {
    if ($(window).width() >= 900) {
      $('.header_components-semimodal .menu-language-toggle').removeClass('js-toggle-menu-language');
      $('.header_components-menu--top .menu-language-toggle').addClass('js-toggle-menu-language');
    } else {
      $('.header_components-menu--top .menu-language-toggle').removeClass('js-toggle-menu-language');
      $('.header_components-semimodal .menu-language-toggle').addClass('js-toggle-menu-language');
    }
  };
  var setBlockColumnsWidth = function () {
    $('.js-block').each(function () {
      var id = $(this).data('id');
      var maxWidth = $(this).data('max-width');
      var minWidth = $(this).data('min-width');
      var colItem = $('.column-container-' + id + ' .col-item');

      if (minWidth > colItem.closest(".editor_default-container").width()) {
        colItem.css('min-width', '100%');
      } else {
        colItem.css('min-width', minWidth);
      }

      if ($(window).width() >= 720) {
        $('.block-' + id).css({
          width: maxWidth + '%'
        });
      } else {
        $('.block-' + id).css({
          width: '100%'
        });
      }
    });
  };

  var handleBlockColumnsWidth = function (params) {
    window.addEventListener('DOMContentLoaded', function (event) {
      setBlockColumnsWidth();

      $(window).resize(function () {
        setBlockColumnsWidth()
      });
    });
  }

  var init = function () {
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
    buildCustomShoppingCartIcon();
    handleBlockColumnsWidth();
    checkIfDropdownEmpty();


    if (!editmode()) {
      wrapTables();
    }
  };

  // Enables the usage of the initiations outside this file.
  // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
  window.site = $.extend(window.site || {}, {
    initProductListPage: initProductListPage,
    bindSiteSearch: bindSiteSearch,
    bindLanguageMenuSettings: bindLanguageMenuSettings,
    handleProductPageContent: handleProductPageContent,
    setBlockColumnsWidth: setBlockColumnsWidth
  });

  // Initiates site wide functions.
  init();
})(jQuery);
