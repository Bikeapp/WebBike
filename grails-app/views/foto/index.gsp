<!DOCTYPE html>
<html lang="en">

	<head>
		<meta name="layout" content="main"/>
		<asset:stylesheet src="perfil.css"/>
			
	</head>

	<body>

<!-- 
		<h1>Mis fotos</h1>
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <div class="navbar-header">
		    	
				<g:link class="btn btn-default navbar-btn create" role="button" action="create">Agregar Imagen</g:link>
				
		      
		    </div>
		  </div>
		</nav>
		
			
	



		<div class="lightbox-container">
		    <table id="albumfotos"> 
				<g:each var="imagen" in="${imagenes}" status="i">
					
					
					<tr>
					<div class="box">
						<img alt="An example image 2" class="lightbox-image" src="${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id}")}" width='300' height='300' />
					</div>
					</tr>
					<td>
					<g:link class="btn btn-default navbar-btn create" action="show" params="[imagenactual : imagen.id]">Agregar Imagen</g:link>
					</td>
					
					
					
				</g:each>
			</table>
		    
		</div> -->

		
<div class="section">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <h1 class="text-center">Mis Fotos</h1>
               </div>
            </div>
         </div>
      </div>
      <div class="section">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div id="carousel-example" data-interval="false" class="carousel slide" data-ride="carousel">
                     <div class="carousel-inner">
                        <div class="item active">
                           <img src="${createLink(controller:'Foto', action:'pintarImagen', id:1)}">
                           <div class="carousel-caption">
                              <h2>Title</h2>
                              <p>Description</p>
                           </div>
                        </div>
						<g:each var="imagen" in="${imagenes}" status="i">
                        <div class="item">
							<img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id }")}">
                           <div class="carousel-caption">
                              <h2>${imagen.id}</h2>
                              <p>Description</p>
                           </div>
                        </div>
						</g:each>
                     </div>
                     <a class="left carousel-control" href="#carousel-example" data-slide="prev"><i class="icon-prev  fa fa-angle-left"></i></a><a class="right carousel-control" href="#carousel-example" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="section">
         <div class="container">
            <div class="row">
               <div class="col-md-6"><g:link class="btn btn-lg btn-primary" action="create">Añadir Foto</g:link></div>
               <div class="col-md-6 text-right"><a class="btn btn-lg btn-primary">Comentar</a></div>
            </div>
         </div>
      </div>
		
		
		

		<!-- <asset:stylesheet href="foto.css" /> -->
		<div >
		<!-- Example row of columns -->
		<footer>
		<p>BikeApp&copy; 2016 Company, Inc.</p>
		</footer>
		</div> <!-- /container -->

		<script>
			var index = ;
			myFunction();

			function myFunction() {
				document.getElementById("demo").innerHTML =
				"I can display " + carName;
			}
		</script>

		<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<!-- <script src="js/lightweightLightbox.min.js"></script> -->
		<asset:javascript src="lightweightLightbox.js"/>
		<asset:javascript src="foto.js"/>
		<script type="text/javascript">
		    $(".lightbox-container").lightweightLightbox();
		</script>


	</body>
</html>
