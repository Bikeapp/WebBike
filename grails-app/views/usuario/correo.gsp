<!DOCTYPE html>
<html lang="en">
<head>

</head>

<body>

<sec:ifLoggedIn>
<!-- MANEJAR SI EL USUARIO YA INICIO SESION -->
<script>
var link = '<g:createLink controller="perfil" action="index" />'
window.location.replace(link);
</script>
</sec:ifLoggedIn>


Por favor ingresa tu nombre de usuario

<g:form url="[action:'reenviar']"  enctype="multipart/form-data">
<g:textField name="usuario" />
<g:submitButton class="button" name="submitButton" value="Enviar Correo!" />
</g:form>


</body>
</html>
