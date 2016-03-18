<!DOCTYPE html>
<html lang="en">
  <head>
  	<meta name="layout" content="main"/>
	<link rel="stylesheet"  href="../../assets/stylesheets/style.css">
  </head>

  <body>
  
  <div id="wrap">
  <div id="regbar">
    <div id="navthing">
	<g:if test="${session?.user}">
			<div id="login">
				${session?.user?.usuario} ${session?.user?.email} |
				<g:link controller="usuario" action="logout">Logout</g:link>
			</div>
		<!-- END #login -->
		</g:if>
		<g:else>
      <h2><a href="#" id="loginform">Login</a> | <a href="#">Register</a></h2>
    <div class="login">
      <div class="arrow-up"></div>
      <div class="formholder">
        <div class="randompad">
           <fieldset>
             <g:form name="login" controller="usuario" action="login">
				<label for="email">Email</label>
				<input type="email" name="email" required placeholder="Enter a valid email">
				<label for="contrasena">Contraseña</label>
				<input type="password" name="contrasena" required placeholder="Enter a valid password">
             <input type="submit" value="Login" />
				<g:submitButton class="button" name="submitButton" value="Ingresar!" />
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

        <script src="../../assets/javascripts/index.js"></script>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
  </body>
</html>

