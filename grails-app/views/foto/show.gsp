<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:stylesheet href="foto.css"/>
<asset:javascript src="foto.js"/>
</head>

<body>

<div id="container">

<div id="navbar">
<img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${inx}")}" width='800' height='600'/>
</div>

<div id="content">

<g:render template="comentario" model="[comentarios:comentarios]" />

<g:formRemote name="comentar" update="comment" url="[resource:comentarioInstance, action:'save',controller:'Comentario']" after="limpiar()">
<fieldset class="form">
<g:textArea name="contenido" />
<!-- FIJARSE EN ESTE PUNTO, ESTE ES EL CAMPO INVISIBLE AL CUAL ME REFIERO --!>
<g:hiddenField name="fotoId" value="${inx}" />
</fieldset>
<fieldset class="buttons">
<g:submitButton name="create" class="save" value="Comentar" id="create" />
</fieldset>
</g:formRemote>

</div>
</div>

</body>
</html>
