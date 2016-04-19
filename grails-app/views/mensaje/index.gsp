<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>

  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<asset:javascript src="mensajes.js"/>
<script>
var nomUsuario = "${usuario.nombre}";


</script>

</head>

<body>

<h1>Mis Mensajes</h1>
<div class="jumbotron">
	<div class="container">
		<div id = "menContainer">
			<div id = "izqContainer">
				<div id="contactos">
				<g:form>
					<g:each var="contacto" in="${conversaciones}">
						<g:if test="${ usuario.nombre == contacto.u1.nombre  }">
							<div class="contacto">${contacto.u2.nombre}</div>
						</g:if>
						<g:if test="${ usuario.nombre == contacto.u2.nombre  }">
							<div class="contacto">${contacto.u1.nombre}</div>
						</g:if>
					</g:each>
				</g:form>
			</div>
				<div id="crearC">
					<div id="btndiv">
						<!-- Trigger the modal with a button -->
						<button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modalMensaje" >Crear Conversacion</button>
					</div>

								
		

			<!-- Modal -->
			<div id="modalMensaje" class="modal fade" role="dialog">
			  <div class="modal-dialog">

			    <!-- Modal content-->
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal">&times;</button>
			        <h4 class="modal-title">Envio de Mensajes</h4>
			      </div>
			      <div class="modal-body">
			        <g:select class="form-control" name="amigoSel" id="friendSelect" from="${usuarios}" optionKey="id" optionValue="nombre"/>
			      </div>
			      <div class="modal-footer">
			      	<button type="button" class="btn btn-primary " id="cc" data-toggle="modal" data-target="#modalMensaje" >Aceptar</button>
			        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
			      </div>
			    </div>

			  </div>
			</div>
			<!-- Fin del Modal-->

				</div>
			</div>
			<div id = "derContainer">
				<div id="mensajes"></div>
				<div id="input">
					<g:form>
						<input type="text" id="contenido" placeholder ="Escriba un mensaje"/>
						<button class="btn btn-success btn-sm disabled" id="cm">Crear Mensaje</button>
					</g:form>
				</div>
			</div>
	
		
		</div>
    </div>
</div>
</body>
</html>
