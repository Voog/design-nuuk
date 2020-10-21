<script type="text/javascript">
  $(function() {
    $('.bg-picker').each(function() {
      var $picker = $(this);
      var pickerOpts = $picker.data();

      var opts = {
        picture: pickerOpts.picture,
        color: pickerOpts.color,

        preview: function(data) {
          if (pickerOpts.elem) {
            var $el = $(pickerOpts.elem);
            var col = (data.color && data.color !== "") ? data.color : "transparent";
            if (pickerOpts.type === 'img') {
              if (data.image) {
                $el.attr('src', data.image);
                $el.attr('srcset', data.image);
              } else {
                $el.attr('src', 'none');
                $el.attr('srcset', 'none');
              }
            } else {
              if (data.image) {
                $el.css('background-image', 'url("'+ data.image+'")');
              } else {
                $el.css('background-image', 'none');
              }

              if (data.color) {
                $el.css('background-color', col);
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
