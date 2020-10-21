<script>
  function initSettingsEditor(options = {}) {
    if (options.entityData === 'siteData') {
      var entityData = siteData;
    } else {
      var entityData = pageData;
    }

    var SettingsEditor = new Edicy.SettingsEditor(options.settingsBtn, {
      menuItems: options.menuItems,
      values: options.values || options.defaultValues,
      commit: function(data) {
        entityData.set(options.dataKey, data, {
          success: function() {
            window.location.reload();
          }
        });
      }
    });
    options.settingsBtn.removeAttribute('disabled');
  }
</script>
