
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

			<g:javascript>
			var arg = [];
			document.addEventListener("DOMContentLoaded", function(event) {
			initMaps(arg);
			});
			</g:javascript>

		</g:form>

	</div>
</div>