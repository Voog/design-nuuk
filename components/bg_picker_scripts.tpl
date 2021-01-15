<script type="text/javascript">
  $(function() {
    $('.bg-picker').each(function() {
      var $picker = $(this);
      var pickerOpts = $picker.data();

      var opts = {
        picture: pickerOpts.picture,
        color: pickerOpts.color,
        showAlpha: true,

        preview: function(data) {
          if (pickerOpts.image_elem || pickerOpts.color_elem) {
            var $imageEl = $(pickerOpts.image_elem);
            var $colorEl = $(pickerOpts.color_elem);
            var $wrapperEl = $imageEl.closest('.js-bg-wrapper');
            var col = (data.color && data.color !== "") ? data.color : "transparent";

            if (pickerOpts.type === 'img') {
              if (data.image) {
                $imageEl.attr('src', data.image);
                $imageEl.attr('srcset', data.image);
                $imageEl.css('display', 'initial');

                if (pickerOpts.wrapper_class) {
                  if (!$wrapperEl.hasClass(pickerOpts.wrapper_class)) {
                    $wrapperEl.addClass(pickerOpts.wrapper_class);
                  }
                }
              } else {
                $imageEl.attr('src', 'none');
                $imageEl.attr('srcset', 'none');
                $imageEl.css('display', 'none');

                if (pickerOpts.wrapper_class) {
                  if ($wrapperEl.hasClass(pickerOpts.wrapper_class)) {
                    $wrapperEl.removeClass(pickerOpts.wrapper_class);
                  }
                }
              }

              if (col) {
                $colorEl.css('background-color', col);
              }
            } else {
              if (data.image) {
                $imageEl.css('background-image', 'url("'+ data.image+'")');
              } else {
                $imageEl.css('background-image', 'none');
              }

              if (col) {
                $colorEl.css('background-color', col);
              }
            }
          }
        },
        commit: function(data) {
          if (pickerOpts.entity == 'siteData') {
            var entityData = siteData;
          } else {
            var entityData = pageData;
          }
          var obj = {};
          obj[pickerOpts.name] = data;
          entityData.set(obj);
        }
      };

      if (pickerOpts.width) {
        opts.target_width = pickerOpts.width;
      }

      new Edicy.BgPicker($picker, opts);
    });
  })
</script>
