<!DOCTYPE html>
<html lang="en">
  <head>

    <title>BikeApp - ¡Muevete por Bogotá!</title>

	<style type="text/css">

	li{

		margin: 10px 0;
	}

	</style>

	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

	<link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.2.2/css/bootstrap-combined.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" media="screen"
     href="http://tarruda.github.com/bootstrap-datetimepicker/assets/css/bootstrap-datetimepicker.min.css">
  
	
	<script>
	$(document).ready(function(){

		$( "#boton_registro" ).prop( "disabled", true );

		function isEmail(email) {
		  var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		  return regex.test(email);
		}

		function isDate(email) {
		  var regex = /^\d{1,2}\/\d{1,2}\/\d{4}$/;
		  return regex.test(email);
		}

		function check() {


			usuario=document.getElementById("usuario");
			email=document.getElementById("email");
			contrasena=document.getElementById("contrasena");
			fecha=document.getElementById("fecha");	
			
			//alert(usuario+","+email+","+contrasena+","+fecha);

			correcto=true;

			if(!isEmail(email.value)){
				if(!($('#email').hasClass("virgin"))){
					$('#error_email').css("display", "inline");
				}
	
				correcto=false;				
			}else{	
				$('#error_email').css("display", "none");								

			}

					

			if(usuario.value.length<5){

				if(!($('#usuario').hasClass("virgin"))){
					$('#error_usuario').css("display", "inline");
				}

							
				correcto=false;				
			}else{
				$('#error_usuario').css("display", "none");
					
			}

			if(contrasena.value.length<5){
				if(!($('#contrasena').hasClass("virgin"))){
					$('#error_contrasena').css("display", "inline");
				}
				
				correcto=false;				
			}else{
				$('#error_contrasena').css("display", "none");	
					
			}

			if(!isDate(fecha.value)){
				correcto=false;				
			}else{								

			}

			





			if(correcto){
				$( "#boton_registro" ).prop( "disabled", false );
			}else{
				$( "#boton_registro" ).prop( "disabled", true );

			}

		  
		}

		$('#datetimepicker').on('changeDate', function(e) {
			check();		  	
		});


		$("#usuario").on('input',function(e){
			$(this).removeClass("virgin");
			check();
		});

		$("#email").on('input',function(e){
			$(this).removeClass("virgin");
			check();			
				
		});

		$("#contrasena").on('input',function(e){
			$(this).removeClass("virgin");
			check();
		});

		$("#fecha").on('input',function(e){
			check();
		});
	    

	});
	</script>

  </head>


  <body>
	<g:form name="myForm" controller="usuario">
		<ul>

			<li><label>Nombre:&nbsp</label><g:textField class="virgin" name="usuario" /></li>
			<span id ="error_usuario" style="color:red ; display:none" >el nombre de usuario debe contener al menos 5 caracteres</span>
			<li><label>E-mail:&nbsp</label><g:textField class="virgin"  name="email" /></li>
			<span id ="error_email" style="color:red ; display:none" >el formato del email no es el correcto</span>
			<li><label>Contraseña:&nbsp</label><g:passwordField class="virgin" name="contrasena" /></li>
			<span id ="error_contrasena" style="color:red ; display:none" >la contraseña debe contener al menos 5 caracteres</span>
			
			<li>

				<label>Fecha:&nbsp</label>

					<!-- datepicker inicio-->
					<div id="datetimepicker" class="input-append date">
				      <input type="text" name="fecha" value id="fecha"></input>
				      <span class="add-on">
				        <i data-time-icon="icon-time" data-date-icon="icon-calendar"></i>
				      </span>

				    </div>
				    <script type="text/javascript"
				     src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.3/jquery.min.js">
				    </script> 
				    
				    <g:javascript src="bootstrap-datetimepicker.min.js" />
				    
				    <g:javascript src="bootstrap-datetimepicker.es.js" />

				    <script type="text/javascript">
				      $('#datetimepicker').datetimepicker({
				        format: 'dd/MM/yyyy',
				        language: 'es'
				      });
				    </script>
				    <!-- datepicker fin-->

			

			</li>
			<div class="container">
    
			<li><g:actionSubmit class="btn btn-success" action="registro" id="boton_registro" value="Registrar!"/></li>

		</ul>
		
	</g:form>




  </body>
</html>
