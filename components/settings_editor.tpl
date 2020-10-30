<script>
  function initSettingsEditor(options = {}) {
    var entityData;

    if (options.entityData === 'siteData') {
      var entityData = siteData;
    } else if (options.entityData === 'articleData') {
      var entityData = articleData;
    } else {
      var entityData = pageData;
    }

    var SettingsEditor = new Edicy.SettingsEditor(options.settingsBtn, {
      menuItems: options.menuItems,
      values: options.values || options.defaultValues,
      commit: function(data) {
        entityData.set(options.dataKey, data, {
          success: function() {
            if (options.noReload !== true) {
              window.location.reload();
            }
          }
        });
      }
    });
    options.settingsBtn.removeAttribute('disabled');
  }
</script>
