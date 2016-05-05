<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Portfolio Default | Triangle</title>
	
	<asset:stylesheet href="font-awesome.min.css"/>
	<asset:stylesheet href="bootstrap.min.css"/>
	<asset:stylesheet href="lightbox.css"/>
	<asset:stylesheet href="animate.min.css"/>
	<asset:stylesheet href="main.css"/>
	<asset:stylesheet href="responsive.css"/>
	

    <!--[if lt IE 9]>
	    <script src="js/html5shiv.js"></script>
	    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body>
	

    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">Mis Fotos</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->

    <section id="portfolio">
        <div class="container">
            <div class="row">
                <ul class="portfolio-filter text-center">
                    <g:link type="button" class="btn btn-lg btn-success" action="create"><i class="fa fa-picture" aria-hidden="true"></i>  Añadir Foto</g:link>
                </ul><!--/#portfolio-filter-->
                    
                <div class="portfolio-items">
				
				<g:each var="imagen" in="${imagenes}" status="i">
				
                    <div class="col-xs-6 col-sm-4 col-md-3 portfolio-item branded logos">
                        <div class="portfolio-wrapper">
                            <div class="portfolio-single">
                                <div class="portfolio-thumb">
                                    <img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id}")}" class="img-responsive" alt="">
                                </div>
                                <div class="portfolio-view">
                                    <ul class="nav nav-pills">
                                        <li><g:link action="show" params="[imagenactual : imagen.id]"><i class="fa fa-link"></i></g:link></li>
                                        <li><a href="${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id}")}" data-lightbox="example-set"><i class="fa fa-eye"></i></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="portfolio-info ">
                            </div>
                        </div>
                    </div>
                 
				</g:each>		
                </div>
            </div>
        </div>
    </section>
    <!--/#portfolio-->



	<asset:javascript src="foto.js"/>
	<asset:javascript src="jquery.js"/>
	<asset:javascript src="bootstrap.min.js"/>
	<asset:javascript src="jquery.isotope.min.js"/>
	<asset:javascript src="lightbox.min.js"/>
	<asset:javascript src="wow.min.js"/>
	<asset:javascript src="main.js"/>
</html>
