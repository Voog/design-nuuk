{%- if editmode -%}
  <button disabled class="js-cart-settings-btn js-settings-editor-btn">Shopping cart settings</button>
{%- endif -%}

<script>
  var shippingMethodsList = [];
  var shippingMethodItems = [];
  var shippingMethodsIds = [];
  var shippingMethodsNames = [];

  {%- if editmode -%}
    window.addEventListener('DOMContentLoaded', (event) => {
      {%- if site.data.shopping_cart_settings -%}
        var valuesObj = {{ site.data.shopping_cart_settings | json }};
      {%- else -%}
        var valuesObj = {};
      {%- endif -%}

      $.ajax({
        type: 'GET',
        contentType: 'application/json',
        url: '/admin/api/ecommerce/v1/shipping_methods',
        dataType: 'json',
        success: function(data) {
          for (var i = 0; i < data.length; i++) {
            shippingMethodsList.push(
              {
                "name": data[i].name,
                "id": data[i].id
              }
            );
          };
        }
      }).then(() => {
        shippingMethodsList.forEach(function (item) {
          shippingMethodItems.push(
            {
              "title": 'Hide fields with ' + item.name + ' shipping method',
              "type": "checkbox",
              "key": "remove_field_with_" + item.name.toLowerCase().split(' ').join('_'),
              "states": {
                "on": item.id,
                "off": false
              }
            },
          );

          shippingMethodsNames.push(item.name.toLowerCase().split(' ').join('_'));
        });

        var siteData = new Edicy.CustomData({
          type: 'site'
        });;
        siteData.set({ shipping_methods_names: shippingMethodsNames });

        var initialMenuitems = [
          {
            "title": "Hide name field from shipping",
            "type": "checkbox",
            "key": "remove_name_field",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": "Hide company field from shipping",
            "type": "checkbox",
            "key": "remove_company_field",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": "Hide address field from shipping",
            "type": "checkbox",
            "key": "remove_address_field",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": "Add shipping view checkbox",
            "type": "checkbox",
            "key": "add_checkbox",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": "Add  shipping view checkbox title/note",
            "type": "text",
            "key": "checkbox_label",
            "placeholder": "{{site.data.shopping_cart_settings.checkbox_label}}"
          },
          {
            "title": "Add shipping form additional field",
            "type": "checkbox",
            "key": "is_shipping_form_input",
            "states": {
              "on": true,
              "off": false
            }
          },
          {
            "title": "Add shipping form field label",
            "type": "text",
            "key": "shipping_form_input_label",
            "placeholder": "{{site.data.shopping_cart_settings.shipping_form_input_label}}"
          }
        ];

        var menuItems = shippingMethodItems.concat(initialMenuitems);

        initSettingsEditor(
          {
            settingsBtn: document.querySelector('.js-cart-settings-btn'),
            menuItems: menuItems,
            dataKey: 'shopping_cart_settings',
            values: valuesObj,
            entityData: 'siteData',
            noReload: true
          }
        );
      });
    });
  {%- else -%}
    window.addEventListener('DOMContentLoaded', (event) => {
      document.addEventListener('voog:shoppingcart:showshippingmethods', function(event) {
        {%- if site.data.shopping_cart_settings.add_checkbox == true -%}
          var checked = Voog.ShoppingCart.getNote() ? 'checked' : '';
          var lang = (Voog.buyButtonsManager || {}).language_code || 'et';
          var note = '{{site.data.shopping_cart_settings.checkbox_label}}';
          var html = '<div class="footer-footnote" style="margin-top: 0px;">' +
            '  <input class="footnote-marketing" id="footnote-marketing" type="checkbox">' +
            '  <label for="footnote-marketing">' + note + '</label>' +
            '</div>';

          document
            .querySelector('.edy-ecommerce-modal footer .footer-footnote')
            .insertAdjacentHTML('afterend', html);

          if ($('input#footnote-marketing').prop( "checked" )) {
            $('footer .actions button').css('pointer-events', 'all');
          } else {
            $('footer .actions button').css({'pointer-events': 'none','opacity': '0.5','cursor': 'default'});
          }

          $('footer .actions button').css({'pointer-events': 'none','opacity': '0.5','cursor': 'default'});
          $('input#footnote-marketing').change(function(e) {
            if ($(this).prop( "checked" )) {
              $('footer .actions button').css('pointer-events', 'all');
            } else {
              $('footer .actions button').css({'pointer-events': 'none','opacity': '0.5','cursor': 'default'});
            }
          });
        {%- endif -%}
      });

      document.addEventListener('voog:shoppingcart:show', function(event) {
        if (event.detail.view == 'shipping_form') {
          {%- if site.data.shipping_methods_names != blank -%}
            {%- assign methodArr = "" | split: "" -%}
            {%- for name in site.data.shipping_methods_names -%}
              {%- assign itemKey = 'remove_field_with_' | append: name -%}
              {%- if site.data.shopping_cart_settings[itemKey] != blank -%}
                {%- assign itemArr = site.data.shopping_cart_settings[itemKey] | append: '' | split: '-' -%}
                {%- assign methodArr = methodArr | concat: itemArr -%}
                var shippingMethodsIds = {{methodArr | split: "" }};
              {%- endif -%}
            {%- endfor -%}
          {%- endif -%}
          console.log(shippingMethodsIds.includes(Voog.ShoppingCart.getContents().shipping_method_id));

          if (shippingMethodsIds.includes(Voog.ShoppingCart.getContents().shipping_method_id)) {
            {%- if site.data.shopping_cart_settings.remove_name_field == true -%}
              $('#vef-name').closest('.edy-ecommerce-form-row').hide();
            {%- endif -%}
            {%- if site.data.shopping_cart_settings.remove_company_field == true -%}
              $('#vef-company').closest('.edy-ecommerce-form-row').hide();
            {%- endif -%}
            {%- if site.data.shopping_cart_settings.remove_address_field == true -%}
              $('#vef-address, #vef-address-1, #vef-city, #vef-country').closest('.edy-ecommerce-form-row').hide();
              $('#vef-country').closest('.edy-ecommerce-form-field').hide();
              $('#vef-phone').closest('.edy-ecommerce-form-row').removeClass('-small');
            {%- endif -%}
            {%- if site.data.shopping_cart_settings.remove_phone_field == true -%}
              $('#vef-phone').closest('.edy-ecommerce-form-row').hide();
              $('#vef-country').closest('.edy-ecommerce-form-row').removeClass('-small');
            {%- endif -%}
          }

          {%- if site.data.shopping_cart_settings.is_shipping_form_input == true -%}
            var orderNote = Voog.ShoppingCart.getNote();
            var label = '{{site.data.shopping_cart_settings.shipping_form_input_label}}';
            var html = '<div class="edy-ecommerce-form-row additional-field">' + '<div class="edy-ecommerce-form-field">' +
            '  <input class="edy-ecommerce-form-input" id="vef-additional-field">' +
            '  <label for="vef-additional-field">' + label + '</label>' +
            '</div>' + '</div>';

            $('input#vef-additional-field').val(orderNote);

            if (!orderNote && $('.additional-field label').length <= 1) {
              $('.additional-field label').val(label);
            }

            if ($('input#vef-additional-field').length <= 0) {
              document
                .getElementById("vef-phone").closest(".edy-ecommerce-form-row")
                .insertAdjacentHTML('afterend', html);
            }

            $('footer .actions button').click(function(e) {
              Voog.ShoppingCart.setNote($('input#vef-additional-field').val());
            });
          {%- endif -%}
        }
      });
    });
  {%- endif -%}
</script>
