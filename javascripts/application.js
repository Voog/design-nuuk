// quantize.js, Copyright 2012 Shao-Chung Chen.
// Licensed under the MIT license (http://www.opensource.org/licenses/mit-license.php)

// Basic CoffeeScript port of the (MMCQ) Modified Media Cut Quantization
// algorithm from the Leptonica library (http://www.leptonica.com/).
// Return a color map you can use to map original pixels to the reduced palette.
// 
// Rewritten from the JavaScript port (http://gist.github.com/1104622)
// developed by Nick Rabinowitz under the MIT license.

// Generated by CoffeeScript 1.3.3
var MMCQ, PriorityQueue;

PriorityQueue = (function() {

  function PriorityQueue(comparator) {
    this.comparator = comparator;
    this.contents = [];
    this.sorted = false;
  }

  PriorityQueue.prototype.sort = function() {
    this.contents.sort(this.comparator);
    return this.sotred = true;
  };

  PriorityQueue.prototype.push = function(obj) {
    this.contents.push(obj);
    return this.sorted = false;
  };

  PriorityQueue.prototype.peek = function(index) {
    if (index == null) {
      index = this.contents.length - 1;
    }
    if (!this.sorted) {
      this.sort();
    }
    return this.contents[index];
  };

  PriorityQueue.prototype.pop = function() {
    if (!this.sorted) {
      this.sort();
    }
    return this.contents.pop();
  };

  PriorityQueue.prototype.size = function() {
    return this.contents.length;
  };

  PriorityQueue.prototype.map = function(func) {
    return this.contents.map(func);
  };

  return PriorityQueue;

})();

