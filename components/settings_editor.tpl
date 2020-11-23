<script>
  function initSettingsEditor(options = {}) {
    var entityData;

    if (options.entityData === 'siteData') {
      var entityData = new Edicy.CustomData({
        type: 'site'
      });;
    } else if (options.entityData === 'articleData') {
      var entityData = new Edicy.CustomData({
        type: 'article',
        id: '{{article.id}}'
      });
    } else {
      var entityData = new Edicy.CustomData({
        type: 'page',
        id: '{{page.id}}'
      });
    }

    var SettingsEditor = new Edicy.SettingsEditor(options.settingsBtn, {
      menuItems: options.menuItems,
      values: options.values || options.defaultValues,
      buttonTitleI18n: options.buttonTitleI18n,
      preview: function(data) {
        options.prevFunc && options.prevFunc(data);
      },
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
