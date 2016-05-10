<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<asset:stylesheet href="foto.css" />
<asset:javascript src="foto.js"/>
</head>
<body>

      <section id="page-breadcrumb">
         <div class="vertical-center sun">
            <div class="container">
               <div class="row">
                  <div class="action">
                     <div class="col-sm-12">
                        <h1 class="title">Fotos De ${username}</h1>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </section>
      <section id="portfolio">
         <div class="container">
            <div class="row">
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
                                    <li>
                                       <g:link action="show" params="[imagenactual : imagen.id]"><i class="fa fa-link"></i></g:link>
                                    </li>
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
	  
	  
</body>
</html>
