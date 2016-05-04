<!DOCTYPE html>
<html lang="en">
<head>
  	<meta name="layout" content="public"/>
</head>

<body>

Por favor ingresa tu nombre de usuario

<g:form url="[action:'reenviar']"  enctype="multipart/form-data">
<g:textField name="usuario" />
<g:submitButton class="button" name="submitButton" value="Enviar Correo!" />
</g:form>


</body>
</html>
