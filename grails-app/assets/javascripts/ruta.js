var map;
var points = []
var index = 0

function initMap() {
   var mapDiv = document.getElementById('map');
   map = new google.maps.Map(mapDiv, {
      center: {lat: 4.6363, lng: -74.0808},
      zoom: 15
   });
   map.addListener('click',function(e){
      //alert(e.latLng)
      addMarker(e.latLng)
      printArrayJQ()
   });
}

function addMarker(location){
   var marker = new google.maps.Marker({
      position: location,
      map: map,
      draggable:true
   });
   points[index++] = marker
}

function printArrayJQ(){
   var $finalString = $("<table></table>");
   $.each(points, function(i,item){
      var $line = $("<tr></tr>");
      $line.append( $("<td></td>").html(i) );
      $line.append( $("<td></td>").html(item.position.toString()) );
      $line.append( $("<td></td>").html( "<button type=\"button\" id=\"botonPunto"+i+"\" data-index="+i+">Borrar</button>") );
      $finalString.append($line);
   });
   $("#table").html($finalString);
   for( i = 0 ; i < points.length ; i++ ){
      $("#botonPunto"+i).click(function(){
         var ind = $(this).data("index");
         points[ind].setMap(null);
         points.splice(ind,1);
         index = index-1;
         printArrayJQ();
      });
   }
}

function printArrayJS(){
   //for(i=0;i<points.length;i++){
      //alert(points[i])
   //points.toString()
   var toPrint = ""
   for( i=0 ; i<points.length ; i++ ){
      toPrint += points[i]+"<br>"
   }
   document.getElementById("table").innerHTML = toPrint
}

function test(){
   alert("OK");
}
