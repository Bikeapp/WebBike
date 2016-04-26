<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>

<!DOCTYPE html>
<html>
  <head>
  	<meta name="layout" content="main"/>
  	<script src="https://maps.google.com/maps/api/js?sensor=false&amp;language=es-ES"></script>
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
      <div class="container">
      	<div id="mapa"></div>
      	<div id="right-panel"></div>
      </div>
    </div>
  </body>
</html>
