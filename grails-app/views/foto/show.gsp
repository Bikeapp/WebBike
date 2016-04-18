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
<img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${inx}")}" width='400' height='400'/>
</div>

<div id="content">



      <div id="dialogbox">
<span class="tip tip-up"></span>
<g:render template="comentario" model="[comentarios:comentarios]" />

</div>
    

<form name="comentario">
<g:textArea name="contenido"></g:textArea>
<input type="button" onclick="save()" value="Comentar">
<g:hiddenField name="fotoId" value="${inx}"/>
<g:javascript>
var url = "${createLink(controller:'comentario',action:'save')}"
</g:javascript>
</form>

</div>
</div>

</body>
</html>
