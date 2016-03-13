<!DOCTYPE html>
<asset:stylesheet href="bootstrap.min.css"/>
<asset:stylesheet href="bikeApp.css"/>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
   <link rel="stylesheet" href="${resource(dir: 'css', file: 'ruta.css')}" type="text/css">
<title>BikeApp - ¡Muevete por Bogotá!</title>
</head>

<body>




<nav class="navbar navbar-inverse navbar-fixed-top">
<div class="container">
<div class="navbar-header">
<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
<span class="sr-only">Toggle navigation</span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<a class="navbar-brand" href="/WebBike">BikeApp</a>
</div>
</div>
</nav>
</br></br></br>




<h1>Agregar una foto</h1>
<div class="nav" role="navigation">
<ul>
<li><g:link class="list" action="index">Regresar a las fotos</g:link></li>
</ul>
</div>






<g:form url="[resource:fotoInstance, action:'save']"  enctype="multipart/form-data">

<fieldset class="form">
<!-- <g:render template="form"/> -->
<img id="vista_imagen" src="" height="600" width="500" />
<input type="file" id="imagen" name="imagen" />
<script>
function readURL(input) {

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#vista_imagen').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#imagen").change(function(){
    readURL(this);
});
</script>

</fieldset>

<p>
<fieldset class="buttons">
<g:submitButton name="create" class="save" value="Subir" />
</fieldset>
</g:form>



<!-- TRABAJO CON JQUERY -->
<script src="https://maps.googleapis.com/maps/api/js?callback=initMap" async defer></script>
<!-- <asset:javascript src="ruta.js"/> -->



<div class="container">
<!-- Example row of columns -->
<footer>
<p>BikeApp&copy; 2016 Company, Inc.</p>
</footer>
</div> <!-- /container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="../../dist/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
