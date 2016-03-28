<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>

<!DOCTYPE html>
<html>
  <head>
  	<meta name="layout" content="main"/>
  	<script src="https://maps.google.com/maps/api/js?key=AIzaSyA_RVgkXwL37ERUgWk139RbwYcSGkAF0-k&language=es"></script>
  	<asset:javascript src="mapa.js"/>
  	<asset:javascript src="ruta.js"/>
    <title>Mapa</title>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }

      #mapa {
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
  	<g:javascript>
		google.maps.event.addDomListener( window, 'load', function() { test	(${puntos as JSON},${parches as JSON}) } );
	</g:javascript>
	
	<div class="jumbotron">
      <div class="container">
      	<div id="mapa"></div>
        <div id="right-panel">
          <p>Distancia Total: <span id="total"></span></p>
        </div>
      </div>
    </div>
  </body>
</html>
