<!DOCTYPE html>
<html lang="en">
   <head>
      <meta name="layout" content="main"/>
      <asset:stylesheet href="foto.css" />
      <asset:javascript src="foto.js"/>
   </head>
   <body>


      <section id="portfolio">
         <div class="container">
            <div class="row">
<h1>Sube una foto</h1>
               <div class="portfolio-items">
                  <g:form url="[resource:fotoInstance, action:'save']"  enctype="multipart/form-data">
                     <div class="col-sm-6 portfolio-item branded logos">
                        <div class="portfolio-wrapper">
                           <div class="portfolio-single">
                              <div class="portfolio-thumb">
                                 <input type="file" id="selectorFoto" name="selector" />
                                 <img style="margin:10px" class="img-responsive"id="vistaimagen" src=""  />
                              </div>
                           </div>
                        </div>
                     </div>
                     <div class="col-sm-6 ">
                        <fieldset class="buttons">
                           <g:submitButton disabled="true" name="create" class="save" value="Subir" id="createFoto" class="btn btn-sm btn-info"/>
                           <g:checkBox name="ubicacion" id="ubicacion" />
                           Incluir ubicación
                           <g:hiddenField id="latFoto" name="lat" value="NONE" />
                           <g:hiddenField id="lngFoto" name="lng" value="NONE" />
                           <script src="https://maps.google.com/maps/api/js?callback=initMap" async defer>
                           </script>
                           <div id="mapa"></div>
                        </fieldset>
                     </div>
                  </g:form>
               </div>
            </div>
         </div>
      </section>
      
   </body>
</html>