MMCQ = (function() {
  var ColorBox, ColorMap, cboxFromPixels, getColorIndex, getHisto, medianCutApply,
    _this = this;

  MMCQ.sigbits = 5;

  MMCQ.rshift = 8 - MMCQ.sigbits;

  function MMCQ() {
    this.maxIterations = 1000;
    this.fractByPopulations = 0.75;
  }

  getColorIndex = function(r, g, b) {
    return (r << (2 * MMCQ.sigbits)) + (g << MMCQ.sigbits) + b;
  };

  ColorBox = (function() {

    function ColorBox(r1, r2, g1, g2, b1, b2, histo) {
      this.r1 = r1;
      this.r2 = r2;
      this.g1 = g1;
      this.g2 = g2;
      this.b1 = b1;
      this.b2 = b2;
      this.histo = histo;
    }

    ColorBox.prototype.volume = function(forced) {
      if (!this._volume || forced) {
        this._volume = (this.r2 - this.r1 + 1) * (this.g2 - this.g1 + 1) * (this.b2 - this.b1 + 1);
      }
      return this._volume;
    };

    ColorBox.prototype.count = function(forced) {
      var b, g, index, numpix, r, _i, _j, _k, _ref, _ref1, _ref2, _ref3, _ref4, _ref5;
      if (!this._count_set || forced) {
        numpix = 0;
        for (r = _i = _ref = this.r1, _ref1 = this.r2; _i <= _ref1; r = _i += 1) {
          for (g = _j = _ref2 = this.g1, _ref3 = this.g2; _j <= _ref3; g = _j += 1) {
            for (b = _k = _ref4 = this.b1, _ref5 = this.b2; _k <= _ref5; b = _k += 1) {
              index = getColorIndex(r, g, b);
              numpix += this.histo[index] || 0;
            }
          }
        }
        this._count_set = true;
        this._count = numpix;
      }
      return this._count;
    };

    ColorBox.prototype.copy = function() {
      return new ColorBox(this.r1, this.r2, this.g1, this.g2, this.b1, this.b2, this.histo);
    };

    ColorBox.prototype.average = function(forced) {
      var b, bsum, g, gsum, hval, index, mult, r, rsum, total, _i, _j, _k, _ref, _ref1, _ref2, _ref3, _ref4, _ref5;
      if (!this._average || forced) {
        mult = 1 << (8 - MMCQ.sigbits);
        total = 0;
        rsum = 0;
        gsum = 0;
        bsum = 0;
        for (r = _i = _ref = this.r1, _ref1 = this.r2; _i <= _ref1; r = _i += 1) {
          for (g = _j = _ref2 = this.g1, _ref3 = this.g2; _j <= _ref3; g = _j += 1) {
            for (b = _k = _ref4 = this.b1, _ref5 = this.b2; _k <= _ref5; b = _k += 1) {
              index = getColorIndex(r, g, b);
              hval = this.histo[index] || 0;
              total += hval;
              rsum += hval * (r + 0.5) * mult;
              gsum += hval * (g + 0.5) * mult;
              bsum += hval * (b + 0.5) * mult;
            }
          }
        }
        if (total) {
          this._average = [~~(rsum / total), ~~(gsum / total), ~~(bsum / total)];
        } else {
          this._average = [~~(mult * (this.r1 + this.r2 + 1) / 2), ~~(mult * (this.g1 + this.g2 + 1) / 2), ~~(mult * (this.b1 + this.b2 + 1) / 2)];
        }
      }
      return this._average;
    };

    ColorBox.prototype.contains = function(pixel) {
      var b, g, r;
      r = pixel[0] >> MMCQ.rshift;
      g = pixel[1] >> MMCQ.rshift;
      b = pixel[2] >> MMCQ.rshift;
      return ((this.r1 <= r && r <= this.r2)) && ((this.g1 <= g && g <= this.g2)) && ((this.b1 <= b && b <= this.b2));
    };

    return ColorBox;

  })();

  ColorMap = (function() {

    function ColorMap() {
      this.cboxes = new PriorityQueue(function(a, b) {
        var va, vb;
        va = a.count() * a.volume();
        vb = b.count() * b.volume();
        if (va > vb) {
          return 1;
        } else if (va < vb) {
          return -1;
        } else {
          return 0;
        }
      });
    }

    ColorMap.prototype.push = function(cbox) {
      return this.cboxes.push({
        cbox: cbox,
        color: cbox.average()
      });
    };

    ColorMap.prototype.palette = function() {
      return this.cboxes.map(function(cbox) {
        return cbox.color;
      });
    };

    ColorMap.prototype.size = function() {
      return this.cboxes.size();
    };

    ColorMap.prototype.map = function(color) {
      var i, _i, _ref;
      for (i = _i = 0, _ref = this.cboxes.size(); _i < _ref; i = _i += 1) {
        if (this.cboxes.peek(i).cbox.contains(color)) {
          return this.cboxes.peek(i).color;
        }
        return this.nearest(color);
      }
    };

    ColorMap.prototype.cboxes = function() {
      return this.cboxes;
    };

    ColorMap.prototype.nearest = function(color) {
      var dist, i, minDist, retColor, square, _i, _ref;
      square = function(n) {
        return n * n;
      };
      minDist = 1e9;
      for (i = _i = 0, _ref = this.cboxes.size(); _i < _ref; i = _i += 1) {
        dist = Math.sqrt(square(color[0] - this.cboxes.peek(i).color[0]) + square(color[1] - this.cboxes.peek(i).color[1]) + square(color[2] - this.cboxes.peek(i).color[2]));
        if (dist < minDist) {
          minDist = dist;
          retColor = this.cboxes.peek(i).color;
        }
      }
      return retColor;
    };

    return ColorMap;

  })();

  getHisto = function(pixels) {
    var b, g, histo, histosize, index, pixel, r, _i, _len;
    histosize = 1 << (3 * MMCQ.sigbits);
    histo = new Array(histosize);
    for (_i = 0, _len = pixels.length; _i < _len; _i++) {
      pixel = pixels[_i];
      r = pixel[0] >> MMCQ.rshift;
      g = pixel[1] >> MMCQ.rshift;
      b = pixel[2] >> MMCQ.rshift;
      index = getColorIndex(r, g, b);
      histo[index] = (histo[index] || 0) + 1;
    }
    return histo;
  };

  cboxFromPixels = function(pixels, histo) {
    var b, bmax, bmin, g, gmax, gmin, pixel, r, rmax, rmin, _i, _len;
    rmin = 1e6;
    rmax = 0;
    gmin = 1e6;
    gmax = 0;
    bmin = 1e6;
    bmax = 0;
    for (_i = 0, _len = pixels.length; _i < _len; _i++) {
      pixel = pixels[_i];
      r = pixel[0] >> MMCQ.rshift;
      g = pixel[1] >> MMCQ.rshift;
      b = pixel[2] >> MMCQ.rshift;
      if (r < rmin) {
        rmin = r;
      } else if (r > rmax) {
        rmax = r;
      }
      if (g < gmin) {
        gmin = g;
      } else if (g > gmax) {
        gmax = g;
      }
      if (b < bmin) {
        bmin = b;
      } else if (b > bmax) {
        bmax = b;
      }
    }
    return new ColorBox(rmin, rmax, gmin, gmax, bmin, bmax, histo);
  };

  medianCutApply = function(histo, cbox) {
    var b, bw, doCut, g, gw, index, lookaheadsum, maxw, partialsum, r, rw, sum, total, _i, _j, _k, _l, _m, _n, _o, _p, _q, _ref, _ref1, _ref10, _ref11, _ref12, _ref13, _ref14, _ref15, _ref16, _ref17, _ref2, _ref3, _ref4, _ref5, _ref6, _ref7, _ref8, _ref9;
    if (!cbox.count()) {
      return;
    }
    if (cbox.count() === 1) {
      return [cbox.copy()];
    }
    rw = cbox.r2 - cbox.r1 + 1;
    gw = cbox.g2 - cbox.g1 + 1;
    bw = cbox.b2 - cbox.b1 + 1;
    maxw = Math.max(rw, gw, bw);
    total = 0;
    partialsum = [];
    lookaheadsum = [];
    if (maxw === rw) {
      for (r = _i = _ref = cbox.r1, _ref1 = cbox.r2; _i <= _ref1; r = _i += 1) {
        sum = 0;
        for (g = _j = _ref2 = cbox.g1, _ref3 = cbox.g2; _j <= _ref3; g = _j += 1) {
          for (b = _k = _ref4 = cbox.b1, _ref5 = cbox.b2; _k <= _ref5; b = _k += 1) {
            index = getColorIndex(r, g, b);
            sum += histo[index] || 0;
          }
        }
        total += sum;
        partialsum[r] = total;
      }
    } else if (maxw === gw) {
      for (g = _l = _ref6 = cbox.g1, _ref7 = cbox.g2; _l <= _ref7; g = _l += 1) {
        sum = 0;
        for (r = _m = _ref8 = cbox.r1, _ref9 = cbox.r2; _m <= _ref9; r = _m += 1) {
          for (b = _n = _ref10 = cbox.b1, _ref11 = cbox.b2; _n <= _ref11; b = _n += 1) {
            index = getColorIndex(r, g, b);
            sum += histo[index] || 0;
          }
        }
        total += sum;
        partialsum[g] = total;
      }
    } else {
      for (b = _o = _ref12 = cbox.b1, _ref13 = cbox.b2; _o <= _ref13; b = _o += 1) {
        sum = 0;
        for (r = _p = _ref14 = cbox.r1, _ref15 = cbox.r2; _p <= _ref15; r = _p += 1) {
          for (g = _q = _ref16 = cbox.g1, _ref17 = cbox.g2; _q <= _ref17; g = _q += 1) {
            index = getColorIndex(r, g, b);
            sum += histo[index] || 0;
          }
        }
        total += sum;
        partialsum[b] = total;
      }
    }
    partialsum.forEach(function(d, i) {
      return lookaheadsum[i] = total - d;
    });
    doCut = function(color) {
      var cbox1, cbox2, count2, d2, dim1, dim2, i, left, right, _r, _ref18, _ref19;
      dim1 = color + '1';
      dim2 = color + '2';
      for (i = _r = _ref18 = cbox[dim1], _ref19 = cbox[dim2]; _r <= _ref19; i = _r += 1) {
        if (partialsum[i] > (total / 2)) {
          cbox1 = cbox.copy();
          cbox2 = cbox.copy();
          left = i - cbox[dim1];
          right = cbox[dim2] - i;
          if (left <= right) {
            d2 = Math.min(cbox[dim2] - 1, ~~(i + right / 2));
          } else {
            d2 = Math.max(cbox[dim1], ~~(i - 1 - left / 2));
          }
          while (!partialsum[d2]) {
            d2++;
          }
          count2 = lookaheadsum[d2];
          while (!count2 && partialsum[d2 - 1]) {
            count2 = lookaheadsum[--d2];
          }
          cbox1[dim2] = d2;
          cbox2[dim1] = cbox1[dim2] + 1;
          // console.log("cbox counts: " + (cbox.count()) + ", " + (cbox1.count()) + ", " + (cbox2.count()));
          return [cbox1, cbox2];
        }
      }
    };
    if (maxw === rw) {
      return doCut("r");
    }
    if (maxw === gw) {
      return doCut("g");
    }
    if (maxw === bw) {
      return doCut("b");
    }
  };

  MMCQ.prototype.quantize = function(pixels, maxcolors) {
    var cbox, cmap, histo, iter, pq, pq2,
      _this = this;
    if ((!pixels.length) || (maxcolors < 2) || (maxcolors > 256)) {
      console.log("invalid arguments");
      return false;
    }
    histo = getHisto(pixels);
    cbox = cboxFromPixels(pixels, histo);
    pq = new PriorityQueue(function(a, b) {
      var va, vb;
      va = a.count();
      vb = b.count();
      if (va > vb) {
        return 1;
      } else if (va < vb) {
        return -1;
      } else {
        return 0;
      }
    });
    pq.push(cbox);
    iter = function(lh, target) {
      var cbox1, cbox2, cboxes, ncolors, niters;
      ncolors = 1;
      niters = 0;
      while (niters < _this.maxIterations) {
        cbox = lh.pop();
        if (!cbox.count()) {
          lh.push(cbox);
          niters++;
          continue;
        }
        cboxes = medianCutApply(histo, cbox);
        cbox1 = cboxes[0];
        cbox2 = cboxes[1];
        if (!cbox1) {
          console.log("cbox1 not defined; shouldn't happen");
          return;
        }
        lh.push(cbox1);
        if (cbox2) {
          lh.push(cbox2);
          ncolors++;
        }
        if (ncolors >= target) {
          return;
        }
        if ((niters++) > _this.maxIterations) {
          console.log("infinite loop; perhaps too few pixels");
          return;
        }
      }
    };
    iter(pq, this.fractByPopulations * maxcolors);
    pq2 = new PriorityQueue(function(a, b) {
      var va, vb;
      va = a.count() * a.volume();
      vb = b.count() * b.volume();
      if (va > vb) {
        return 1;
      } else if (va < vb) {
        return -1;
      } else {
        return 0;
      }
    });
    while (pq.size()) {
      pq2.push(pq.pop());
    }
    iter(pq2, maxcolors - pq2.size());
    cmap = new ColorMap;
    while (pq2.size()) {
      cmap.push(pq2.pop());
    }
    return cmap;
  };

  return MMCQ;

}).call(this);

