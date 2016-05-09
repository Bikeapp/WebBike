var map;
var marker = null;
var map_rt;
var map_pe;

function initMap(tipo){
   //alert(tipo);
   var myLatlng = new google.maps.LatLng(4.5,-74);
   var options = {
      center: myLatlng,
      zoom: 15,
      disableDoubleClickZoom: true,
   }
   map = new google.maps.Map(document.getElementById('mapa'),options);

   map.addListener('click',function(e){
      addMarker(e.latLng)
   });
}

function initMaps(tipo){
   //alert(tipo);
   //MAPA CON EL PUNTO DE ENCUENTRO
   var lat = $("#lat").val();
   var lng = $("#lng").val();
   //alert(lat+" "+lng);
   var myLatlng = new google.maps.LatLng(lat,lng);
   var options = {
      center: myLatlng,
      zoom: 16,
      disableDoubleClickZoom: true,
   }

   map_pe =  new google.maps.Map(document.getElementById('mapa-pe'),options);
   new google.maps.Marker({
      position:myLatlng,     
      map: map_pe,
      draggable: true,
      animation: google.maps.Animation.DROP
   });


   //MAPA QUE INDICA LA RUTA
   map_rt = new google.maps.Map(document.getElementById('mapa-rt'),options);
   //NONE TODO CODE HERE
   //
   //
}



function addMarker(location){
   if( marker != null){
      marker.setMap(null);
   }
   marker = new google.maps.Marker({
      position:location,
      map: map,
      draggable: true,
      animation: google.maps.Animation.DROP
   });
   marker.addListener('dragend', function(e){
      actualizarPosicion(e.latLng)
   });
   actualizarPosicion(location);
}

function actualizarPosicion(location){
   $("#lat").val(location.lat);
   $("#lng").val(location.lng);
   //alert( $("#lat").val() + ", "+ $("#lng").val() );
}

function obtenerEventos(e){
   $.ajax({
      type:"POST",
      url:url_obtEventos,
      data:{
         tp:e
      },
      success: function(data){
         //alert(data);
         $("#lista-eventos").html(data)
      },
      error: function(){
         alert(url_obtMisEventos);
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });
}

function obtenerMisEventos(e){
   $.ajax({
      type:"POST",
      url:url_obtMisEventos,
      data:{
         tp:e
      },
      success: function(data){
         //alert(data);
         $("#lista-eventos").html(data)
      },
      error: function(){
         alert(url_obtMisEventos);
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });
}

$(document).ready(function(){

   $("#modal-open").click( function(){

      $( this ).blur() ;   
      if( $( "#modal-overlay" )[0] ) return false ;      
      $( "body" ).append( '<div id="modal-overlay"></div>' ) ;
      $( "#modal-overlay" ).fadeIn( "slow" ) ;
      centeringModalSyncer() ;
      $( "#modal-content" ).fadeIn( "slow" ) ;
      $( "#modal-overlay,#modal-close" ).unbind().click( function(){
         $( "#modal-content,#modal-overlay" ).fadeOut( "slow" , function(){
            $('#modal-overlay').remove() ;
         });
      });
   });


   $( window ).resize( centeringModalSyncer ) ;

   function centeringModalSyncer() {

      var w = $( window ).width() ;
      var h = $( window ).height() ;

      var cw = $("#modal-content" ).outerWidth({margin:true});
      var ch = $("#modal-content").outerHeight();

      $( "#modal-content" ).css( {"left": ((w - cw)/2) + "px","top": ((h - ch)/2) + "px"} ) ;

   }
   $("#to_map2").hover(function(){
      google.maps.event.trigger(map_rt,'resize');
   });
   $("#to_map2").mousemove(function(){
      google.maps.event.trigger(map_rt,'resize');
   });

});


