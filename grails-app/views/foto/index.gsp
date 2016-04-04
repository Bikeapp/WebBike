<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
	<asset:stylesheet src="lightweightLightbox.css"/>
	<style>
    .box img { width: 300px; float:left; border:1px solid #ccc; padding:5px; margin:10px;}
    h1 { margin-top:50px; text-align:center;}
    .jquery-script-ads { width:728px; margin:50px auto;}
    </style>
</head>
<body>


<h1>Mis fotos</h1>
<div class="nav" role="navigation">
<ul>
<li><g:link class="create" action="create">Agregar Imagen</g:link></li>
</ul>
</div>



<div class="lightbox-container">


    
		<g:each var="imagen" in="${imagenes}" status="i">
		<!-- <g:link action="show" params="[imagenactual : imagen.id]"> -->
		<div class="box">
      <img alt="An example image 2" class="lightbox-image" src="${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id}")}" width='300' height='300' />
	  </div>
	  <!-- </g:link> -->
	  </g:each>
  
    
</div>



<!-- <asset:stylesheet href="foto.css" /> -->
<div >
<!-- Example row of columns -->
<footer>
<p>BikeApp&copy; 2016 Company, Inc.</p>
</footer>
</div> <!-- /container -->



<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<!-- <script src="js/lightweightLightbox.min.js"></script> -->
<asset:javascript src="lightweightLightbox.js"/>
<asset:javascript src="foto.js"/>
<script type="text/javascript">
    $(".lightbox-container").lightweightLightbox();
</script>


</body>
</html>
