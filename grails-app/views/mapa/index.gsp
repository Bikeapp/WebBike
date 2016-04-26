<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>

<!DOCTYPE html>
<html>
  <head>
  	<meta name="layout" content="main"/>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_RVgkXwL37ERUgWk139RbwYcSGkAF0-k&signed_in=true&language=es"></script>  	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">  
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    </script>  
  	<asset:javascript src="mapa.js"/>
  	<asset:javascript src="ruta.js"/>
    <title>Mapa</title>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      .btn-circle {
        width: 30px;
        height: 30px;
        text-align: center;
        padding: 6px 0;
        font-size: 12px;
        line-height: 1.428571429;
        border-radius: 15px;
      }
      .btn-circle.btn-lg {
        width: 70px;
        height: 70px;
        padding: 10px 16px;
        font-size: 18px;
        line-height: 1.33;
        border-radius: 35px;
      }
    </style>
  </head>
  <body>
  	<g:javascript>
		google.maps.event.addDomListener( window, 'load', function() { test	(${puntos as JSON},${parches as JSON}) } );
	</g:javascript>
	<div class="jumbotron">
    <div class="row ">
     
    </div>
      <div class="container">
      	<div id="mapa" ></div>
      	<div id="right-panel"  >
          <p>Distancia Total: <span id="total"></span></p>
        </div>
      </div>
    </div>
  </body>
</html>
