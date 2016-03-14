var map;
			var icono;
	
			function crearP(){
				icono = "parking";
			}
			function crearR(){
				icono = "ruta";
			}
			function crearG(){
				icono = "parche";
			}
	
	
			function initMap() {
				var directionsService = new google.maps.DirectionsService;
				var directionsDisplay = new google.maps.DirectionsRenderer;
				var myLatlng = new google.maps.LatLng(4.5,-74);
				var options = {
					center: myLatlng,
					zoom: 9,
				}
				map = new google.maps.Map(document.getElementById('mapa'),options);
				map.addListener('rightclick', function(event) {
					addMarkerToMap("Prueba",event.latLng.lat(),event.latLng.lng(),icono);
					addMarkerToBD("Prueba",event.latLng.lat(),event.latLng.lng(),icono,"Prueba descripcion",null,null);
				});
		

				var bikeLayer = new google.maps.BicyclingLayer();
				bikeLayer.setMap(map);
		
				//directionsDisplay.setMap(map);
		
				//var reCalculate = function() { calculateAndDisplayRoute(directionsService, directionsDisplay); };
		
				//document.getElementById('start').addEventListener('change', onChangeHandler);


		
		
			}
			function addMarkerToBD(nombre, lat, lon, tipo, descripcion, usuario, ruta){
       			$.ajax({
					url: 'registrarPuntoTest',
					type: 'POST',
					dataType: 'text',
					data: {
						nombre: nombre,
						lat: lat,
						lon: lon,
						tipo: tipo,
						descripcion: descripcion,
						usuario: usuario,
						ruta: ruta
					},
					success: function(data) {
						alert(data);
					}
				});
			}
			function addMarkerToMap(nombre, lat, lon, tipo){
				var myLatLng = new google.maps.LatLng(lat, lon);
				var marker = new google.maps.Marker({
					position: myLatLng,
					map: map,
					icon: '../assets/'+tipo+'_icon.png',
				});
			}
			function test(puntosJSON,parchesJSON){
				initMap();
				for (var i=0; i < puntosJSON.length; i++) {
					var punto = puntosJSON[i];
					addMarkerToMap(punto.nombre,parseInt(punto.lat),parseInt(punto.lon),punto.tipo);
				}
				for (var i=0; i < parchesJSON.length; i++) {
					var parche = parchesJSON[i];
					addMarkerToMap(parche.nombre,parseInt(parche.lat),parseInt(parche.lon),"parche");
				}
		
			} 