<!DOCTYPE html>
<html lang="en">
   <head>
      <meta name="layout" content="main"/>
      <asset:stylesheet href="foto.css" />
   </head>
   <body>

      <section id="page-breadcrumb">
         <div class="vertical-center sun">
            <div class="container">
               <div class="row">
                  <div class="action">
                     <div class="col-sm-12">
                        <h1 class="title">Sube Una Foto</h1>
                        <ul>
                           <li>
                              <g:link class="list" action="index">Regresar a las fotos</g:link>
                           </li>
                        </ul>
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
                  <g:form url="[resource:fotoInstance, action:'save']"  enctype="multipart/form-data">
                     <div class="col-sm-6 portfolio-item branded logos">
                        <div class="portfolio-wrapper">
                           <div class="portfolio-single">
                              <div class="portfolio-thumb">
                                 <input type="file" id="selector" name="selector" />
                                 <img id="vistaimagen" src=""  />
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-sm-6 ">
                        <fieldset class="buttons">
                           <g:submitButton name="create" class="save" value="Subir" id="create" class="btn btn-sm btn-info"/>
                           <g:checkBox name="ubicacion" id="ubicacion" />
                           Incluir ubicación
                           <g:hiddenField id="lat" name="lat" value="NONE" />
                           <g:hiddenField id="lng" name="lng" value="NONE" />
                           <script src="https://maps.google.com/maps/api/js?callback=initMap" async defer></script>
                           <div id="mapa"></div>
                        </fieldset>
                     </div>
                  </g:form>
               </div>
            </div>
         </div>
      </section>
      <asset:javascript src="foto.js"/>
   </body>
</html>