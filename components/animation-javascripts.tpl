<script>
  $('body').animate({'opacity':'1'}, 200);
  window.addEventListener('beforeunload', function () {
    $('body').animate({'opacity':'0'}, 200);
  });

  $(document).ready(function() {
    $('.product_item.scale-up').each(function() {
      var item = $(this);
      var delay = item.index();
      item.addClass("animate_scale-down")
      item.css('transition-delay', delay / 3 + 's');
      setTimeout(function(){ item.css('transition-delay', 'none'); }, delay / 3);
    });
  });
</script>

{% if blog_listing_page %}
  <script>
    $(document).ready(function() {
      $('.post.translated-y--100').each(function() {
        var delay = $(this).index();
        $(this).addClass("animate_translated-y--0")
        $(this).css('transition-delay', delay / 3 + 's');
      });
    });
  </script>
{% endif %}
