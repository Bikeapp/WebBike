<!DOCTYPE html>
<html lang="en">
   <head>
      <meta name="layout" content="main"/>
		<asset:stylesheet src="perfil.css"/>
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