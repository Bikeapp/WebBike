<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>

<!DOCTYPE html>
<html>
  <head>
  	<meta name="layout" content="main"/>
  	<script src="https://maps.google.com/maps/api/js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js">
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
      	<div id="right-panel"  ></div>
      </div>
    </div>
  </body>
</html>
