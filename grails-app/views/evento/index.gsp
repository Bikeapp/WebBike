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
<g:each var="evento" in="${misEventos}">
${evento.descripcion}
</g:each>

</div>


</body>
</html>
