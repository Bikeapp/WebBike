var map;		//Variable que contiene el mapa
var tmpMarker = null;	//Variable que almacena temporalmente el último punto oprimido por el usuario
var initMarker = null;
var endMarker = null
var wayPoints = [];
var nMarkers = [];

var directionsService = new google.maps.DirectionsService;			//Instanciar un servicio de direcciones
var directionsDisplay = new google.maps.DirectionsRenderer({ draggable: true, map: map });	//Servicio para mostrar direcciones

//Se llama una primera vez al cargar la pagina. Crea el mapa.
function initMap() {
	var myLatlng = new google.maps.LatLng(4.6385739, -74.0950293);		//UN.
	var options = {
		center: myLatlng,
		zoom: 15,
		disableDoubleClickZoom: true,
		mapTypeControl: false,
		scrollwheel: false
	}
	map = new google.maps.Map(document.getElementById('cp-map-container'),options);
	
	directionsDisplay.setMap(map);		//Se define el mapa sobre el cual las direcciones se van a mostrar.
	
	
	
	//Añadir listener al boton de punto de partida.
	$(document).on('click', '#butRP', function(event) {	
		wayPoints = [];
		nMarkers = [];			
		infowindow.close();
		console.log("posicion" + tmpMarker.position.toString());
		if (initMarker != null){						//Verifica si ya había otro marcador establecido como origen.
			initMarker.setMap(null);
			initMarker = tmpMarker;						//Si existia otro, lo reemplaza por el nuevo.
			initMarker.setMap(map);
		}
		else{
			initMarker = tmpMarker;						//Si no existe, lo asigna como nuevo punto de origen.
		}
		tmpMarker = null;								//El temporal queda vacio, lo que significa que se asigno correctamente el punto de origen.
	});

	$(document).on('click', '#butPI', function(event) {
		infowindow.close();
		console.log("posicion" + tmpMarker.position.toString());
		wayPoints.push({
		  location: tmpMarker.position,
		  stopover: true
		});
		var marker = new google.maps.Marker({
			position: tmpMarker.position,
			draggable:true,
			map:map,
		});
		nMarkers.push(marker);
		
	});
	
	//Añadir listener al boton de punto final.
	$(document).on('click', '#butRF', function(event) {					
		infowindow.close();
		console.log("posicion" + tmpMarker.position.toString());
		if (endMarker != null){
			endMarker.setMap(null);
			endMarker = tmpMarker;
			endMarker.setMap(map);
		}
		else{
			endMarker = tmpMarker;
		}
		tmpMarker = null;
	});	
}

document.addEventListener( "DOMContentLoaded", function(event) { initMap(); } );


$(document).on('click','.panel-body ul li',function(event){
	if ($(this).text() == 'Nueva Ruta'){
		directionsDisplay.setMap(null);
		directionsDisplay = new google.maps.DirectionsRenderer({ draggable: true, map: map })
		$("#cp-map-container").animate({opacity:'1'},1000);
		$('#modal').animate({opacity:'0',zIndex:'0'},1000,function(){$('#modal').remove();});
		map.addListener('click', function(event) {						//El mapa escuchara eventos (click) y ejecuta la funcion
			addMarker(event.latLng);								//Funcion de Ciro para agregar puntos.
		});
		if (!$("#container-ruta-nueva").length){
			var container = document.createElement('div');
			var btnCalc = document.createElement('button');
			var btnSave = document.createElement('button');
			container.appendChild(btnCalc);
			container.appendChild(btnSave);
			container.id = 'container-ruta-nueva';
			btnCalc.innerHTML = 'Calcular Ruta';
			btnCalc.onclick = function() { calcRuta();}
			btnCalc.style.width = '120px';
			btnCalc.id = 'btnCalc';
			btnCalc.style.height = '20px';
			btnSave.innerHTML = 'Guardar Ruta';
			btnSave.onclick = function() { guardarRuta();cleanMarkers();}
			btnSave.style.width = '120px';
			btnSave.id = 'btnSave';
			btnSave.style.height = '20px';
			map.controls[google.maps.ControlPosition.TOP_CENTER].push(container);
		}
		else{
			$("#container-ruta-nueva").animate({opacity:'1'},2000);
		}
	}
	else if($(this).text() == 'Modificar Ruta'){
		directionsDisplay.setMap(null);
		directionsDisplay = new google.maps.DirectionsRenderer({ draggable: true, map: map })
		if(!$('#modal').length){
			$("#container-ruta-nueva").animate({opacity:'0'},1000);
			$("#cp-map-container").animate({opacity:'0.2'},1000);
		
			var txt = "";
			for(var i = 0 ; i < rutas_all.length ;i++){
				txt = txt + "<li>"+rutas_all[i].nombre+"</li>";
			}
			$("#wrapper").append("<div id='modal'><div class='modal-content'><h3>Por favor, escoja una de las rutas existentes para modificar</h3><p class='description'>"+txt+"</p></div></div>");
			$('#modal').animate({opacity:'1',zIndex:'99'},1000);
		}
	}
});

