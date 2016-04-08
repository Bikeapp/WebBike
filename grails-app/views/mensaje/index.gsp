<%@ defaultCodec="none" %> 
<%! import grails.converters.JSON %>


<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:javascript src="mensajes.js"/>


</head>

<body>

<h1>Mis Mensajes</h1>

<div class="jumbotron">
	<div class="container">
		<div id = "menContainer">
			<div id="contactos">
				<g:form>
					<g:each var="contacto" in="${conversaciones}">
						<div class="contacto">${contacto.u2.nombre}</div>
					</g:each>
					<div id="btndiv">
						<button id="cc">Crear Conversacion</button>
					</div>
					<!--FALTA CREAR UNA INTERFAZ PARA QUE EL USUARIO SELECCIONE A UN AMIGO O TODOS EN ESTE CASO.--!>
				</g:form>
			</div>
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
</body>
</html>
