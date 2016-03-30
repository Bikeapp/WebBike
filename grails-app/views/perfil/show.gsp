<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>

<h1>Mi perfil</h1>
<div class="nav" role="navigation">
<ul>
<li><g:link action="actualizar">Actualizar perfil</g:link></li>
</ul>
</div>
<div id="foto">
</div>

<img src="${createLink(controller:'Perfil', action:'pintarImagen', id:"${usuario.id}")}" width='400' height='400'/>
<br>

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
