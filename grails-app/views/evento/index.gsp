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
<li><a class="btn btn-default" href="javascript:obtenerEventos('ACTIVOS')" data-filter="*">Lo que viene</a></li>
<li><a class="btn btn-default" href="javascript:obtenerMisEventos('PASIVOS')" data-filter="*">A lo que fuí</a></li>
<li><a class="btn btn-default" href="javascript:obtenerEventos('PASIVOS')">Lo que me perdí</a></li>
</ul><!--/#portfolio-filter-->

<div id="lista-eventos">
<g:render template="listaEventos" />
</div>



</div>
</div>

<g:render template="modal" />
</section>

<g:javascript>
			var arg = [];
			document.addEventListener("DOMContentLoaded", function(event) {
			initMaps(arg);
			});
</g:javascript>

</body> </html>
