<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>

<h1>Mis Mensajes</h1>

<div class="jumbotron">
	<div class="container">
		<div id = "menContainer">
			<div id="mensajes">
				<g:each var="contacto" in="${conversaciones}">
					<div class="contacto"><p>${contacto.u1.email}</p></div>
				</g:each>
			</div>
			<div id="contactos">
				<g:each var="mensaje" in="${mensajes}">
					<div class="mensaje"><p>${mensaje.contenido}</p></div>
				</g:each>
			</div>
			<div id="input">
				<g:form>
					<g:select name="convSel" from="${conversaciones}" optionKey="id" optionValue="id"/>
					<g:select name="menSel" from="${mensajes}" optionKey="id" optionValue="id"/>
					<g:textField name="contenido" value="Por favor escriba un mensaje"/>
					<g:actionSubmit value="Crear Mensaje" action="crearM"/>
					<g:actionSubmit value="Crear Conversacion" action="crearC"/>
				</g:form>
			</div>
		</div>
    </div>
</div>
</body>
</html>
