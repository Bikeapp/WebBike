<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>


<h1>Mis eventos</h1>
<div class="nav" role="navigation">
<ul>
<li><g:link action="nuevoEvento">Crear evento</g:link></li>
</ul>
</div>

<div id="misEventos" >
<table>
<g:each var="evento" in="${misEventos}">
<tr>
<td>
${evento.descripcion}   
</td>
<td>
${evento.fecha}
</td>
</tr>
</g:each>
</table>

</div>


</body>
</html>
