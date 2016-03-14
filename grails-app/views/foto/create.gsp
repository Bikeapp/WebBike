<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>

<h1>Subir una foto</h1>
<ul>
<li><g:link class="list" action="index">Regresar a las fotos</g:link></li>
</ul>
</div>

<div role="navigation">
<g:form url="[resource:fotoInstance, action:'save']"  enctype="multipart/form-data">
<fieldset class="form">
<div id="controlessubir" class="controlessubir">
<img id="vistaimagen" src="" height="600" width="500" />
<input type="file" id="selector" name="selector" />
</div>
</fieldset>
<p>
<fieldset class="buttons">
<g:submitButton name="create" class="save" value="Subir" id="create" />
</fieldset>
</g:form>
</div>


<asset:javascript src="foto.js" />
<asset:stylesheet href="foto.css" />
<div class="container">
<!-- Example row of columns -->
<footer>
<p>BikeApp&copy; 2016 Company, Inc.</p>
</footer>
</div> <!-- /container -->
</body>
</html>
