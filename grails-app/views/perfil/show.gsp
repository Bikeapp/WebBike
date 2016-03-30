<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:stylesheet href="foto.css"/>
<asset:javascript src="foto.js"/>
</head>

<body>


<h1>Mi perfil</h1>
<div class="nav" role="navigation">
<ul>
<li><g:link action="actualizar" params="[usuario:usuario]">Actualizar perfil</g:link></li>
</ul>
</div>
<div id="foto">


</div>

Mensaje distintivo: ${usuario.mensaje}
<br>
Nombre de usuario: ${usuario.username}
<br>
Email: ${usuario.email}
<br>
Sexo: ${usuario.sexo}
<br>
Fecha de Nacimiento: ${usuario.fecha}


</body>
</html>
