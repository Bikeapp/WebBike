<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Portfolio Details | Triangle</title>
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
</head>

<body>

	<!-- <div id="foto">
		<img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${inx}")}" width='400' height='400'/>
	</div>

    <div id="dialogbox">
		<g:render template="comentario" model="[comentarios:comentarios]" />
	</div>
    
	<div id="comentarios">
	<form name="comentario">
		<g:textArea name="contenido" style="width:550px; height: 400px; background-color: transparent;"></g:textArea>
		<input type="button" onclick="save()" value="Comentar">
		<g:hiddenField name="fotoId" value="${inx}"/>
		<g:javascript>
			var url = "${createLink(controller:'comentario',action:'save')}"
		</g:javascript>
	</form>
	</div>
 -->

 
    <section id="page-breadcrumb">
        <div class="vertical-center sun">
             <div class="container">
                <div class="row">
                    <div class="action">
                        <div class="col-sm-12">
                            <h1 class="title">Comenta Esta Foto</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   </section>
    <!--/#action-->

    <section id="portfolio-information" class="padding-top">
        <div class="container">
            <div class="row">
                <div class="col-sm-6">
                    <img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${inx}")}" class="img-responsive" alt="">
                </div>
                <div class="col-sm-6">
					<div id="dialogbox">
                        <g:render template="comentario" model="[comentarios:comentarios]" />
                    </div>
                    <form  name="comentario" >
                            
                            <div class="form-group">
                                <g:textArea name="contenido" class="form-control" rows="8" placeholder="Aquí ingresas tu comentario"></g:textArea>
                            </div>                        
                            <div class="form-group">
                                <input class="btn btn-submit" onclick="save()" value="Comentar">
                            </div>
							<g:hiddenField name="fotoId" value="${inx}"/>
							<g:javascript>
								var url = "${createLink(controller:'comentario',action:'save')}"
							</g:javascript>
                    </form>
					
                </div>
            </div>
        </div>
    </section>


    <asset:javascript src="foto.js"/>
	<asset:javascript src="jquery.js"/>
	<asset:javascript src="bootstrap.min.js"/>
	<asset:javascript src="jquery.isotope.min.js"/>
	<asset:javascript src="lightbox.min.js"/>
	<asset:javascript src="wow.min.js"/>
	<asset:javascript src="main.js"/>
</body>
</html>