// Generated by CoffeeScript 1.6.3
(function() {
  window.ColorExtract = (function() {
    function ColorExtract() {}

    ColorExtract.getColorMap = function(canvas, sx, sy, w, h, nc) {
      var index, indexBase, pdata, pixels, x, y, _i, _j, _ref, _ref1;
      if (nc == null) {
        nc = 8;
      }
      pdata = canvas.getContext("2d").getImageData(sx, sy, w, h).data;
      pixels = [];
      for (y = _i = sy, _ref = sy + h; _i < _ref; y = _i += 1) {
        indexBase = y * w * 4;
        for (x = _j = sx, _ref1 = sx + w; _j < _ref1; x = _j += 1) {
          index = indexBase + (x * 4);
          pixels.push([pdata[index], pdata[index + 1], pdata[index + 2]]);
        }
      }
      return (new MMCQ).quantize(pixels, nc);
    };

    ColorExtract.colorDist = function(a, b) {
      var square;
      square = function(n) {
        return n * n;
      };
      return square(a[0] - b[0]) + square(a[1] - b[1]) + square(a[2] - b[2]);
    };

    ColorExtract.extract = function(image, canvas, callback) {
      var bgColor, bgColorMap, bgPalette, color, dist, fgColor, fgColor2, fgColorMap, fgPalette, maxDist, rgbToCssString, _i, _j, _len, _len1;
      canvas.width = 25;
      canvas.height = 25;
      canvas.getContext("2d").drawImage(image, 0, 0, canvas.width, canvas.height);
      bgColorMap = ColorExtract.getColorMap(canvas, 0, 0, canvas.width, canvas.height, 4);
      bgPalette = bgColorMap.cboxes.map(function(cbox) {
        return {
          count: cbox.cbox.count(),
          rgb: cbox.color
        };
      });
      bgPalette.sort(function(a, b) {
        return b.count - a.count;
      });
      bgColor = bgPalette[0].rgb;
      fgColorMap = ColorExtract.getColorMap(canvas, 0, 0, image.width, image.height, 10);
      fgPalette = fgColorMap.cboxes.map(function(cbox) {
        return {
          count: cbox.cbox.count(),
          rgb: cbox.color
        };
      });
      fgPalette.sort(function(a, b) {
        return b.count - a.count;
      });
      maxDist = 0;
      for (_i = 0, _len = fgPalette.length; _i < _len; _i++) {
        color = fgPalette[_i];
        dist = ColorExtract.colorDist(bgColor, color.rgb);
        if (dist > maxDist) {
          maxDist = dist;
          fgColor = color.rgb;
        }
      }
      maxDist = 0;
      for (_j = 0, _len1 = fgPalette.length; _j < _len1; _j++) {
        color = fgPalette[_j];
        dist = ColorExtract.colorDist(bgColor, color.rgb);
        if (dist > maxDist && color.rgb !== fgColor) {
          maxDist = dist;
          fgColor2 = color.rgb;
        }
      }
      rgbToCssString = function(color) {
        return "rgb(" + color[0] + ", " + color[1] + ", " + color[2] + ")";
      };
      return callback({
        bgColor: rgbToCssString(bgColor),
        fgColor: rgbToCssString(fgColor),
        fgColor2: rgbToCssString(fgColor2)
      });
    };

    return ColorExtract;

  })();

}).call(this);

