<!DOCTYPE html>
<html lang="en">
  <head>
  	<meta name="layout" content="public"/>
      <asset:javascript src="usuario.js" />

    <style type="text/css">
      #home-slider {
      background: url('${resource(dir: "images/home", file: "slider-bg.png")}') 0 100% repeat-x;
      position: relative;
    }
    </style>
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
   <section id="home-slider">
        <div class="container">
            <div class="row">
                <div class="main-slider animate-in">
                    <div class="slide-text">
                        <h1>Bienvenido a BikeApp</h1>

                        <g:form role="form" name="registro" controller="Usuario" action="registro">
                            <div class="form-group">
                            <label for="username">Usuario</label>
                            <input type="text" class="form-control" name="username" required placeholder="Ingrese un nombre de usuario">
                            </div>


                            <div class="form-group">
                            <label for="nombre">Nombre real</label>
                            <input type="text" class="form-control" name="nombre" required placeholder="Ingrese el nombre real del usuario">
                            </div>

                        
                          
                            <div class="form-group">
                              <label for="email">Email:</label>
                              <input required="true "type="email" class="form-control" id="email" placeholder="e-mail">
                            </div>


                            <div class="form-group">
                              <label for="pwd">Contraseña:</label>
                              <input type="password" class="form-control" name="password" required placeholder="Ingrese su contraseña">
                            </div>           

                            <div class="form-group">
                            <label for="fecha">Fecha de Nacimiento</label><br>
                              <g:datePicker id="fecha" name="fecha" class="button" precision="day"/>  
                            </div>                

                            <g:submitButton type="submit" class="button btn-common" name="submitButton" value="Registrarme!" />     

                          </g:form>
                    
                       
                         <g:link controller="Usuario" class="btn btn-common" action="login">SIGN UP</g:link>                        
                    </div>
                    <img src="images/home/slider/hill.png" class="slider-hill" alt="slider image">
                    <img src="images/home/cycle.png" class="slider-house" alt="slider image">
                    <img src="images/home/slider/sun.png" class="slider-sun" alt="slider image">
                    <img src="images/home/slider/birds1.png" class="slider-birds1" alt="slider image">
                    <img src="images/home/slider/birds2.png" class="slider-birds2" alt="slider image">
                </div>
            </div>
        </div>
        
    </section>






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
  <!-- ESPACIO PARA ALEX 2-->
     <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 text-center padding wow fadeIn animated" data-wow-duration="1000ms" data-wow-delay="300ms" style="visibility: visible; animation-duration: 1000ms; animation-delay: 300ms; animation-name: fadeIn;">
                    <div class="single-service">
                        <div class="wow scaleIn animated" data-wow-duration="500ms" data-wow-delay="300ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 300ms; animation-name: scaleIn;">
                            <img src="images/home/routes.png" alt="">
                        </div>
                        <h2>Arma tus propias Rutas</h2>
                        <p>Puedes crear rutas presonalizadas y publicarlas a tus maigos para facilitar la visualización de tus eventos.</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center padding wow fadeIn animated" data-wow-duration="1000ms" data-wow-delay="600ms" style="visibility: visible; animation-duration: 1000ms; animation-delay: 600ms; animation-name: fadeIn;">
                    <div class="single-service">
                        <div class="wow scaleIn animated" data-wow-duration="500ms" data-wow-delay="600ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 600ms; animation-name: scaleIn;">
                            <img src="images/home/Bicycle-PNG-7.png" alt="">
                        </div>
                        <h2>Rueda</h2>
                        <p>Con bikeapp puedes organizar eventos masivos con tus amigos en los que podras conocer gente increíble que comparta contigo la pasion por las bicis.</p>
                    </div>
                </div>
                <div class="col-sm-4 text-center padding wow fadeIn animated" data-wow-duration="1000ms" data-wow-delay="900ms" style="visibility: visible; animation-duration: 1000ms; animation-delay: 900ms; animation-name: fadeIn;">
                    <div class="single-service">
                        <div class="wow scaleIn animated" data-wow-duration="500ms" data-wow-delay="900ms" style="visibility: visible; animation-duration: 500ms; animation-delay: 900ms; animation-name: scaleIn;">
                            <img src="images/home/hipchat.png" alt="">
                        </div>
                        <h2>Expresate</h2>
                        <p>Crea un grupo de de ciclistas y comparte con tus amigos tus opiniones experiencias, fotos y mucho mas</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

   


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
   </div>
   </div>
   </div>
   </div>


  </body>
</html>
