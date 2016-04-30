<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <script  src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
      <script  src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
      <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" >
      <asset:stylesheet href="perfil.css"/>
</head>

<body>

<div class="section">
         <div class="container">
            <div class="row">
               <div class="col-md-6"><img src="${createLink(controller:'Perfil', action:'pintarImagen', id:"${usuario.id}")}" class="img-responsive" id="vistaimagen"></div>
               <div class="col-md-6">
                  <g:form action="update"  enctype="multipart/form-data" role="form">
                     <div class="form-group"><label class="control-label">Mensaje Personal</label><g:textArea name="mensaje" value="${usuario.mensaje}" class="form-control"/></div>
                     <div class="form-group"><label class="control-label">Nombre de Usuario</label><g:textField name="username" value="${usuario.username}" class="form-control" type="text"/></div>
                     <div class="form-group"><label class="control-label">Email</label><g:textField name="email" value="${usuario.email}"  class="form-control" type="text"/></div>
                     <div class="form-group">
                        <label class="control-label">Sexo</label>
                       <g:select name="sexo" value="${usuario.sexo}" from="${sexos}" />
                     </div>
                     <div class="form-group"><label class="control-label">Fecha de Nacimiento</label><g:textField name="fecha" value="${usuario.fecha}" class="form-control" type="text"/></div>
                     <div class="form-group"><label class="control-label">File</label><input type="file" id="fileload" name="selector"></div>
                     <g:submitButton name="update" class="update" id="update" class="btn btn-default">Actualizar</g:submitButton>
					 
                  </g:form>
               </div>
            </div>
         </div>
      </div>


<asset:javascript src="perfil.js"/>

</body>
</html>
