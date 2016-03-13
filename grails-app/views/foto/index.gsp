<!DOCTYPE html>
   <html lang="en">
<head>
  	<meta name="layout" content="main"/>
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

<h1>Mis fotos</h1>
<div class="nav" role="navigation">
<ul>
<li><g:link class="create" action="create">Agregar Imagen</g:link></li>
</ul>
</div>



<table>
<thead>
<tr>
</tr>
</thead>
<tbody>
<g:each in="${fotoInstanceList}" status="i" var="fotoInstance">
<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
<td>
<img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${fotoInstance.id}")}" width='300' height='300'/>
</td>
<td>
${fotoInstance.usuario}
</td>
</g:each>
</tbody>
</table>


<g:each var="imagen" in="${imagenes}" status="i">
<img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id}")}" width='300' height='300'/>
<br>
</g:each>


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
