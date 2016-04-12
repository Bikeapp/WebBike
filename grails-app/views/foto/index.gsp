<!DOCTYPE html>
<html lang="en">

	<head>
		<meta name="layout" content="main"/>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">
			<asset:stylesheet src="lightweightLightbox.css"/>
			<asset:stylesheet src="bootstrap.min.css"/>
			<style>
				h1,
				h2,
				h3,
				h4,
				h5,
				h6 {
					color: black;
					font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
				    text-transform: uppercase;				    			   
				    font-weight: 700;
				    letter-spacing: 1px;
				}
				body {
				    
				    background: url('${resource(dir: "images", file: "bicycles_gears.jpg")}'); 
				    background-size: auto auto;
				    background-attachment: fixed;
				   
				}
				footer {
				    position: fixed;
   					 bottom: 0;
				}
			    .box img { width: 300px; float:left; border:1px solid #ccc; padding:5px; margin:10px;}
			    h1 { margin-top:50px; text-align:center;}
			    .jquery-script-ads { width:728px; margin:50px auto;}

		    </style>
	</head>

	<body>


		<h1>Mis fotos</h1>
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <div class="navbar-header">
		    	
				<g:link class="btn btn-default navbar-btn create" role="button" action="create">Agregar Imagen</g:link>
				
		      
		    </div>
		  </div>
		</nav>
		
			
	



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