//Agrega un marcador al mapa y despliega el infowindow con las opciones.
function addMarker(location){
	//Verifica si hay un marcador "flotando" en el mapa. En caso de haberlo, lo elimina del mapa.
   if(tmpMarker != null){
		tmpMarker.setMap(null);
	}
	
   //Crea el marcador que se muestra al usuario donde hizo click.
   var marker = new google.maps.Marker({
	  position: location,
	  draggable:true,
	  map:map
   });
   
   //El marcador queda almacenado mientras se define que tipo de punto es.
   tmpMarker = marker;

   var contentString = '<div class="butTipo" id="butRP"><button>Origen</button></div>'+
						'<div class="butTipo" id="butPI"><button>Punto intermedio</button></div>'+ 			//Muestra la versión del infowindow para calcular rutas.
						'<div class="butTipo" id="butRF"><button>Destino</button></div>';
						
   infowindow = new google.maps.InfoWindow({		//Crea una nueva infoWindow con el contenido de arriba y en la posicion del marker donde se hizo click.
		content: contentString,
   });

   infowindow.open(map, marker);			//Muestra la ventana emergente en ese punto	 
}

//Calcula la ruta y la muestra al usuario. SIN DIRECCIONES ESCRITAS.
function calcRuta(){
	var request = {													//Parametros utilizados para las direcciones.
		origin:initMarker.position,
		waypoints:wayPoints,										
		destination:endMarker.position,
		travelMode: google.maps.TravelMode.WALKING,
	};
	directionsService.route(request,function(response,status){		//Hace la llamada para calcular la ruta.
		if (status == google.maps.DirectionsStatus.OK) {
			directionsDisplay.setDirections(response);
						//El renderizador muestra la ruta si el llamado fue exitoso.
		}
		else{
			window.alert('Directions request failed due to ' + status);
		}
	});
}

//Limpia todos los marcadores del mapa.
function cleanMarkers(){
	
	if (initMarker != null) {initMarker.setMap(null);}
	if (endMarker != null) {endMarker.setMap(null);}
	if (tmpMarker != null) {tmpMarker.setMap(null); }
	for(var i = 0 ; i < nMarkers.length ; i++){
		nMarkers[i].setMap(null);
	}
}

//AJAX para guardar una nueva ruta con los puntos de inicio, intermedios y final que el usuario especificó.
function guardarRuta(){
	$.ajax({
		url: "ruta/guardarRuta",			//Llamo al metodo guardarRuta en el controlador Ruta
		type: 'POST',
		datatype: 'text/json',
		data: {
			initMarker: JSON.stringify(initMarker.position),			
			wayPoints: JSON.stringify(wayPoints),
			endMarker: JSON.stringify(endMarker.position) 
		},
		success: function(data) {
			console.log(data);
		},
		error: function (xhr, ajaxOptions, thrownError) {
        	alert(xhr.status);
        	alert(thrownError);
      	}
	});
}

//Evento click sobre una de las rutas para modificar
$(document).on('click','#modal li',function(){
	//AJAX para poder obtener la informacion de la ruta sobre la cual se hizo click.
	$.ajax({
		url: "ruta/buscarRuta",			
		type: 'POST',
		datatype: 'text/json',
		data: {
			nombreRuta: $(this).text(),			
		},
		success: function(data) {
			console.log(data);
			var puntos = data;
			for(var i = 1 ; i < puntos.length - 1 ; i++){
				wayPoints.push({stopover: true, location: {lat: puntos[i].lat, lng: puntos[i].lng}});
			}
			
			var posI = new google.maps.LatLng(puntos[0].lat,puntos[0].lng);
			var posF = new google.maps.LatLng(puntos[puntos.length-1].lat,puntos[puntos.length-1].lng);
			
   			endMarker = new google.maps.Marker({
	  			position: posF,
   			});
   			
   			initMarker = new google.maps.Marker({
	  			position: posI,
   			});
			
			
			directionsDisplay.setOptions({ preserveViewport: true });
			var request = {													//Parametros utilizados para las direcciones.
				origin: posI,
				waypoints: wayPoints,										
				destination:posF,
				travelMode: google.maps.TravelMode.WALKING,
			};
			directionsService.route(request,function(response,status){		//Hace la llamada para calcular la ruta.
				if (status == google.maps.DirectionsStatus.OK) {
					directionsDisplay.setDirections(response);
								//El renderizador muestra la ruta si el llamado fue exitoso.
				}
				else{
					window.alert('Directions request failed due to ' + status);
				}
			});
			$("#cp-map-container").animate({opacity:'1'},1000);
			$('#modal').animate({opacity:'0',zIndex:'0'},1000,function(){$('#modal').remove();});
			
		},
		error: function (xhr, ajaxOptions, thrownError) {
        	alert(xhr.status);
        	alert(thrownError);
      	}
	});
});




