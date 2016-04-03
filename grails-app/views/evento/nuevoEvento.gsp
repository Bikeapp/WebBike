<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<!-- ATENTOS DIFIERE MI LLAMADO AL DE FELIPE, FELIPE LO HACE INYECTANDO EL MÉTODO EN EL EVENTO POR MEDIO DE DOM-->
<script src="https://maps.google.com/maps/api/js?callback=initMap" async defer></script>
<asset:javascript src="evento.js" />
<asset:stylesheet href="evento.css" />
</head>

<body>

<h1>Crear ua evento</h1>
<ul>
<li><g:link class="list" action="index">Regresar a las eventos</g:link></li>
</ul>

<g:form url="[resource:instance, action:'guardar']"  enctype="multipart/form-data">
<fieldset class="form">
<div id="formulario">
<div id="controlessubir">
Descripcion: <g:textArea id="descripcion" name="descripcion" />
<br>
Fecha y Hora: <g:datePicker id="fecha" name="fecha" />

<g:hiddenField id="lat" name="lat" value="-1" />
<g:hiddenField id="lng" name="lng" value="-1" />
<fieldset class="buttons">
<g:submitButton name="create" class="save" value="Crear" id="create" />
</fieldset>
</div>
<div id="mapa"></div>
</fieldset>
<p>
</g:form>



</body>
</html>
