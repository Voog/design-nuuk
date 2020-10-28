
<footer class="footer">
  <div class="footer_separator"></div>
  <section class="content-body content-formatted mar_b-56">{% xcontent name="footer-top" %}</section>
  <div class="flex_row flex_row-3 mar_0-8-neg flex_j-space-between">
    <div class="flex_row-3--item">
      <div class="content-formatted mar_0-8">{% xcontent name="footer" %}</div>
    </div>
    <div class="flex_row-3--item">
      <div class="content-formatted mar_0-8">{% xcontent name="footer-1" %}</div>
    </div>
    <div class="flex_row-3--item">
      <div class="content-formatted mar_0-8">{% xcontent name="footer-2" %}</div>
    </div>
  </div>
  <div class="voog-reference">{% loginblock %}{{ "footer_login_link" | lc }}{% endloginblock %}</div>
</footer>
