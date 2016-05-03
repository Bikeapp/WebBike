<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css" rel="stylesheet" type="text/css">
   <meta name="layout" content="main"/>
<asset:javascript src="grupo.js" />
  </head>


<body>
    <div class="section text-left">
      <div class="container">
        <div class="row">
          <div class="col-md-4">
            <div class="container">
              <div class="row">
                <div class="col-md-3">
                  <h1>Buscar Grupos</h1>
                  <form role="form">
                    <div class="form-group">
                      <div class="input-group">
                        <input type="text" class="form-control" placeholder="Tags a buscar">
                        <span class="input-group-btn">
                          <a class="btn btn-success" type="submit">Go</a>
                        </span>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
            <div class="container">
              <div class="row">
                <div class="col-md-3">
                  <ul class="list-group">

<g:javascript>
var url0 = "${createLink(controller:'Grupo',action:'obtenerGrupo')}"
</g:javascript>

                     <g:each in="${grupos}" >
                     <a class="list-group-item" onclick="obtenerGrupo(${it.id})">
                           ${it.nombre}</a>
                     </g:each>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-8" id="contenido-grupo">

<g:render template="grupo" />

         </div>
        </div>
      </div>
    </div>
  

</body>
</html>
