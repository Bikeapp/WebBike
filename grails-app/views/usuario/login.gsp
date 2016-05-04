<!DOCTYPE html>
<html lang="en">
<head>
  	<meta name="layout" content="public"/>
</head>

<body>

Algo ha salido mal, por favor vuelve a intentarlo.

<div class="form">
<fieldset>
<g:form name="login" method="POST" uri="/j_spring_security_check">
<label for="j_username">Email</label>
<input type="text" name="j_username" required placeholder="Enter a valid email">
<label for="j_password">Contraseña</label>
<input type="password" name="j_password" required placeholder="Enter a valid password">
<g:submitButton class="button" name="submitButton" value="Ingresar!" />
</g:form>
</fieldset>
</div>


Recuerda:

<ul>
   <li> Ingresar tu nombre de usuario y contraseña de forma correcta </li>
   <li> Revisar las mayúsculas </li> 
   <li> Validar tu cuenta, sino recibiste el correo haz click <g:link controller="usuario" action="correo" >aquí</g:link></li>
</ul>

</body>
</html>
