<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>

<!DOCTYPE html>
<html>
  <head>
  	<meta name="layout" content="main"/>
  	<script src="https://maps.google.com/maps/api/js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js">
    </script>
    <script>
      $(document).ready(function(){

          $("#mapa").fadeOut(500);
          $("#right-panel").fadeOut(500);

          var flag_mapa=true;

          $("#boton_mostrar_mapa").click(function(){

            if(flag_mapa){
              $(this).html("Ocultar Mapa");
              $("#mapa").fadeIn();
              $("#right-panel").fadeIn();
            }else{
              $(this).html("Mostrar Mapa");
              $("#mapa").fadeOut();
              $("#right-panel").fadeOut();
            }
            flag_mapa=(!flag_mapa);
            
          });
          
      });
      
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
      <div class="col-md-offset-5 col-xs-offset-5 col-md-2 col-xs-2">
         <button id="boton_mostrar_mapa" type="button" class="btn btn-primary btn-lg" style="margin:10px">Mostrar Mapa</button>
      </div>
     
    </div>
      <div class="container">
      	<div id="mapa" ></div>
      	<div id="right-panel"  ></div>
      </div>
    </div>
  </body>
</html>
