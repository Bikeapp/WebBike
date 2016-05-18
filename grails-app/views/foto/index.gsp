<!DOCTYPE html>
<html lang="en">
   <head>
      <meta name="layout" content="main"/>
      <asset:javascript src="foto.js"/>
   </head>
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
	  <div class="col-md-offset-4 col-md-4 col-sm-offset-4 col-sm-4 overflow">
					<g:link type="button" class="btn btn-lg btn-submit" action="create"><i class="fa fa-picture" aria-hidden="true"></i>  Añadir Foto</g:link>
               </div>
      <section id="portfolio">
         <div class="container">
            <div class="row">
               <ul class="portfolio-filter text-center">
					
                  
				  </ul>
               <div class="portfolio-items">
                  
					 <div class="col-md-3 hidden-xs hidden-sm portfolio-item branded logos" >
					 <g:each var="imagen" in="${imagenes}" status="i">
					 <g:if test="${i%4==0}">
                        <div class="portfolio-wrapper" style="margin-top:30px;margin-bottom:30px">
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
                        </div>
						</g:if>
						</g:each>
                    </div>
					                  
					 <div class="col-md-3 hidden-xs hidden-sm portfolio-item branded logos">
					 <g:each var="imagen" in="${imagenes}" status="i">
					 <g:if test="${i%4==1}">
                        <div class="portfolio-wrapper" style="margin-top:30px;margin-bottom:30px">
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
                        </div>
						</g:if>
						</g:each>
                    </div>
					                  
					 <div class=" col-md-3 hidden-xs hidden-sm portfolio-item branded logos" >
					 <g:each var="imagen" in="${imagenes}" status="i">
					 <g:if test="${i%4==2}">
                        <div class="portfolio-wrapper" style="margin-top:30px;margin-bottom:30px">
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
                        </div>
						</g:if>
						</g:each>
                    </div>
					                  
					 <div class=" col-md-3 hidden-xs hidden-sm portfolio-item branded logos">
					 <g:each var="imagen" in="${imagenes}" status="i">
					 <g:if test="${i%4==3}">
                        <div class="portfolio-wrapper" style="margin-top:30px;margin-bottom:30px">
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
                        </div>
						</g:if>
						</g:each>
                    </div>
					
					<div class="col-sm-4  hidden-xs hidden-md hidden-lg portfolio-item branded logos">
					 <g:each var="imagen" in="${imagenes}" status="i">
					 <g:if test="${i%3==0}">
                        <div class="portfolio-wrapper" style="margin-top:30px;margin-bottom:30px">
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
                        </div>
						</g:if>
						</g:each>
                    </div>
					
					<div class="col-sm-4  hidden-xs hidden-md hidden-lg portfolio-item branded logos">
					 <g:each var="imagen" in="${imagenes}" status="i">
					 <g:if test="${i%3==1}">
                        <div class="portfolio-wrapper" style="margin-top:30px;margin-bottom:30px">
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
                        </div>
						</g:if>
						</g:each>
                    </div>
					
					<div class="col-sm-4  hidden-xs hidden-md hidden-lg portfolio-item branded logos">
					 <g:each var="imagen" in="${imagenes}" status="i">
					 <g:if test="${i%3==2}">
                        <div class="portfolio-wrapper" style="margin-top:30px;margin-bottom:30px">
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
                        </div>
						</g:if>
						</g:each>
                    </div>
					
					<div class="col-xs-6  hidden-sm hidden-md hidden-lg portfolio-item branded logos">
					 <g:each var="imagen" in="${imagenes}" status="i">
					 <g:if test="${i%2==0}">
                        <div class="portfolio-wrapper" style="margin-top:30px;margin-bottom:30px">
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
                        </div>
						</g:if>
						</g:each>
                    </div>
					
					<div class="col-xs-6  hidden-sm hidden-md hidden-lg portfolio-item branded logos">
					 <g:each var="imagen" in="${imagenes}" status="i">
					 <g:if test="${i%2==1}">
                        <div class="portfolio-wrapper" style="margin-top:30px;margin-bottom:30px">
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
                        </div>
						</g:if>
						</g:each>
                    </div>
                    
                  

               </div>
            </div>
         </div>
      </section>
	  </body>
</html>