<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:javascript src="mensajes.js"/>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
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
						<button id="cc">Crear Conversacion</button>
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
			Este combobox se tiene que reemplazar por algun pop up que deje escoger un usuario para crear una nueva conversacion
		<g:select name="amigoSel" id="friendSelect" from="${usuarios}" optionKey="id" optionValue="nombre"/>
		</div>
    </div>
</div>
</body>
</html>
