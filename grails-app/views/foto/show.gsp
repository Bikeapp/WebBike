
<%@ page import="bikeapp.Foto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'foto.label', default: 'Foto')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-foto" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-foto" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list foto">
			
				<g:if test="${fotoInstance?.imagen}">
				<li class="fieldcontain">
					<span id="imagen-label" class="property-label"><g:message code="foto.imagen.label" default="Imagen" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${fotoInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="foto.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${fotoInstance?.usuario?.id}">${fotoInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${fotoInstance?.comentarios}">
				<li class="fieldcontain">
					<span id="comentarios-label" class="property-label"><g:message code="foto.comentarios.label" default="Comentarios" /></span>
					
						<g:each in="${fotoInstance.comentarios}" var="c">
						<span class="property-value" aria-labelledby="comentarios-label"><g:link controller="comentario" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${fotoInstance?.lat}">
				<li class="fieldcontain">
					<span id="lat-label" class="property-label"><g:message code="foto.lat.label" default="Lat" /></span>
					
						<span class="property-value" aria-labelledby="lat-label"><g:fieldValue bean="${fotoInstance}" field="lat"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fotoInstance?.lon}">
				<li class="fieldcontain">
					<span id="lon-label" class="property-label"><g:message code="foto.lon.label" default="Lon" /></span>
					
						<span class="property-value" aria-labelledby="lon-label"><g:fieldValue bean="${fotoInstance}" field="lon"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${fotoInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="foto.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${fotoInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:fotoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${fotoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
