<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:stylesheet href="foto.css"/>
<asset:javascript src="foto.js"/>
</head>

<body>


<div role="navigation">
<g:form url="[resource:fotoInstance, action:'save']"  enctype="multipart/form-data">
<fieldset class="form">
<div id="controlessubir" class="controlessubir">
<img id="vistaimagen" src="" height="600" width="500" />
<input type="file" id="selector" name="selector" />
</div>
</fieldset>
<p>
<fieldset class="buttons">
<g:submitButton name="create" class="save" value="Subir" id="create" />
</fieldset>
</g:form>
</div>

<div id="foto">
<img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${usuario}")}" width='400' height='400'/>
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
