			var map;				//Variable donde se almacena la referencia al mapa de google.
			var icono = null;	//Variable para modificar el icono del marcador.
			var infowindow;
			var markPoint;
			var Marker1 = null;
			var Marker2 = null;
			var tmpMarker = null;
			var RStart,RFinish,RWayPoints = "";
			var points = [];
			var index = 0;
			var directionsService = new google.maps.DirectionsService;			//Instanciar un servicio de direcciones
			var directionsDisplay = new google.maps.DirectionsRenderer;			//Instanciar un servicio para graficar direcciones, la opcion permite no mostrar los marcadores por defecto para hacerlo mas estetico.
		
			//Funcion que inicializa los parametros iniciales del mapa de google.
			function initMap() {
			
				var myLatlng = new google.maps.LatLng(4.5,-74);
				var options = {
					center: myLatlng,
					zoom: 15,
					disableDoubleClickZoom: true,
				}
				map = new google.maps.Map(document.getElementById('mapa'),options);	//Se le asigna el mapa de google al div con nombre 'mapa'
				
				
				var divCU = document.createElement('div');
				var divCR = document.createElement('div');
				crearControlUbicacion(divCU,map);			//Crea el boton de geolocalizacion en el mapa
				crearControlRuta(divCR,map);				//Crea el boton de rutas en el mapa.		
				divCU.index=1;
				divCR.index=1;

				//var bikeLayer = new google.maps.BicyclingLayer();					//Instanciar las rutas de bicicleta si estan disponibles.
				//bikeLayer.setMap(map);												//Asignar la ruta de bicicleta al mapa.					
				directionsDisplay.setMap(map);										//Renderizar las direcciones del graficador sobre el mapa.		
			
				//Añadir listener al boton de punto de partida.
				$(document).on('click', '#butRP', function(event) {					
					infowindow.close();
					var txtOrigen = document.getElementById('txtOr');
					if (Marker1 != null){						//Verifica si ya había otro marcador establecido como origen.
						Marker1.setMap(null);
						Marker1 = tmpMarker;		//Si existia otro, lo reemplaza por el nuevo.
						Marker1.setMap(map);
					}
					else{
						Marker1 = tmpMarker;						//Si no existe, lo asigna como nuevo punto de origen.
					}
					txtOrigen.value = Marker1.position.toString();			//Utiliza la coordenada del punto para ponerlo como origen en el cuadro de texto.
					tmpMarker = null;								//El temporal queda vacio, lo que significa que se asigno correctamente el punto de origen.
				});
				
				
				//HAY QUE AÑADIR OTRO LISTENER PARA EL BOTON DE PUNTO INTERMEDIO.
				
				//COMPORTAMIENTO SIMILAR BOTON DE ORIGEN, SOLO CAMBIAN LAS REFERENCIAS, LA LOGICA ES IGUAL.
				//Añadir listener al boton de punto final.
				$(document).on('click', '#butRF', function(event) {					
					infowindow.close();
					var txtDestino= document.getElementById('txtDe');
					if (Marker2 != null){
						Marker2.setMap(null);
						Marker2 = tmpMarker;
						Marker2.setMap(map);
					}
					else{
						Marker2 = tmpMarker;
					}
					txtDestino.value = Marker2.position.toString();
					tmpMarker = null;
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
						alert("holaaaaaa");					//Instruccion a ejecutar cuando haya una conexión exitosa con el servidor.
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
				//Verifica si hay un marcador "flotando" en el mapa. En caso de haberlo, lo elimina del mapa.
			   if(tmpMarker != null){
			   		tmpMarker.setMap(null);
			   	}
			   	
			   //Crea el marcador que se muestra al usuario donde hizo click.
			   var marker = new google.maps.Marker({
				  position: location,
				  draggable:true,
				  map:map,
			   });
			   //El marcador queda almacenado mientras se define que tipo de punto es.
			   tmpMarker = marker;
   
			   var contentString = '<div class="butTipo" id="butRP"><button>Origen</button></div>'+
									'<div class="butTipo" id="butRP"><button>Punto intermedio</button></div>'+ 			//Muestra la versión del infowindow para calcular rutas.
									'<div class="butTipo" id="butRF"><button>Destino</button></div>';
									
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
			
			//Muestra el boton en la esquina superior derecha del mapa para la geolocalización.
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
			
			//Muestra el boton en la esquina superior derecha del mapa para calcular rutas.
			function crearControlRuta(divContainer,map){
				var divBoton = document.createElement('div');
				divBoton.style.backgroundColor = '#fff';
				divBoton.style.border = '2px solid #fff';
				divBoton.style.borderRadius = '3px';
				divBoton.style.boxShadow = '0 2px 6px rgba(0,0,0,.3)';
				divBoton.style.cursor = 'pointer';
				divBoton.style.marginBottom = '22px';
				divBoton.style.textAlign = 'center';
				divBoton.innerHTML = '<img src="../assets/rutas_icon.png"></img>';
				divBoton.title = 'Click para calcular una ruta';
				divContainer.appendChild(divBoton);
				divBoton.addEventListener('click',mostrarUIRuta);
				map.controls[google.maps.ControlPosition.TOP_RIGHT].push(divContainer);
			}
	
			//Obtiene la ubicacion del usuario y centra el mapa en ella.
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
			
			//Muestra los controles de origen y destino.
			//Define el estilo CSS dinamicamente.
			//Habilita la ventana emergente con click izquierdo para que el usuario escoja destino, origen o punto intermedio.
			function mostrarUIRuta(){
				map.addListener('click', function(event) {						//El mapa escuchara eventos (click) y ejecuta la funcion
					addMarker(event.latLng);								//Funcion de Ciro para agregar puntos.
					//printArrayJQ();							//Funcion de Ciro para mostrar puntos dinamicamente.
					//addMarkerToBD("Prueba",event.latLng.lat(),event.latLng.lng(),icono,"Prueba descripcion",null,null);		//Funcion para agregar el punto de interés a la BD.
					markPoint = event.latLng;
				});	
				var container = document.createElement('div');
				var lblOrigen = document.createElement('div');
				var lblDestino = document.createElement('div');
				var txtOrigen = document.createElement('input');
				var txtDestino = document.createElement('input');
				var btnRuta = document.createElement('button');
				container.appendChild(lblOrigen);
				container.appendChild(txtOrigen);
				container.appendChild(lblDestino);
				container.appendChild(txtDestino);
				container.appendChild(btnRuta);
				container.style.width = '500px';
				container.style.margin = 'auto';
				container.style.border = '3px solid black';
				btnRuta.innerHTML = 'Calcular Ruta';
				btnRuta.onclick = function() { calcRuta();cleanMarkers(); }
				btnRuta.style.width = '120px';
				btnRuta.id = 'btnRu';
				btnRuta.style.height = '20px';
				txtOrigen.style.type = 'text';
				txtOrigen.id='txtOr';
				txtDestino.id='txtDe';
				lblOrigen.style.float = 'left';
				lblOrigen.innerHTML = 'Origen:';
				txtDestino.style.float = 'left';
				lblDestino.style.float = 'left';
				lblDestino.innerHTML = 'Destino:';
				txtOrigen.style.float = 'left';
				txtDestino.style.type = 'text';
				map.controls[google.maps.ControlPosition.TOP_CENTER].push(container);
			}
			
			//Limpia todos los marcadores del mapa.
			function cleanMarkers(){
				if (Marker1 != null) Marker1.setMap(null); Marker1 = null;
				if (Marker2 != null) Marker2.setMap(null); Marker2 = null;
				if (tmpMarker != null) tmpMarker.setMap(null); tmpMarker = null;
			}
			
			//Utiliza la posicion de inicio y destino establecidas por el usuario para calcular la ruta con el api de google.
			function calcRuta(){
				var request = {													//Parametros utilizados para las direcciones.
					origin:Marker1.position,
					//waypoints:RWayPoints,										//ALEX AQUI VAN LOS WAYPOINTS.
					destination:Marker2.position,
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
			}
			
				
				
			
			
			
			