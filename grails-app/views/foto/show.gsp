<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:stylesheet href="foto.css"/>
<asset:javascript src="foto.js"/>
</head>

<body>

	<div id="foto">
		<img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${inx}")}" width='400' height='400'/>
	</div>

    <div id="dialogbox">
		<g:render template="comentario" model="[comentarios:comentarios]" />
	</div>
    
	<div id="comentarios">
	<form name="comentario">
		<g:textArea name="contenido" style="width:550px; height: 400px; background-color: transparent;"></g:textArea>
		<input type="button" onclick="save()" value="Comentar">
		<g:hiddenField name="fotoId" value="${inx}"/>
		<g:javascript>
			var url = "${createLink(controller:'comentario',action:'save')}"
		</g:javascript>
	</form>
	</div>


</body>
</html>
