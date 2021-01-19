<script type="text/javascript">
  $(function() {
    $('.bg-picker').each(function(index, pickerArea) {
      var $picker = $(this),
        pickerOpts = $picker.data();

      var bgPicker = new Edicy.BgPicker($picker, {
        picture: pickerOpts.type_picture,
        color: pickerOpts.type_color,
        showAlpha: true,
        target_width: pickerOpts.width,
        preview: function(data) {
          site.bgPickerPreview(pickerOpts, data, bgPicker);
        },
        commit: function(data) {
          site.bgPickerCommit(pickerOpts.bg_key, data, bgPicker, pickerOpts.entity);
        }
      });
    });
  })
</script>
