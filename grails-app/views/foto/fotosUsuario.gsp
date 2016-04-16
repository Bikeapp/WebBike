<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:stylesheet href="foto.css" />
</head>
<body>


<h1>Fotos de ${username}</h1>

<div id="divfotos" class="albumfotos">
<table id="albumfotos"> 
<g:each var="imagen" in="${imagenes}" status="i">
<g:if test="${ i%3 == 0}">
<tr>
<g:if test="${ i != 0}">
</tr>
</g:if>
</g:if>
<td>
<g:link action="show" params="[imagenactual : imagen.id]">
<img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id}")}" width='150' height='150'/>
</g:link>
</td>
</g:each>
</table>
</div>

</body>
</html>
