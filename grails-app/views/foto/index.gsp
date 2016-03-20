<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>
<body>


<h1>Mis fotos</h1>
<div class="nav" role="navigation">
<ul>
<li><g:link class="create" action="create">Agregar Imagen</g:link></li>
</ul>
</div>

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


<asset:stylesheet href="foto.css" />
<div class="container">
<!-- Example row of columns -->
<footer>
<p>BikeApp&copy; 2016 Company, Inc.</p>
</footer>
</div> <!-- /container -->

</body>
</html>
