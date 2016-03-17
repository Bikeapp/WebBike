			var map;				//Variable donde se almacena la referencia al mapa de google.
			var icono = "parking";	//Variable para modificar el icono del marcador.
	
			//Funciones para escoger el icono que se le asignará al punto de interes.
			function crearP(){
				icono = "parking";
			}
			function crearR(){
				icono = "ruta";
			}
			function crearG(){
				icono = "parche";
			}
	
			//Funcion que inicializa los parametros iniciales del mapa de google.
			function initMap() {
				var directionsService = new google.maps.DirectionsService;			//Instanciar un servicio de direcciones
				var directionsDisplay = new google.maps.DirectionsRenderer;			//Instanciar un servicio para graficar direcciones
				var myLatlng = new google.maps.LatLng(4.5,-74);
				var options = {
					center: myLatlng,
					zoom: 9,
				}
				map = new google.maps.Map(document.getElementById('mapa'),options);	//Se le asigna el mapa de google al div con nombre 'mapa'
				
				map.addListener('rightclick', function(event) {						//El mapa escuchara eventos (click derecho) y ejecuta la funcion
					addMarkerToMap("Prueba",event.latLng.lat(),event.latLng.lng(),icono);		//Funcion para agregar el punto de interes en el mapa
					addMarkerToBD("Prueba",event.latLng.lat(),event.latLng.lng(),icono,"Prueba descripcion",null,null);		//Funcion para agregar el punto de interés a la BD.
				});
		

				var bikeLayer = new google.maps.BicyclingLayer();					//Instanciar las rutas de bicicleta si estan disponibles.
				bikeLayer.setMap(map);												//Asignar la ruta de bicicleta al mapa.					
		
				//directionsDisplay.setMap(map);									//Renderizar las direcciones del graficador sobre el mapa.		
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
			//Funcion para mostrar dinámicamente el punto en el mapa. No se almacena.
			function addMarkerToMap(nombre, lat, lon, tipo){
				var myLatLng = new google.maps.LatLng(lat, lon);
				var marker = new google.maps.Marker({
					position: myLatLng,
					map: map,
					icon: '../assets/'+tipo+'_icon.png',		//Dependiendo de la variable icono se almacena con un icono distinto.
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
				showMarkers(puntoJSON,parchesJSON);		//Graficar marcadores.		
			} 