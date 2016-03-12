<!DOCTYPE html>
<asset:stylesheet href="bootstrap.min.css"/>
<asset:stylesheet href="bikeApp.css"/>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>BikeApp - ¡Muevete por Bogotá!</title>

  </head>

  <body>

    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">BikeApp</a>
        </div>
        <div class="topMenu">?</div>
        <div class="topMenu">Contacto</div>
        <div class="topMenu">Mapa</div>
    	<div class="topMenu">Perfilllll</div>
      </div>
    </nav>
	
	</br></br></br>
	<div class="container">
	<!-- username | logout link -->
    <g:if test="${session?.user}">
		<div id="login">
			${session?.user?.usuario} ${session?.user?.email} |
			<g:link controller="usuario" action="logout">Logout</g:link>
			</div>
	<!-- END #login -->
    </g:if>
	<g:else>
		<g:form name="login" controller="usuario" action="login">
		<p>
			<label for="email">Email</label>
			 <input type="email" name="email" required placeholder="Enter a valid email">
		</p>
		<p>
			<label for="contrasena">Contraseña</label>
			
			<input type="password" name="contrasena" required placeholder="Enter a valid password">
		</p>
		<p class="button">
			<label>&nbsp;</label>
			<g:submitButton class="button" name="submitButton" value="Logiiin" />
		</p>
		
		</g:form>
	</g:else>
	
	</div>
	
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>BikeApp Movil!</h1>
        <p>La movilidad empieza desde tus dedos.</p>
        </br></br></br>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">Descargala ya! &raquo;</a></p>
         <g:link controller="Foto" action="index">Hacia las fotos</g:link>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
			<div class="col-md-6">
			  <h1>Registrate fácil!</h2>
			  <p>En menos de 1 minuto puedes empezar a usar BikeApp!</p>
			  <p><a class="btn btn-default" href="#" role="button">Ver más &raquo;</a></p>
			</div>
			<div class="col-md-6">
			  <h2>Dueño de negocio? Contactenos!</h2>
			  <p>BikeApp es la mejor manera de hacer visible su negocio para la comunidad ciclista!
			  <p><a class="btn btn-default" href="#" role="button">Ver más &raquo;</a></p>
			</div>
      </div>

      <hr>

      <footer>
        <p>&copy; 2015 Company, Inc.</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
    <asset:javascript src="App2.js"/>
  </body>
</html>
