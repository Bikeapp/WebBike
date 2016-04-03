<!DOCTYPE html>
<html lang="en">
<head>
	<meta name="layout" content="main"/>
	<asset:stylesheet href="grupo.css"/>
</head>
<body>


	<h1>Bienvenidos al grupo ${grupo.nombre}</h1>

	<g:formRemote name="formulario_aporte" update="updateMe" url="[controller: 'grupo', action: 'crearAporte', params: [grupo: '${grupo.id}']]">

	    <fieldset class="form">
			<div id="contenido_aporte_input">
			<label>Aporte:</label> <br>			
				<g:textArea name="contenido" />
			</div>
		</fieldset>

		<fieldset class="buttons">
			<g:submitButton name="create" class="save" value="Aportar" id="aporte_botton" />
		</fieldset>
			    
	</g:formRemote>

	

	



	<g:if test="${miembro}">
		<g:form name="comentar" url="[action:'unirme',controller:'Grupo']" >
			<fieldset class="datos">
				<g:hiddenField name="grupoId" value="${grupo.id}" />
			</fieldset>
			<fieldset class="buttons">
				<g:submitButton name="unirme" class="save" value="unirme" id="unirme" />
			</fieldset>
		</g:form>
	</g:if>

<br>
<div id="container">
	<div id="board">
	</div>
	<div id="miembros">
		<g:each var="miembro" in="${miembros}">
			<table>
				<tr>
					<td> ${miembro.usuario.username} </td>
				</tr>
			</table>
		</g:each>
	</div>
</div>



<asset:stylesheet href="foto.css" />
<div class="container">
	<!-- Example row of columns -->
	<footer>
		<p>BikeApp&copy; 2016 Company, Inc.</p>
	</footer>
</div> <!-- /container -->

</body>
</html>

