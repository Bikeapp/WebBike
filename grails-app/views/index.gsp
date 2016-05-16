<!DOCTYPE html>
<html lang="en">
  <head>
  	<meta name="layout" content="public"/>
      <asset:javascript src="usuario.js" />
  </head>

  <body>


<g:javascript>
var url_enviarSugerencia= "${createLink(controller:'Usuario',action:'contactUs')}"
</g:javascript>
  
  <div id="carousel-container">
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators visible-xs">
  <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
  <li data-target="#carousel-example-generic" data-slide-to="1"></li>
  <li data-target="#carousel-example-generic" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
  <div class="item active">
  <img src="${assetPath(src:'slider-bg.png')}" alt="">
  <div class="carousel-caption">
   <!-- ESPACIO PARA ALEX 1-->
   <h1> ALEX </h1>
  </div>
  </div>
  <div class="item">
  <img src="${assetPath(src:'slider-bg.png')}" alt="">
  <div class="carousel-caption">
  <h1>Ingresa aquí</h1>
  <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
  </div>
  </div>

  </div>
  <a class="left carousel-control hidden-xs" href="#carousel-example-generic" data-slide="prev">
  <span class="glyphicon glyphicon-chevron-left"></span>
  </a>
  <a class="right carousel-control hidden-xs" href="#carousel-example-generic" data-slide="next">
  <span class="glyphicon glyphicon-chevron-right"></span>
  </a>
  </div><!--/#carousel-example-generic-->
  </div><!--/#carousel-container-->

   <!-- ESPACIO PARA ALEX 2 -->

   


   <div class="container">
   <div class="row">
   <div class="col-sm-12 text-center bottom-separator">
   <img src="images/home/under.png" class="img-responsive inline" alt="">
   </div>

   <div class="col-md-4 col-sm-6">
   <!-- noticias de twitter --> 
   </div>
   <div class="col-md-3 col-sm-6">
   </div>
   <div class="col-md-4 col-sm-12">
   <div class="contact-form bottom">
   <h2>Contactenos</h2>
   <div class="form-group">
   <input type="text" name="nombre" id="nombre" class="form-control" required="required" placeholder="Nombre">
   </div>
   <div class="form-group">
   <input type="email" name="email" id="email" class="form-control" required="required" placeholder="Email">
   </div>
   <div class="form-group">
   <textarea name="message" id="mensaje" required="required" class="form-control" rows="8" placeholder="Sugerencia"></textarea>
   </div>                        
   <div class="form-group">
   <input type="submit" name="submit" class="btn btn-submit" value="Enviar" onclick="enviarSugerencia()" />
   </form>
   </div>
   </div>
   </div>
   </div>


  </body>
</html>
