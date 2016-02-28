<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>

<!DOCTYPE html>
<html>
  <head>
  	<script src="https://maps.google.com/maps/api/js"></script>
  	<asset:javascript src="mapa.js"/>
    <title>Mapa</title>
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #mapa {
        height: 500px;
        width: 500px;
      }
    </style>
  </head>
  <body>
  	<g:javascript>
		google.maps.event.addDomListener( window, 'load', function() { test(${puntos as JSON},${parches as JSON}) } );
	</g:javascript>
    <div id="mapa"></div>
    
    <div id="formulario">
    	<g:form name="myForm" controller="mapa">
    		<label>Tipo:</label><g:textField name="tipo"/></br>
    		<label>Long:</label><g:textField name="lon"/></br>
    		<label>Lat:</label><g:textField name="lat"/></br>
    		<label>Nombre:</label><g:textField name="nombre"/></br>
    		<label>Descripcion:</label><g:textField name="descripcion"/></br>
    		<g:actionSubmit action="registrar" value="Registrar!"/>
    	</g:form>
    </div>
    <div>
    	<g:form name="formParche" controller="mapa">
    		<label>Nombre:</label><g:textField name="nombre"/></br>
    		<label>Descripcion:</label><g:textField name="descripcion"/></br>
    		<label>Lon:</label><g:textField name="lon"/></br>
    		<label>Lat:</label><g:textField name="lat"/></br>
    		<label>Usuario:</label><g:select name="usuario" from="${usuarios}" optionValue="usuario" optionKey="id"/></br>
    		<label>Tipo:</label><g:textField name="tipo"/></br>
    		<g:actionSubmit action="parche" value="Crear!"/>
    	</g:form>
    </div>
    <div>
    	<g:select name="usuarios" from="${usuarios}" optionValue="id"/>
    	<g:select name="parches" from="${parches}" optionValue="id"/>
    	<g:select name="puntos" from="${puntos}" optionValue="id"/>
    	</br>
  </body>
</html>
