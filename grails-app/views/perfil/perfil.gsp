<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>
<script>
$(document).on('click','#amistad',function(event){
	$.ajax({
		url: 'crearAmistad',			//Llamo a buscarUsuario
		type: 'POST',
		dataType: 'text',					//Que el controlador me devuelva el objeto de tipo JSON.
		data: {
			u1_name:	'ddager',				//Envio el nombre de usuario que tengo seleccionado.
		},
		success: function(data) {
			console.log(data);
		},
		error: function (xhr, ajaxOptions, thrownError) {
        	alert(xhr.status);
        	alert(thrownError);
      	}
	});
});
</script>

<h1>Mi perfil</h1>
<div class="nav" role="navigation">
<ul>
<li><g:link action="actualizar">Actualizar perfil</g:link></li>
<li><g:link action="mensajes">Mensajes</g:link></li>
<li id="amistad">Amistad</li>
</ul>
</div>
<div id="foto">
</div>
<g:if test="${usuario.foto == null}">
<img src="${assetPath(src:'no_photo.png')}" width='400' height='400'/>
</g:if>
<g:else>
<img src="${createLink(controller:'Perfil', action:'pintarImagen', id:"${usuario.id}")}" width='400' height='400'/>
</g:else>
<br>

Mensaje distintivo: ${usuario.mensaje}
<br>
Nombre de usuario: ${usuario.username}
<br>
Email: ${usuario.email}
<br>
Sexo: ${usuario.sexo}
<br>
Fecha de Nacimiento: ${usuario.fecha}

</body>
</html>
