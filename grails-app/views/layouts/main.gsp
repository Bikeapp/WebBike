<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title><g:layoutTitle default="¡BikeApp - Muevete por Bogotá!"/></title>

    <!-- Bootstrap core CSS -->
    <asset:stylesheet href="bootstrap.min.css"/>

    <!-- Custom styles for this template -->
    <asset:stylesheet href="bikeApp.css"/>
    <asset:stylesheet href="mensajes.css"/>
    <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">

    <g:layoutHead/>
    <r:layoutResources/>
  </head>

  <body>
    <div class="navbar-wrapper">
          <div class="container">
    <nav class="navbar navbar-inverse navbar-static-top offset-3 pull right">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="/">BikeApp</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><g:link url="${resource(dir:'Perfil', file:'miPerfil.gsp')}"> ${sec.loggedInUserInfo(field:"username")}  </g:link></li>
            <li><g:link url="${resource(dir:'Foto', file:'index.gsp')}">Foto</g:link></li>
            <li><g:link url="${resource(dir:'Mapa', file:'index.gsp')}">Mapa</g:link></li>
            <li><g:link url="${resource(dir:'Grupo', file:'index.gsp')}">Grupo</g:link></li>
            <li><g:link url="${resource(dir:'Evento', file:'index.gsp')}">Eventos</g:link></li>
            <li><g:link url="${createLink(controller:'logout') }">Logout</g:link><li>
          </ul>
        </div>
      </div>
    </nav>
  </div>
</div>
<g:layoutBody/>
  </body>
    
</html>
