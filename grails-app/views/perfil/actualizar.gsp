<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>

<div role="navigation">
<g:form action="update"  enctype="multipart/form-data">
<fieldset class="form">
<div id="controlessubir" class="controlessubir">
<img id="vistaimagen" src="${createLink(controller:'Perfil', action:'pintarImagen', id:"${usuario.id}")}" width='400' height='400'/>
<br>
<input type="file" id="fileload" name="selector" />
</div>
Mensaje personal: <g:textArea name="mensaje" value="${usuario.mensaje}" />
<br>
Nombre de Usuario: <g:textField name="username" value="${usuario.username}" />
<br>
Email: <g:textField name="email" value="${usuario.email}" />
<br>
Sexo: <g:select name="sexo" value="${usuario.sexo}" from="${sexos}" />
<br>
Fecha de nacimiento: <g:textField name="fecha" value="${usuario.fecha}" />
</fieldset>
<p>
<fieldset class="buttons">
<g:submitButton name="update" class="update" value="Actualizar" id="update" />
</fieldset>
</g:form>
</div>


<asset:javascript src="perfil.js"/>

</body>
</html>
