<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_RVgkXwL37ERUgWk139RbwYcSGkAF0-k&signed_in=true&callback=initMap&language=es"
        async defer></script>
    <title>Mapa</title>
    <style>

      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }

      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
      #map {
        margin-top: 40px;
        height: 50%;
        float: left;
        width: 63%;
        
      }
      #right-panel {
        margin-top:50px;
        float: right;
        width: 34%;
        height: 100%;
      }
      #right-panel {
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }

      #right-panel select, #right-panel input {
        font-size: 15px;
      }

      #right-panel select {
        width: 100%;
      }

      #right-panel i {
        font-size: 12px;
      }

      .panel {
        height: 100%;
        overflow: auto;
      }

    </style>

  </head>


  <body>

    <div id="floating-panel">
    <b>Modo: </b>
    <select id="modo" style="margin-top:40px">
      <option value="ab">Punto Inicio-LLegada</option>
      <option value="intermedios">Puntos Intermedios</option>
      <option value="interes">Puntos de Interes</option>
      <option value="encuentro">Puntos de Encuentro</option>      
      
    </select>    
    </div>

    <div id="map"></div>

    <div id="right-panel">
      <p>Distancia Total: <span id="total"></span></p>
    </div>
    <div id="formulario">
      <g:form name="myForm" controller="mapa">
        <label>Tipo:</label><g:textField name="tipo"/></br>
        <label>Long:</label><g:textField name="lon"/></br>
        <label>Lat:</label><g:textField name="lat"/></br>         <!--Registra puntos de interes--> 
        <label>Nombre:</label><g:textField name="nombre"/></br>
        <label>Descripcion:</label><g:textField name="descripcion"/></br>
        <g:actionSubmit action="registrar" value="Registrar!"/>
      </g:form>
    </div>
    <div>
      <g:form name="formParche" controller="mapa">
        <label>Nombre:</label><g:textField name="nombre"/></br>
        <label>Descripcion:</label><g:textField name="descripcion"/></br>
        <label>Lon:</label><g:textField name="lon"/></br>         <!--Registra parches--> 
        <label>Lat:</label><g:textField name="lat"/></br>
        <label>Usuario:</label><g:select name="usuario" from="${usuarios}" optionValue="usuario" optionKey="id"/></br>
        <g:actionSubmit action="parche" value="Crear!"/>
      </g:form>
    </div>
    <div>
      <g:select name="usuarios" from="${usuarios}" optionValue="id"/>
      <g:select name="parches" from="${parches}" optionValue="id"/>
      <g:select name="puntos" from="${puntos}" optionValue="id"/>
      </br>
    </div>  
    
    <script>
    var waypts=[]

function initMap() {

  var count=0;  
  var punto_inicio={lat: 4.638384, lng:-74.084969}  
  var punto_llegada={lat: 4.634588, lng:-74.079736}

  
  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 14,
    center: {lat: 4.6385739, lng:-74.0950293}  // Universidad Nacional
  });

  var bikeLayer = new google.maps.BicyclingLayer();
  bikeLayer.setMap(map);

  var directionsService = new google.maps.DirectionsService;
  var directionsDisplay = new google.maps.DirectionsRenderer({
    draggable: true,
    map: map,
    panel: document.getElementById('right-panel')
  });

  directionsDisplay.addListener('directions_changed', function() {
    
    computeTotalDistance(directionsDisplay.getDirections());
  });

  map.addListener('click', function(event) {
           if($("#modo").val()==='ab'){
              count++ ;

              if(count%2==0){
                punto_llegada = event.latLng;
                if(confirm('¿Desea alterar los puntos de inicio y de llegada de la ruta?')){
                  waypts=[];
                   displayRoute(punto_inicio, punto_llegada, directionsService,   directionsDisplay);

                }
               

              }else{
                punto_inicio = event.latLng;
              }
           }  

           if($("#modo").val()==='intermedios'){
              if(confirm('¿Desea agregar este punto intermedio a su ruta?')){
                waypts.push({
                  location: event.latLng,
                  stopover: true
                });
             
                   displayRoute(punto_inicio, punto_llegada, directionsService,   directionsDisplay);

                }
              


           }
          
          
          
        });   

  map.addListener('contextmenu', function(event) {
    alert('bang bang');
          
          
        });   



  displayRoute(punto_inicio, punto_llegada, directionsService,directionsDisplay);
}

function displayRoute(origin, destination, service, display) {



  service.route({
    origin: origin,
    destination: destination,
    waypoints: waypts,
    travelMode: google.maps.TravelMode.DRIVING,
    avoidTolls: true
  }, function(response, status) {
    if (status === google.maps.DirectionsStatus.OK) {
      display.setDirections(response);
    } else {
      alert('Could not display directions due to: ' + status);
    }
  });
}

function computeTotalDistance(result) {
  var total = 0;
  var myroute = result.routes[0];
  for (var i = 0; i < myroute.legs.length; i++) {
    total += myroute.legs[i].distance.value;
  }
  total = total / 1000;
  document.getElementById('total').innerHTML = total + ' km';
}
    </script>


   
  </body>
</html>