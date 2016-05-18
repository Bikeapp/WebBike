var mod_map_pe;
var marker = null;

$("document").ready(function () {
   //Handler for .ready() called.
   window.setTimeout(function () {
      location.href = link
   }, 5000);
});

function enviarSugerencia(e){
   $.ajax({
      type:"POST",
      url:url_enviarSugerencia,
      data:{
         mensaje:$("#mensaje").val(),
         nombre:$("#nombre").val(),
         email:$("#email").val()
      },
      success: function(data){
         $("#mensaje").val("");
         $("#nombre").val("");
         $("#email").val("");
         alert("Sugerencia enviada");
      },
      error: function(){
         alert(url_enviarSugerencia);
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });
}


function iniciarMapaCE(){
   iniciarMapaPEMod(-4.5,-74);
   mod_map_pe.addListener('click',function(e){
      addMarker(e.latLng)
   });
}


function iniciarMapaPEMod(lat,lng){
   var myLatlng = new google.maps.LatLng(lat,lng);
   var options = {
      center: myLatlng,
      zoom: 15,
      disableDoubleClickZoom: true,
   }
   mod_map_pe = new google.maps.Map(document.getElementById('mod-map-pe'),options);
}

//FUNCIONES QUE MANEJAN EL AGREGAR EL PUNTO DE ENCUENTRO AL MAPA, SE ENCARGAN QUE SOLO PUEDA EXISTIR UN PUNTO DE ENCUENTRO

function addMarker(location){
   if( marker != null){
      marker.setMap(null);
   }
   marker = new google.maps.Marker({
      position:location,
      map: mod_map_pe,
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



$(document).ready(function(){

   $("#abrirModalCrearEvento").click( function(){
      //google.maps.event.trigger(mod_map_pe,'resize');
      //
               iniciarMapaCE();
   });



   $("#modalCrearEvento").hover(function(){
      google.maps.event.trigger(mod_map_pe,'resize');
   });
});


