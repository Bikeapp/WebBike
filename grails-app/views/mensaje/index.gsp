<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<asset:javascript src="mensajes.js"/>
</head>

<body>
<div class="jumbotron">
	<div class="container">
		<div id = "menContainer">
			<div id = "izqContainer">
				<div id="contactos">
				<g:form>
					<g:each var="contacto" in="${conversaciones}">
						<g:if test="${ usuario.nombre == contacto.u1.nombre  }">
							<div class="contacto">${contacto.u2.username}</div>
						</g:if>
						<g:if test="${ usuario.nombre == contacto.u2.nombre  }">
							<div class="contacto">${contacto.u1.username}</div>
						</g:if>
					</g:each>
				</g:form>
			</div>
				<div id="crearC">
					<div id="btndiv">
						<button id="opener">+</button>
						<div id="dialog" title="Seleccione un amigo">
							<g:each var="amigo" in="${amigos}">
								<div class="amigo">${amigo}</div>
							</g:each>
						</div>
					</div>
				</div>
			</div>
			<div id = "derContainer">
				<div id="mensajes"></div>
				<div id="input">
					<g:form>
						<input type="text" id="contenido" value="Por favor escriba un mensaje"/>
						<button id="cm">Crear Mensaje</button>
					</g:form>
				</div>
			</div>
		</div>
    </div>
</div>
<script>
var nomUsuario = "${usuario.nombre}";
var theDialog = $( "#dialog" ).dialog({
	autoOpen: false,
	buttons:
	[
		{
		  text: "Crear Conversacion",
		  click: function() {
			crearConversacion();
			$( this ).dialog( "close" );
		  }
		}
	] 
});

</script>
</body>
</html>
