<!DOCTYPE html>
<html lang="en">
  <head>
	
   	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title><g:layoutTitle default="BikeApp - ¡Muevete por Bogotá!"/></title>
    
    
    <!-- Agregamos CSS. /assets/css/ -->
	<asset:stylesheet src="bootstrap.min.css" />
	<asset:stylesheet src="font-awesome.min.css" />
	<asset:stylesheet src="animate.min.css" />
	<asset:stylesheet src="lightbox.css" />
	<asset:stylesheet src="main.css" />
	<asset:stylesheet src="responsive.css" />
	
    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->       

	<!-- Agregamos javascripts. /assets/javascripts/ -->
   	<asset:javascript src="jquery.js" />
	<asset:javascript src="bootstrap.min.js" />
	<asset:javascript src="lightbox.min.js" />
	<asset:javascript src="wow.min.js" />
	<asset:javascript src="main.js" />
    <g:layoutHead/>

  </head>
  <body>
  
  
  	<header id="header">      
        <div class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <a class="navbar-brand" href="${createLink(controller:'perfil',action:'index')}">
                    	<h1><img src="<g:resource dir='images' file='logo.png'/>" alt="BikeApp - Logo"></h1>
                    </a>
                </div>


                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="active"><a href="${createLink(controller:'perfil',action:'index')}"> ${sec.loggedInUserInfo(field:"username")}</a></li>
                        <li><a href="${createLink(controller:'foto',action:'index')}">Mis Fotos</a></li>                    
                        <li><a href="${createLink(controller:'evento',action:'index')}">Eventos</a></li>                    
                        <li><a href="${createLink(controller:'grupo',action:'index')}">Grupos</a></li>                    

                          <li class="dropdown"><a href="#">BikeApp <i class="fa fa-angle-down"></i></a>
                            <ul role="menu" class="sub-menu">
                                <li><a href="#">Crear Grupo</a></li>
                                <li><a href="#">Nuevo Evento</a></li>
                                <li><a href="#"></a></li>
                            </ul>
                        </li>                         

<!-- Adoren esa belleza de tag, es perfecto-->
<sec:ifAllGranted roles="ROLE_ADMIN">
                        <li><a href="${createLink(controller:'cp',action:'cp')}">Panel Administrador</a></li>                    
</sec:ifAllGranted>

                        <li><a href="${createLink(controller:'logout')}">Salir</a></li>                    
                    </ul>
                </div>
                <div class="search">
                    <form role="form">
                        <i class="fa fa-search"></i>
                        <div class="field-toggle">
                            <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </header>
  
   <g:layoutBody/> 
   
   
   
	<footer id="footer">
        <div class="container">
            <div class="row">
<!--
                <div class="col-sm-12 text-center bottom-separator">
                    <img src="<g:resource dir='images/home' file='under.png'/>" class="img-responsive inline" alt="WHAAAAAT">
                </div>

-->
                <div class="col-sm-12">
                    <div class="copyright-text text-center">
                        <p><a href="${createLink(controller:'usuario',action:'bikeapp')}">&copy; BikeApp 2016</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->
   </body>
    
</html>
