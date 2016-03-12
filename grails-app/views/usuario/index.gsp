<!DOCTYPE html>
<html lang="en">
  <head>

    <title>BikeApp - ¡Muevete por Bogotá!</title>

  </head>

  <body>
	<g:form name="myForm" controller="usuario">
		<label>Nombre:</label><g:textField name="usuario"/>
		<label>Email:</label><g:textField name="email"/>
		<label>Contraseña:</label><g:textField name="contrasena"/>
		<label>Fecha:</label><g:textField name="fecha"/>
		<g:actionSubmit action="registro" value="Registrar!"/>
	</g:form>
  </body>
</html>
