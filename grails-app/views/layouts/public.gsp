<g:applyLayout name="main">
<!DOCTYPE html>
<html lang="en">
<head>

<g:layoutHead/>
<r:layoutResources/>
</head>
<body>
<!--                     INICIO DEL LAYOUT PARA UN USUARIO CON SESION ACTIVA -->

<sec:ifLoggedIn>
<script>
var link = '<g:createLink controller="perfil" action="index" />'
window.location.replace(link);
</script>


</sec:ifLoggedIn>
   <!--                     FIN DEL LAYOUT PARA UN USUARIO CON SESION ACTIVA -->
   <!--                     INICIO DEL LAYOUT PARA UN USUARIO SIN SESION ACTIVA -->
   
   <sec:ifNotLoggedIn>
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
          <a class="navbar-brand" href="${createLink(controller:'Usuario',action:'index')}">BikeApp</a>
        </div>
      </div>
    </nav>
  </div>
</div>
   </sec:ifNotLoggedIn>
   <!--                     FIN DEL LAYOUT PARA UN USUARIO SIN SESION ACTIVA -->

   <g:layoutBody/> 

  </body>
    
</html>
</g:applyLayout>
