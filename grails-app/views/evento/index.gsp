<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:stylesheet href="evento.css" />
<asset:javascript src="evento.js" />
</head>

<body>

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
			<g:textField name="nombre" class="form-control" placeholder="Nombre"/>	  
		</div>
		<div class="form-group">
			<label for="descripcion">Descripción del evento:</label>
			<g:textArea name="descripcion" class="form-control" placeholder="Descripción" />					  
		</div>

		<div class="form-group">
			<label for="fecha">Fecha:</label>
			<g:datePicker class="form-control" id="fecha" name="fecha" precision="minute"/>					  
		</div>

		<div id="mapa"></div>
		<script src="https://maps.google.com/maps/api/js?callback=initMap" async defer></script>

        
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
