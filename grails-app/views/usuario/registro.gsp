	<!DOCTYPE html>
	<asset:stylesheet href="bikeApp.css"/>
	<html>
	    <head>
	        <title>User page</title>
	    </head>
	    <body>
	    	<div class="header">
	    	</div>
	        <div>
	            <g:each var="users" in="${userList}">
	            	<p>El usuario ${users.usuario} nacio en ${users.fecha}. Su email es ${users.email} y la contraseña es ${users.contraseña}</p>
	            	</br>

	            </g:each>
	        </div>
	        <div>
	        	<g:form name="myForm" controller="usuario">
	        		<g:actionSubmit value="Otra vez!" action="index"/> 
	        	</g:form>
	        </div>

	        <div>
	        	<p>Si desea puede agregar uno o varios intereses a su usuario</p>
	        	<g:form action="intereses" method="post" controller="usuario">
				  <input type="checkbox" name="interes" value="Ofertas "> Ofertas <br>
				  <input type="checkbox" name="interes" value="Ciclopaseos"> Ciclopaseos<br>
				  <input type="checkbox" name="interes" value="Actualidad y ciclismo"> Actualidad y ciclismo<br>
				  <input type="checkbox" name="interes" value="Soluciones de movilidad"> Soluciones de movilidad<br>
				  <input type="submit" value="Submit">
				</g:form>


	        </div>	
	    </body>
	</html>