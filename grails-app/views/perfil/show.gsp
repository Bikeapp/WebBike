<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>

<h1>${usuario.username}</h1>

<ul>
<li><g:link controller="Foto" action="fotosUsuario" params="[username:usuario.username]">Fotos</g:link></li>
</ul>

<div class="nav" role="navigation">
</div>
<div id="foto">
</div>

<g:if test="${usuario.foto != null}">
<img src="${createLink(controller:'Perfil', action:'pintarImagen', id:"${usuario.id}")}" width='400' height='400'/>
</g:if>
<g:else>
<img src="${assetPath(src:'no_photo.png')}" width='400' height='400'/>
</g:else>
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
