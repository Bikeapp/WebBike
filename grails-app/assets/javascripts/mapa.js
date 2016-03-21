			var map;				//Variable donde se almacena la referencia al mapa de google.
			var icono = null;	//Variable para modificar el icono del marcador.
			var infowindow;
			var markPoint;
			var RStart,RFinish,RWayPoints = "";
			var points = [];
			var index = 0;
			var calcRoute = false;
		
			//Funcion que inicializa los parametros iniciales del mapa de google.
			function initMap() {
				

				var directionsService = new google.maps.DirectionsService;			//Instanciar un servicio de direcciones
				var directionsDisplay = new google.maps.DirectionsRenderer({suppressMarkers:true});			//Instanciar un servicio para graficar direcciones, la opcion permite no mostrar los marcadores por defecto para hacerlo mas estetico.
				var myLatlng = new google.maps.LatLng(4.5,-74);
				var options = {
					center: myLatlng,
					zoom: 15,
					disableDoubleClickZoom: true,
				}
				map = new google.maps.Map(document.getElementById('mapa'),options);	//Se le asigna el mapa de google al div con nombre 'mapa'
				map.addListener('click', function(event) {						//El mapa escuchara eventos (click) y ejecuta la funcion
					addMarker(event.latLng);								//Funcion de Ciro para agregar puntos.
					//printArrayJQ();							//Funcion de Ciro para mostrar puntos dinamicamente.
					//addMarkerToBD("Prueba",event.latLng.lat(),event.latLng.lng(),icono,"Prueba descripcion",null,null);		//Funcion para agregar el punto de interés a la BD.
					markPoint = event.latLng;
				});	
				
				var divs = document.createElement('div');
				crearControlUbicacion(divs,map);	
				divs.index=0;

				//var bikeLayer = new google.maps.BicyclingLayer();					//Instanciar las rutas de bicicleta si estan disponibles.
				//bikeLayer.setMap(map);												//Asignar la ruta de bicicleta al mapa.					
				directionsDisplay.setMap(map);										//Renderizar las direcciones del graficador sobre el mapa.		
			
			
				$(document).on('click', '#butRP', function(event) {					//Añadir listener al boton de punto de partida.
					RStart = markPoint;
					icono = "ruta";
					calcRoute = true;
					infowindow.close();
					points[index-1].setIcon('../assets/'+icono+'_icon.png');		//Al haber escogido un boton, se le asigna el icono correspondiente al marcador.
				});
				
				
				//HAY QUE AÑADIR OTRO LISTENER PARA EL BOTON DE PUNTO INTERMEDIO.
				
				
				$(document).on('click', '#butRF', function(event) {					//Añadir listener al boton de punto final.
					RFinish = markPoint;
					infowindow.close();
					icono = "ruta";
					points[index-1].setIcon('../assets/'+icono+'_icon.png');		//Al haber escogido un boton, se le asigna el icono correspondiente al marcador.
					calcRoute = false;
					//Calc ruta
					var request = {													//Parametros utilizados para las direcciones.
						origin:RStart,
						//waypoints:RWayPoints,										//ALEX AQUI VAN LOS WAYPOINTS.
						destination:RFinish,
						travelMode: google.maps.TravelMode.DRIVING,
					};
					
					directionsService.route(request,function(response,status){		//Hace la llamada para calcular la ruta.
						if (status == google.maps.DirectionsStatus.OK) {
							directionsDisplay.setDirections(response);				//El renderizador muestra la ruta si el llamado fue exitoso.
						}
						else{
							window.alert('Directions request failed due to ' + status);
						}
					});
				});
			
			}
			
			//Funcion para agregar el punto a la base de datos por medio de un llamado AJAX.
			//GOLD.
			function addMarkerToBD(nombre, lat, lon, tipo, descripcion, usuario, ruta){
       			$.ajax({
					url: 'registrarPuntoTest',			//Accion del controlador al que va dirigida la llamada.
					type: 'POST',
					dataType: 'text',					//No se necesita ningún tipo de codificacion.
					data: {
						nombre: nombre,
						lat: lat,
						lon: lon,
						tipo: tipo,						//Datos para enviar al controlador.
						descripcion: descripcion,
						usuario: usuario,
						ruta: ruta
					},
					success: function(data) {
						alert(data);					//Instruccion a ejecutar cuando haya una conexión exitosa con el servidor.
					}
				});
			}

			//Funcion que recorre la base de datos buscando puntos de interes y parches, y los representa en el mapa.
			function showMarkers(puntosJSON,parchesJSON){
				for (var i=0; i < puntosJSON.length; i++) {
					var punto = puntosJSON[i];
					addMarkerToMap(punto.nombre,parseInt(punto.lat),parseInt(punto.lon),punto.tipo);
				}
				for (var i=0; i < parchesJSON.length; i++) {
					var parche = parchesJSON[i];
					addMarkerToMap(parche.nombre,parseInt(parche.lat),parseInt(parche.lon),"parche");
				}
			}
			
			//Funcion para inicializar todas las rutinas relacionadas con gooogle maps.
			//Se llama cuando termina de cargar Mapa/index.gsp
			function test(puntosJSON,parchesJSON){
				initMap();								//Inicializar mapa.
				showMarkers(puntosJSON,parchesJSON);		//Graficar marcadores.		
			} 
			
			
			//Funcion para agregar los marcadores al mapa y mostrarlos en una lista al lado del mapa.
			//También despliega un infoWindow para darle opciones al usuario sobre el punto que desee agregar.
			function addMarker(location){
			   var marker = new google.maps.Marker({
				  position: location,
				  draggable:true,
				  map:map,
			   });
			   points[index++] = marker;
   
			   if (calcRoute){
				var contentString = '<div class="butTipo" id="butRI"><button>Punto intermedio</button></div>'+			//Muestra la versión del infowindow si ya se empezo a calcular una ruta.
									'<div class="butTipo" id="butRF"><button>Punto final</button></div>';
			   }
			   else{
				var contentString = '<div class="butTipo" id="butRP"><button>Punto de partida</button></div>'+
									'<div class="butTipo" id="butP"><button>Punto de interes</button></div>'+ 			//Muestra la versión del infowindow si no se ha empezado a calcular una ruta.
									'<div class="butTipo" id="butG"><button>Punto de encuentro</button></div>';
			   }
	  
	
				infowindow = new google.maps.InfoWindow({		//Crea una nueva infoWindow con el contenido de arriba y en la posicion del marker donde se hizo click.
					content: contentString,
					location: marker,
				});
	
				infowindow.open(map, marker);			//Muestra la ventana emergente en ese punto	
			}
			
			//Funcion que imprime los puntos agregados dinamicamente por el usuario en forma de lista.
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
			
			function crearControlUbicacion(divContainer,map){
				var divBoton = document.createElement('div');
				divBoton.style.backgroundColor = '#fff';
				divBoton.style.border = '2px solid #fff';
				divBoton.style.borderRadius = '3px';
				divBoton.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
				divBoton.style.cursor = 'pointer';
				divBoton.style.marginBottom = '22px';
				divBoton.style.textAlign = 'center';
				divBoton.innerHTML = '<img src="../assets/geo_icon.png"></img>';
				divBoton.title = 'Click para ubicarte en el mapa';
				divContainer.appendChild(divBoton);
				divBoton.addEventListener('click',pedirUbicacion);
				map.controls[google.maps.ControlPosition.TOP_RIGHT].push(divContainer);
			}

			
			
			function pedirUbicacion(){
				if (navigator.geolocation) {
					navigator.geolocation.getCurrentPosition(function(position) {
						var pos = {
							lat: position.coords.latitude,
							lng: position.coords.longitude
					  	};
					  	map.setCenter(pos);
					  	map.setZoom(16);
					  	var marker = new google.maps.Marker({
						  	position: pos,
						  	draggable:false,
						  	map:map,
						  	icon:'../assets/user_icon.png'
					   	});
						}, function() {alert("No se pudo llevar acabo el servicio de geolocalizacion.");}
					);
				}
				else{
					alert("Su navegador no soporta el servicio de geolocalizacion. Por favor actualice para utilizar este servicio.");
				}
			}
			
			
			
				
				
			
			
			
			