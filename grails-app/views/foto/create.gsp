<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:stylesheet href="foto.css" />
</head>

<body>

<h1>Subir una foto</h1>
<ul>
<li><g:link class="list" action="index">Regresar a las fotos</g:link></li>
</ul>

<div role="navigation">
<g:form url="[resource:fotoInstance, action:'save']"  enctype="multipart/form-data">

<div id="controlessubir" class="controlessubir">
<fieldset class="form">
<input type="file" id="selector" name="selector" />
<img id="vistaimagen" src="" height="600" width="500" />
</fieldset>
</div>

<div id="derecho">
<fieldset class="buttons">
<g:submitButton name="create" class="save" value="Subir" id="create" />
<g:checkBox name="ubicacion" id="ubicacion" />Incluir ubicación
<g:hiddenField id="lat" name="lat" value="NONE" />
<g:hiddenField id="lng" name="lng" value="NONE" />
<script src="https://maps.google.com/maps/api/js?callback=initMap" async defer></script>
<div id="mapa"></div>
</fieldset>
</div>


</g:form>
</div>

<asset:javascript src="foto.js" />
</body>
</html>
