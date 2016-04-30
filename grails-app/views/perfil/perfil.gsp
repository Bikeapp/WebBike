<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <script  src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
      <script  src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
      <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" >
      <asset:stylesheet href="modal.css"/>
   </head>
   <body>
      <div class="section">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <g:if test="${usuario.foto == null}">
                     <img src="${assetPath(src:'no_photo.png')}" class="img-responsive"/>
                  </g:if>
                  <g:else>
                     <img src="${createLink(controller:'Perfil', action:'pintarImagen', id:"${usuario.id}")}" class="img-responsive"/>
                  </g:else>
               </div>
               <div class="col-md-6">
                  <h1 class="text-primary">Mis datos<br></h1>
                  <p></p>
                  <p>Nombre de usuario: ${usuario.username}</p>
                  <p>Email: ${usuario.email}</p>
                  <p>Fecha de Nacimiento: ${usuario.fecha}</p>
               </div>
            </div>
         </div>
      </div>
      <div class="section">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <g:link class="btn btn-primary" action="mensajes">Mensajes</g:link>
               </div>
               <div class="col-md-6">
                  <g:link class="btn btn-primary" action="actualizar">Actualizar perfil<br></g:link>
               </div>
            </div>
         </div>
      </div>
      <div class="section">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <h1 class="text-primary">Mensaje Distintivo</h1>
                  <p>${usuario.mensaje} </p>
               </div>
            </div>
         </div>
      </div>
   </body>
</html>