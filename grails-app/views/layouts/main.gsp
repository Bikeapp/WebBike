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
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.2/jquery.min.js"></script>
   <!-- PONGO LA LIBRERIA PARA QUE AHORA SE PUEDA USAR AJAX --!>
      <g:setProvider libary="jquery"/>
    <r:layoutResources/>
    <g:layoutHead/>
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
          <a class="navbar-brand" href="/WebBike">BikeApp</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><g:link url="${resource(dir:'Usuario', file:'index.gsp')}">Registro</g:link></li>
            <li><g:link url="${resource(dir:'Foto', file:'index.gsp')}">Foto</g:link></li>
            <li><g:link url="${resource(dir:'Mapa', file:'index.gsp')}">Mapa</g:link></li>
            <li><g:link url="${resource(dir:'Grupo', file:'index.gsp')}">Grupo</g:link></li>
            <li><g:link url="${resource(dir:'Perfil', file:'miPerfil')}">Mi Perfil</g:link></li>
            <li><g:remoteLink class="logout" controller="logout">
               Logout
               </g:remoteLink> </li>
            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>
    
    

    <g:layoutBody/>


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

