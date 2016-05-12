<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="layout" content="main"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
     <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA_RVgkXwL37ERUgWk139RbwYcSGkAF0-k&signed_in=true&language=es"
        async defer></script>
	<asset:stylesheet href="evento.css" />
	<asset:javascript src="evento.js" />
</head>

<body>

<g:javascript>
document.addEventListener("DOMContentLoaded", function(event) {
callback();
});
</g:javascript>

	<g:remoteLink class="logout" controller="logout">
	Logout
</g:remoteLink> 

<section id="portfolio">
	<div class="container">
		<div class="row">

			<div class="col-md-offset-4 col-md-4 col-xs-offset-3 col-xs-6 overflow">
				<input type="button" name="buscar" class="btn btn-submit " style="white-space:normal !important" value="Nuevo Evento" id="btnCrearGrupo" data-toggle="modal" data-target="#modalCrearEvento">
			</div>


			<g:javascript>
			var url_obtMisEventos= "${createLink(controller:'Evento',action:'obtenerMisEventos')}"
			var url_obtEventos= "${createLink(controller:'Evento',action:'obtenerEventos')}"
		</g:javascript>

		<ul class="portfolio-filter text-center">
			<li><a class="btn btn-default active" href="javascript:obtenerMisEventos('ACTIVOS')">Mis Eventos</a></li>
			<li><a class="btn btn-default" href="javascript:obtenerEventos('ACTIVOS')" data-filter="*">Eventos Futuros</a></li>
			<li><a class="btn btn-default" href="javascript:obtenerMisEventos('PASIVOS')" data-filter="*">Eventos Pasados</a></li>
			<li><a class="btn btn-default" href="javascript:obtenerEventos('PASIVOS')">Eventos Pasados</a></li>
		</ul><!--/#portfolio-filter-->

		<div id="lista-eventos">
			<g:render template="listaEventos" />
		</div>

	</div>
</div>

<div id="modalCrearEvento" class="modal fade" role="dialog">
	<div class="modal-dialog">

		<g:form url="[resource:instance, action:'guardar']"  enctype="multipart/form-data">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">Nuevo Evento</h4>
			</div>
			<div class="modal-body">

				<g:hiddenField id="lat" name="lat" value="-1" />
				<g:hiddenField id="lng" name="lng" value="-1" />

				<div class="form-group">
					<label for="nombre">Nombre del evento:</label>
					<g:textField  required="true" name="nombre" class="form-control" placeholder="Nombre"/>	  
				</div>
				<div class="form-group">
					<label for="descripcion">Descripción del evento:</label>
					<g:textArea required="true" name="descripcion" class="form-control" placeholder="Descripción" />					  
				</div>

				<div class="form-group">
					<label for="fecha">Fecha:</label>
					<g:datePicker  class="form-control" id="fecha" name="fecha" precision="minute"/>					  
				</div>

				
				<ul id="tab1" class="nav nav-tabs">
					<li class="active"><a href="#tab1-item1" data-toggle="tab">Punto de Encuentro</a></li>
					<li><a href="#tab1-item2" data-toggle="tab" id="to_map2">Mapa de Ruta</a></li>
				</ul>



				<div class="tab-content">

					<g:hiddenField name="lng" id="lng" value="4.634560"/>
					<g:hiddenField name="lat" id="lat" value="-74.083028"/>

					<div class="tab-pane fade active in" id="tab1-item1">
						<div id="mapa-pe" class="mapa">
						</div>
					</div>

					<div class="tab-pane fade" id="tab1-item2">
						<div id="mapa-rt" class="mapa">
						</div>
					</div>

				</div>


			</div>


			<div class="modal-footer">
				<g:submitButton class="btn btn-submit" name="create"  value="Crear" id="create" />
			</div>
		</div>

	</g:form>

</div>
</div>
</section>



</body> </html>
