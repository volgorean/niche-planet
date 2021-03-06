
$( document ).ready(function() {
  $("#toggleMap").click(function() {
    $(".hideMap"));
  });
  var handler = Gmaps.build('Google');
  var markersArray = [];

  if(document.getElementById("multi_overlays")!=null) {
    var coords = $('#multi_overlays').data('coords');
    handler.buildMap({ internal: {id: 'multi_overlays'}}, function(){
      coords.forEach(function(coord){
        if (coord.length > 1) {
          var polylines1 = handler.addPolylines(
            [
              coord
            ],
            { strokeColor: '#9E1617'}
          );
          handler.bounds.extendWith(polylines1);

        } else if (coord.length == 1) {
          var circles = handler.addCircles(
              [{ lat: coord[0].lat, lng: coord[0].lng, radius: 5000 }],

              { strokeColor: '#FF0000'}
          );
          handler.bounds.extendWith(circles);
        }
      });
      handler.fitMapToBounds();
    });
  }else if (document.getElementById("multi_overlays_with_picker")!=null) {
    var coords = $('#multi_overlays_with_picker').data('coords');
    var clickableMap = handler.buildMap({ internal: {id: 'multi_overlays_with_picker'}}, function(){
      coords.forEach(function(coord){
        if (coord.length > 1) {
          var polylines1 = handler.addPolylines(
            [
              coord
            ],
            { strokeColor: '#9E1617'}
          );
          handler.bounds.extendWith(polylines1);

        } else if (coord.length == 1) {
          var circles = handler.addCircles(
              [{ lat: coord[0].lat, lng: coord[0].lng, radius: 5000 }],

              { strokeColor: '#FF0000'}
          );
          handler.bounds.extendWith(circles);
        }
      });
      handler.fitMapToBounds();
    });
    google.maps.event.addListener(handler.getMap(), 'click', function(event) {
      document.getElementById("latForm").value = event.latLng.lat()
      document.getElementById("lngForm").value = event.latLng.lng()

      if (markersArray.length > 0) {
        markersArray[markersArray.length - 1].setMap(null);
      }
      var marker = new google.maps.Marker({
          position: event.latLng
      });

      markersArray.push(marker);
      markersArray[markersArray.length - 1].setMap(handler.getMap());
    });
  }
});
