//var map;
var points = [];
var index = 0;
var calcRoute = false;
var RStart,RFinish,RWayPoints = "";


function addMarker(location){
   var marker = new google.maps.Marker({
      position: location,
      draggable:true,
      map: map,
   });
   points[index++] = marker;
   
   if (calcRoute){
   	var contentString = '<div class="butTipo" id="butRI"><button onclick="crearR()">Punto intermedio</button></div>'+		
						'<div class="butTipo" id="butRF"><button onclick="crearR()">Punto final</button></div>';
   }
   else{
   	var contentString = '<div class="butTipo" id="butRP"><button onclick="crearR()">Punto de partida</button></div>'+
						'<div class="butTipo" id="butP"><button onclick="crearP()">Punto de interes</button></div>'+ 		
						'<div class="butTipo" id="butG"><button onclick="crearG()">Punto de encuentro</button></div>';
   }
      
	
	infowindow = new google.maps.InfoWindow({
    	content: contentString,
    	location: marker,
  	});
  	infowindow.open(map, marker);			//Muestra la ventana emergente en ese punto	
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