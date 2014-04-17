
$( document ).ready(function() {
  var coords = $('#multi_overlays').data('coords');

  var handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'multi_overlays'}}, function(){
    coords.forEach(function(coord){
      var polylines1 = handler.addPolylines(
        [
          coord
        ],
        { strokeColor: '#9E1617'}
      );
      handler.bounds.extendWith(polylines1);
    });
    handler.fitMapToBounds();
  });
});
