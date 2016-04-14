<!DOCTYPE html>
<html lang="en">
  <head>
    <asset:stylesheet src="style.css"/>
  </head>

  <body>

  <div id="wrap">
  <div id="regbar">
    <div id="navthing">
	<g:if test="${session?.user}">
			<div class="randompad">
			 <g:form name="logout" controller="usuario" action="logout">
			 <h2>${session?.user?.usuario} ${session?.user?.email}</h2>
			 <g:submitButton class="button" name="submitButton" value="Salir!" />
			 </g:form>
			 </div>
		<!-- END #login -->
		</g:if>
		<g:else>
      <h2><a href="#" id="loginform">Iniciar Sesión</a> | <a href="#" id="logoutform">Registrarme</a></h2>
    <div class="login">
      <div class="arrow-up"></div>
      <div class="formholder">
        <div class="randompad">
           <fieldset>
            <g:form name="login" method="POST" uri="/j_spring_security_check">
				<label for="j_username">Email</label>
				<input type="text" name="j_username" required placeholder="Enter a valid email">
				<label for="j_password">Contraseña</label>
				<input type="password" name="j_password" required placeholder="Enter a valid password">
				<g:submitButton class="button" name="submitButton" value="Ingresar!" />
			</g:form>
           </fieldset>
        </div>
      </div>
    </div>
	<div class="logout">
      <div class="arrow-up"></div>
      <div class="formholder">
        <div class="randompad">
           <fieldset>
            <g:form name="registro" controller="Usuario" action="registro">
				<label for="username">Usuario</label>
				<input type="text" name="username" required placeholder="Ingrese un nombre de usuario">
				<label for="email">Email</label>
				<input type="email" name="email" required placeholder="Ingrese un email válido">
				<label for="password">Contraseña</label>
				<input type="password" name="password" required placeholder="Ingrese su contraseña">
				<label for="fecha">Fecha</label>
				<input type="text" name="fecha" required placeholder="Ingrese fecha">
				<g:submitButton class="button" name="submitButton" value="Registrarme!" />
			</g:form>
           </fieldset>
        </div>
      </div>
    </div>
	</g:else>
    </div>
  </div>
</div>
    <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

<asset:javascript src="index.js"/>
  </body>
</html>