;(function($) {
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

  var editmode = function () {
    return $('html').hasClass('editmode');
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
      };
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

  // Returns the suitable version of the image depending on the viewport width.
  var getImageByWidth = function(sizes, targetWidth) {
    var prevImage;

    for (var i = 0, max = sizes.length; i < max; i++) {
      if (sizes[i].width < targetWidth) {
        return prevImage || sizes[i];
      }
      prevImage = sizes[i];
    }
    // Makes sure that smallest is returned if all images bigger than targetWidth.
    return sizes[sizes.length - 1];
  };

  var bgPickerImageSizesContains = function(sizes, url) {
    for (var i = sizes.length; i--;) {
      if (url.indexOf(sizes[i].url.trim()) > -1) {
        return true;
      }
    }
    return false;
  };

  // Checks the lightness sum of header background image and color and sets the lightness class depending on it's value.
  var bgPickerContentLightnessClass = function(bgPickerArea, combinedLightness) {
    if (combinedLightness >= 0.5) {
      $(bgPickerArea).find('> .js-background-type').addClass('light-background').removeClass('dark-background');
    } else {
      $(bgPickerArea).find('> .js-background-type').addClass('dark-background').removeClass('light-background');
    }
  };

  // Header background image and color preview logic function.
  var bgPickerPreview = function(bgPickerArea, data, bgPicker) {
    // Defines the variables used in preview logic.

    var bgPickerImagePrevious = $(bgPickerArea).css('background-image'),
        bgPickerImageSuitable = data.imageSizes ? getImageByWidth(data.imageSizes, $(window).width()) : null,
        bgPickerImage = (data.image && data.image !== '') ? 'url(' + bgPickerImageSuitable.url + ')' : 'none',
        bgPickerImageSizes = (data.imageSizes && data.imageSizes !== '') ? data.imageSizes : null,
        bgPickerColor = (data.color && data.color !== '') ? data.color : 'rgba(0,0,0,0)',
        bgPickerColorDataLightness = (data.colorData && data.colorData !== '') ? data.colorData.lightness : 1,
        colorExtractImage = $('<img>'),
        colorExtractCanvas = $('<canvas>'),
        colorExtractImageUrl = (data.image && data.image !== '') ? data.image : null;

    if (colorExtractImageUrl) {
      if (bgPickerImageSizesContains(bgPickerImageSizes, bgPickerImagePrevious)) {
        bgPicker.imageColor = bgPicker.imageColor ? bgPicker.imageColor : defaultImageColor;
        bgPicker.combinedLightness = getCombinedLightness(bgPicker.imageColor, bgPickerColor);
        bgPickerContentLightnessClass(bgPickerArea, bgPicker.combinedLightness);

      } else {
        colorExtractImage.attr('src', colorExtractImageUrl.replace(/.*\/(photos|voogstock)/g,'/photos'));
        colorExtractImage.on('load', function() {
          ColorExtract.extract(colorExtractImage[0], colorExtractCanvas[0], function(data) {
            bgPicker.imageColor = data.bgColor ? data.bgColor : 'rgba(255,255,255,1)';
            bgPicker.combinedLightness = getCombinedLightness(bgPicker.imageColor, bgPickerColor);
            bgPickerContentLightnessClass(bgPickerArea, bgPicker.combinedLightness);

          });
        });
      };
    } else {
      bgPicker.imageColor = 'rgba(255,255,255,1)';
      bgPicker.combinedLightness = getCombinedLightness(bgPicker.imageColor, bgPickerColor);
      bgPickerContentLightnessClass(bgPickerArea, bgPicker.combinedLightness);
    };

    // Updates the bgPickerContent background image and background color.
    $(bgPickerArea).find('.js-background-image').first().css({'background-image' : bgPickerImage});
    $(bgPickerArea).find('.js-background-color').first().css({'background-color' : bgPickerColor});
  };

  var normalizeValue = function(value) {
    if (value == null || (typeof value == 'string' && value.match(/^[\\'"]+$/))) {
      return '';
    } else {
      return value;
    }
  };

  // Header background image and color save logic function.
  var bgPickerCommit = function(dataBgKey, data, bgPicker, pageType) {
    var commitData = $.extend(true, {}, data);
    commitData.image = data.image || '';
    commitData.imageSizes = normalizeValue(data.imageSizes);
    commitData.color = data.color || '';
    commitData.combinedLightness = bgPicker.combinedLightness;

    if (pageType === 'articlePage') {
      Edicy.articles.currentArticle.setData(dataBgKey, commitData);
    } else {
      pageData.set(dataBgKey, commitData);
    };
  };

  var colorSum = function(bgColor, fgColor) {
    if (bgColor && fgColor) {
      if (typeof bgColor == 'string') {
        bgColor = bgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(bgColor, function(n, x) {bgColor[n] = +x;});
      }
      if (typeof fgColor == 'string') {
        fgColor = fgColor.replace(/rgba?\(/,'').replace(/\)/,'').split(',');
        $.each(fgColor, function(n, x) {fgColor[n] = +x;});
      }
      if (typeof bgColor == 'object' && bgColor.hasOwnProperty('length')) {
        if (bgColor.length == 3) { bgColor.push(1.0); }
      }
      if (typeof fgColor == 'object' && fgColor.hasOwnProperty('length')) {
        if (fgColor.length == 3) { fgColor.push(1.0); }
      }
      var result = [0, 0, 0, 0];
      result[3] = 1 - (1 - fgColor[3]) * (1 - bgColor[3]);
      if (result[3] === 0) { result[3] = 1e-6; }
      result[0] = Math.min(fgColor[0] * fgColor[3] / result[3] + bgColor[0] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[1] = Math.min(fgColor[1] * fgColor[3] / result[3] + bgColor[1] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      result[2] = Math.min(fgColor[2] * fgColor[3] / result[3] + bgColor[2] * bgColor[3] * (1 - fgColor[3]) / result[3], 255);
      return $.map(result, function(e) { return Math.floor(e); });
    }
  };

  var getCombinedColor = function(bgColor, fgColor) {
    var sum = colorSum(bgColor || [255,255,255,1], fgColor || [255,255,255,1]);
    return sum;
  };

  var getCombinedLightness = function(bgColor, fgColor) {
    var combinedColor = getCombinedColor(bgColor, fgColor);
    var color = Math.round(((+combinedColor[0]) * 0.2126 + (+combinedColor[1]) * 0.7152 + (+combinedColor[2]) * 0.0722) / 2.55) / 100;
    return color;
  };

  var bgPickerColorScheme = function(lightness) {
    if (typeof lightness != 'undefined') {
      if (lightness > 0.6) {
        $('.header-wrapper').addClass('light').removeClass('dark');
      } else {
        $('.header-wrapper').addClass('dark').removeClass('light');
      }
    }
  };

  // ===========================================================================
  // Binds editmode image drop areas.
  // ===========================================================================
  var bindContentItemImgDropAreas = function(placeholderText) {
    $('.js-content-item-img-drop-area').each(function(index, imgDropAreaTarget) {
      var $imgDropAreaTarget = $(imgDropAreaTarget),
          $contentItemBox = $imgDropAreaTarget.closest('.js-content-item-box'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          itemData = new Edicy.CustomData({
            type: itemType,
            id: itemId
          });

      var imgDropArea = new Edicy.ImgDropArea($imgDropAreaTarget, {
        positionable: false,
        target_width: 1280,
        placeholder: '<div class="edy-img-drop-area-placeholder">' + placeholderText + '</div>',
        removeBtn: '<div class="edy-img-drop-area-remove-image">' +
                      '<div class="edy-img-drop-area-remove-image-ico">' +
                        '<svg width="16" height="20" viewBox="0 0 26 30" xmlns="http://www.w3.org/2000/svg">' +
                          '<g fill-rule="nonzero" fill="currentColor">' +
                            '<g transform="translate(2 5)">' +
                              '<path d="M0 .997h2V21c0 1 1 2 2 2h14c1 0 2-1 2-2V1h2v20c0 2.25-1.75 4-4 4H4c-2.25 0-4-1.75-4-4V.997z"/>' +
                              '<rect x="10" y="4" width="2" height="16" rx="1"/>' +
                              '<rect x="5" y="4" width="2" height="16" rx="1"/>' +
                              '<rect x="15" y="4" width="2" height="16" rx="1"/>' +
                            '</g>' +
                            '<path d="M26 4v2H0V4h7V2c0-1 1-2 2-2h8c1 0 2 1 2 2v2h7zM9 4h8V3c0-.5-.5-1-1-1h-6c-.5 0-1 .5-1 1v1z"/>' +
                          '</g>' +
                        '</svg>' +
                      '</div>' +
                    '</div>',

        change: function(image) {
          var imageId;
          var $cropToggleButton = $contentItemBox.find('.js-toggle-crop-state');
          $imgDropAreaTarget
            .removeClass('is-cropped')
            .addClass('not-cropped')
            .css('opacity', .1)
          ;

          if (image) {
            imageId = image.original_id;
            itemData.set('item_image', image);

            $contentItemBox
              .removeClass('without-image is-loaded with-error')
              .addClass('with-image not-loaded')
            ;

            $cropToggleButton
              .removeClass('is-hidden')
              .addClass('is-visible')
            ;
          } else {
            imageId = null;

            $contentItemBox
              .removeClass('with-image is-loaded with-error')
              .addClass('without-image not-loaded')
            ;

            $cropToggleButton
              .addClass('is-hidden')
              .removeClass('is-visible')
            ;
            $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 0);
          }

          itemData.set('image_crop_state', 'not-cropped');
          $contentItemBox.removeClass('not-loaded with-error').addClass('is-loaded');
          $contentItemBox.find('.edy-img-drop-area-placeholder').css('opacity', 1);
          $imgDropAreaTarget.css('opacity', 1);
        }
      });
    });
  };

  // ===========================================================================
  // Sets functions that will be initiated globally when resizing the browser
  // window.
  // ===========================================================================
  var bindContentItemImageCropToggle = function() {
    $('.js-toggle-crop-state').on('click', function() {
      var $contentItemBox = $(this).closest('.js-content-item-box'),
          $imgDropAreaTarget = $contentItemBox.find('.js-content-item-img-drop-area'),
          itemId = $contentItemBox.data('item-id'),
          itemType = $contentItemBox.data('item-type'),
          itemData = new Edicy.CustomData({
            type: itemType,
            id: itemId
          }),
          imageCropState;

      if ($imgDropAreaTarget.hasClass('is-cropped')) {
        $imgDropAreaTarget
          .removeClass('is-cropped')
          .addClass('not-cropped')
        ;

        imageCropState = 'not-cropped';
      } else {
        $imgDropAreaTarget
          .removeClass('not-cropped')
          .addClass('is-cropped')
        ;

        imageCropState = 'is-cropped';
      }

      itemData.set('image_crop_state', imageCropState);
    });
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

    $('.js-layout_settings-btn').click(function() {
      $('body').toggleClass('layout_settings-visible');
    });

    var toggleSearch = function() {
      $('html').removeClass('mobilemenu-open');
      $('.js-search').toggleClass('active');
      $('.js-search').hasClass('active') ? $('.js-search-input').focus() : '';
      $('html').toggleClass('search-open');
      $('html').removeClass('menu-language-popover-open');
    }

    var toggleMenuPopover = function() {
      $('.menu_popover').toggleClass('active');
    }

    $('.js-menu-popover').click(function() {
      toggleMenuPopover();
    });

    handleFocus($('.js-menu-popover'), toggleMenuPopover);

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

    $(popoverMenu).css({
      top: '40px',
      right: Math.round($(window).width() - $popoverButton.offset().left - $popoverButton.outerWidth())
    });
  };

  // ===========================================================================
  // Toggles language menu mode.
  // ===========================================================================
  var bindLanguageMenuSettings = function(languageMenuValuesObj) {
    if (!('type' in languageMenuValuesObj)) {
      languageMenuValuesObj.type = 'popover';
    }

    if (!('item_state' in languageMenuValuesObj)) {
      languageMenuValuesObj.item_state = 'names_only';
    }

    $('.js-menu-language-settings-toggle').each(function(index, languageMenuSettingsButton) {
      var langSettingsEditor = new Edicy.SettingsEditor(languageMenuSettingsButton, {
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

        containerClass: ['js-menu-language-settings-popover', 'js-prevent-sideclick'],

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
          siteData.set('settings_language_menu', data);
        }
      });
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

  var bindCustomTexteditorStyles = function() {
    window.edy = window.edy || [];
    edy.push(['texteditorStyles', {name: 'Button', tagname:'a', attribute: {'href': '#'}, classname: 'custom-btn', toggle: true}]);
  };

  // Initiates the table horisontal scroll function when window is resized.
  var handleWindowResize = function() {
    $(window).resize(debounce(function() {
      handleMenuPos();
      if (languageMenuPopoverOpen()) {
        positionPopoverMenu('.js-toggle-menu-language', '.js-menu-language-popover');
      }
    }, 25));
  };

  var handleMenuPos = function() {
    $('.header_bottom').css('top', $('.header_fixed').innerHeight() + 60);
  };

  var handleWindowScroll = function() {
    window.addEventListener('scroll', function(e) {
      var wrapperHeight = $('.header_fixed').height();

      if (window.scrollY > wrapperHeight) {
        $('.header_fixed').addClass('scroll');
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
          togglePopover();
        });
      }
    }
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

  var init = function() {
    // Add site wide functions here.
    bindSideClicks();
    handleLanguageSwitch();
    handleElementsClick();
    toggleMainMenu();
    focusFormWithErrors();
    handleWindowResize();
    handleWindowScroll();
    handleMenuPos();
    bindLanguageMenuButttons();

    if (editmode()) {
      bindCustomTexteditorStyles();
    } else {
      wrapTables();
    }
  };

  // Enables the usage of the initiations outside this file.
  // For example add "<script>site.initBlogPage();</script>" at the end of the "Blog & News" page to initiate blog listing view functions.
  window.site = $.extend(window.site || {}, {
    bgPickerPreview: bgPickerPreview,
    bgPickerCommit: bgPickerCommit,
    bgPickerColorScheme: bgPickerColorScheme,
    initFrontPage: initFrontPage,
    initCommonPage: initCommonPage,
    initBlogPage: initBlogPage,
    initPostPage: initPostPage,
    bindContentItemImgDropAreas: bindContentItemImgDropAreas,
    bindContentItemImageCropToggle: bindContentItemImageCropToggle,
    bindSiteSearch: bindSiteSearch,
    bindLanguageMenuSettings: bindLanguageMenuSettings
  });

  // Initiates site wide functions.
  init();
})(jQuery);
