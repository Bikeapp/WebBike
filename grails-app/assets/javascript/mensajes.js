
var convSel = null;		//Variable para controlar la conversacion actual.


//AJAX PARA CARGAR LOS MENSAJES DE UNA CONVERSACION Y MOSTRARLOS.
$(document).on('click','.contacto',function(){
	convSel = $(this).text();		//Obtengo UserName
	$.ajax({
		url: 'buscarMensajes',			//Llamo a buscarUsuario
		type: 'POST',
		dataType: 'json',					//Que el controlador me devuelva el objeto de tipo JSON.
		data: {
			userName: convSel			//Envio el nombre de usuario que tengo seleccionado.
		},
		success: function(data) {
			console.log(data);
			$('#mensajes').empty();
			for(obj in data){
				$('#mensajes').append("<div class='mensaje'>"+data[obj].contenido+"</div>");	//En caso de ser exitoso el request, iterar por cada objeto(mensaje) y mostrar.
			}
		},
		error: function (xhr, ajaxOptions, thrownError) {
        	alert(xhr.status);
        	alert(thrownError);
      	}
	});
});


//AJAX PARA CREAR UN NUEVO MENSAJE Y MOSTRARLO EN LA CONVERSACION.
$(document).on('click','#cm',function(event){
	event.preventDefault();
	console.log("ConvSel: " + convSel);
	var a = $('#contenido').val();
	console.log("Contenido: " + a);
	if (convSel == null){

	}
	else{
		$.ajax({
			url: 'crearMensaje',			//Llamo a crearMensaje
			type: 'POST',
			dataType: 'text',					//Que el controlador me devuelva el objeto de tipo texto.
			data: {
				userName: convSel,			//Envio el nombre de usuario que tengo seleccionado.
				contenido: $('#contenido').val(),
			},
			success: function(data) {
				$('#mensajes').append("<div class='mensaje'>"+data+"</div>");		//Agrega el nuevo mensaje al gsp
			},
			error: function (xhr, ajaxOptions, thrownError) {
				alert(xhr.status);
				alert(thrownError);
			}
		});
	}
});

//AJAX PARA CREAR UNA CONVERSACION Y MOSTRARLO EN LA PAGINA.
function crearConversacion(){
	var user = $(".amigoSel").html();		//Obtengo el nombre de usuario del destinatario en la conversacion desde el select
	$.ajax({
		url: 'mensaje/crearConversacion',			//Llamo a crearConversacion
		type: 'POST',
		data: {
			userName: user,			//Envio el nombre de usuario que tengo seleccionado.
		},
		success: function(data) {		//Si creo la conversacion exitosamente.
			//Verifica el nombre de usuario  en sesion para identificar el otro usuario de la conversacion e imprimir en pantalla ese nombre.
			if (data.u1.nombre == nomUsuario){
				convSel = $(".contacto:contains("+data.u2.username+")").html();
				if (convSel == undefined){
					$('.media-body[name="amigos"]').append("<div class='contacto'><h4>"+data.u2.username+"</h4></div>");
				}
				convSel = $('.contacto:contains('+data.u2.username+')').html();		//dejar la conversacion seleccionada de una vez. Al escribir un mensaje queda asociado a esta conversacion
			}
			else{
				convSel = $(".contacto:contains("+data.u1.username+")").html();
				if (convSel == undefined){
					$('.media-body[name="amigos"]').append("<div class='contacto'><h4>"+data.u1.username+"</h4></div>");	//Mostrar el nombre del destinatario en pantalla.
				}
				convSel = $('.contacto:contains('+data.u1.username+')').html();		//dejar la conversacion seleccionada de una vez.Al escribir un mensaje queda asociado a esta conversacion
			}
		},
		error: function (xhr, ajaxOptions, thrownError) {
			alert(xhr.status);
			alert(thrownError);
		}
	});
	$('.amigoSel').attr('class','amigo');
}

//Cambio de div entre seleccionado y no seleccionado para el modal
$(document).on('click','.amigo',function(event){
	$('.amigoSel').attr('class','amigo');
	$(this).attr('class', 'amigoSel');
});

//Activador para abrir el modal
$(document).on('click','#opener',function() { theDialog.dialog("open"); });


