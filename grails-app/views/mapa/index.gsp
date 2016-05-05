<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>

<!DOCTYPE html>
<html>
  <head>
  	<!-- Cargamos el css propio de la pagina antes del layout para que sobreescriba solo lo que necesitamos -->
  	<asset:stylesheet src="mapa.css"/>
  	<meta name="layout" content="main"/>
  	<script src="https://maps.google.com/maps/api/js?sensor=false&amp;language=es-ES"></script>
  	<asset:javascript src="mapa.js"/>
  	<asset:javascript src="ruta.js"/>
    <title>Mapa</title>
  </head>
  <body>
    <section id="page-breadcrumb">
			<div class="vertical-center sun">
				 <div class="container">
					<div class="row">
						<div class="action">
							<div class="col-sm-12">
								<h1 class="title">Mapa</h1>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
  	<g:javascript>
  		
		document.addEventListener("DOMContentLoaded", function(event) {
    		test(${puntos as JSON},${parches as JSON});
  		});
	</g:javascript>
    <div id="map-container">
        <div id="gmap"></div>
    </div>
  </body>
</html>
