
$( document ).ready(function() {
  var coords = $('#multi_overlays').data('coords');

  var handler = Gmaps.build('Google');
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
});
