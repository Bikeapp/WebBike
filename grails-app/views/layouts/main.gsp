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

                    <a class="navbar-brand" href="index">
                    	<h1 style="font-size:38px;font:sans-serif;">BikeApp

                        <!--<img src="images/logo.png" alt="BikeApp - Logo"></h1>
                          -->
                        </h1>
                    </a>

                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                      <!--  <li class="active"><a href="index.html">Home</a></li>-->
                      <li class="dropdown"><a href="#"> ${sec.loggedInUserInfo(field:"username")}<i class="fa fa-angle-down"></i></a>
                          <ul role="menu" class="sub-menu">
                              <li><g:link url="${resource(dir:'Perfil', file:'miPerfil.gsp')}"> Mi perfil </g:link></li>
                              <li><g:link url="${resource(dir:'mensaje', file:'index.gsp')}">Mensajes</g:link></li>
                              <li><g:link url="${resource(dir:'Foto', file:'index.gsp')}">Foto</g:link></li>
                              <li><g:link url="${resource(dir:'Evento', file:'index.gsp')}">Eventos</g:link></li>

                          </ul>
                      </li>
                      <li class="dropdown"><g:link url="${resource(dir:'Mapa', file:'index.gsp')}">Mapa</g:link>
                          <!--   <ul role="menu" class="sub-menu">
                                <li><a href="blog.html">Blog Default</a></li>
                                <li><a href="blogtwo.html">Timeline Blog</a></li>
                                <li><a href="blogone.html">2 Columns + Right Sidebar</a></li>
                                <li><a href="blogthree.html">1 Column + Left Sidebar</a></li>
                                <li><a href="blogfour.html">Blog Masonary</a></li>
                                <li><a href="blogdetails.html">Blog Details</a></li>
                            </ul>-->
                        </li>

                          <li class="dropdown"><g:link url="${resource(dir:'Evento', file:'index.gsp')}">Eventos</g:link>
                          </li>
                          <li class="dropdown"><g:link url="${createLink(controller:'logout') }">Logout</g:link><li>
                          </li>
                    </ul>
                </div>
                <!--<div class="search">
                    <form role="form">
                        <i class="fa fa-search"></i>
                        <div class="field-toggle">
                            <input type="text" class="search-form" autocomplete="off" placeholder="Search">
                        </div>
                    </form>
                </div>-->
            </div>
        </div>
    </header>

   <g:layoutBody/>



	<footer id="footer">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center bottom-separator">
                    <img src="<g:resource dir='images/home' file='under.png'/>" class="img-responsive inline" alt="WHAAAAAT">
                </div>
                <div class="col-sm-12">

                    <div class="copyright-text text-center">
                        <p>&copy; Your Company 2014. All Rights Reserved.</p>
                        <p>Designed by <a target="_blank" href="http://www.themeum.com">Themeum</a></p>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--/#footer-->
   </body>

</html>
