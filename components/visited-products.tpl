  <script>
    var visitUrls = [];
    var locationPathName = window.location.pathname.slice(1);

    // Parse the serialized data back into an aray of objects
    visitUrls = JSON.parse(localStorage.getItem('session')) || [];
    // Push the new data (whether it be an object or anything else) onto the array
    visitUrls.push(locationPathName);
    // Re-serialize the array back into a string and store it in localStorage
    var unique = visitUrls.filter(function(elem, index, self) {
      return index === self.indexOf(elem);
    })
    localStorage.setItem('session', JSON.stringify(unique));

    $( ".js-product-item" ).each(function() {
      var path = $(this).attr( "data-path" );
      if (unique.includes(path) && path !== locationPathName) {
        console.log($(this).attr( "data-path" ))
        $(this).show();
      }
    });

    var visitUrls = [];
    var locationPathName = window.location.pathname.slice(1);

    // Parse the serialized data back into an aray of objects
    visitUrls = JSON.parse(localStorage.getItem('session')) || [];
    // Push the new data (whether it be an object or anything else) onto the array
    visitUrls.unshift(locationPathName);
    // Re-serialize the array back into a string and store it in localStorage
    var uniqueVisits = visitUrls.filter(function(elem, index, self) {
      return index === self.indexOf(elem);
    })

    localStorage.setItem('session', JSON.stringify(uniqueVisits));

    var visitsWithoutCurrent = uniqueVisits.filter(e => e !== locationPathName)

    if (visitsWithoutCurrent.length >= 1) {
      $('.visits-title').show();
    }
  </script>