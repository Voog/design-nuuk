<script>
  $(document).ready(function() {
    $('.layout_settings-btn--container').css('transform', 'scale(1)');
    $('.product_item.scale-up').each(function() {
      var item = $(this);
      var delay = item.index();
      item.addClass("animate_scale-down")
      item.css('transition-delay', delay / 3 + 's');
      setTimeout(function(){ item.css('transition-delay', 'none'); }, delay / 3);
    });
  });
</script>
