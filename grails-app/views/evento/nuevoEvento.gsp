<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>

<h1>Crear ua evento</h1>
<ul>
<li><g:link class="list" action="index">Regresar a las fotos</g:link></li>
</ul>
</div>

<g:form url="[resource:instance, action:'guardar']"  enctype="multipart/form-data">
<fieldset class="form">
<div id="controlessubir" class="controlessubir">

Descripcion: <g:textArea id="descripcion" name="descripcion" />

</div>
</fieldset>
<p>

<fieldset class="buttons">
<g:submitButton name="create" class="save" value="Crear" id="create" />
</fieldset>
</g:form>


</body>
</html>
