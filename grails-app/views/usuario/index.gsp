<!DOCTYPE html>
<html lang="en">
  <head>
  	<meta name="layout" content="main"/>
      <asset:stylesheet src="style.css"/>
  </head>

  <body>
    <div class="wrap">

  <div class="formholder2">
       <fieldset>
<g:form name="myForm" controller="usuario">

<center><label>Nombre:</label></center>
<center><g:textField name="usuario"/></br></center>
<center><label>Email:</label></center>
<center><g:textField name="email"/></center>
<center><label>Contraseña:</label></center>
<center><g:textField name="contrasena"/></center>
<center><label>Fecha:</label></center>
<center><g:textField name="fecha"/></center></br></br>
	<center><g:actionSubmit action="registro" value="Registrar!"/></center>
	</g:form>
</fieldset>
</div>

</div>
  </body>
</html>
