<g:if test="${grupo != null}">
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-8">
            <div class="container">
              <div class="row">
                <div class="col-md-7">
                  <h1>Bienvenidos al grupo ${grupo.nombre}</h1>
                  <div class="col-md-12" id="comments">
                     <g:render template="aporte" model="[aportes:grupo.aportes]" />
                  </div>
                </div>
              </div>
            </div>
            <br>
            <div class="container">
              <div class="row">
                <div class="col-md-7">


<g:if test="${!miembro}">

<form id="comentar">
<g:javascript>
var url2 = "${createLink(controller:'Grupo',action:'crearAporte')}"
</g:javascript>
<label>Aporte:</label> <br>			
<g:textArea name="contenido" id="contenido" />
<g:hiddenField id="grupoId" name="grupo" value="${grupo.id}" />
<a class="btn btn-primary" onclick="aportar()">Comentar</a>
</form>

</g:if>


                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="row">
              <div class="col-md-12" id="rutinas">

                  <g:render template="union" />
               </div>
            </div>
            <br>
            <div class="row">
              <div class="col-md-12">
                <h1>Información del grupo</h1>

<g:each in="${grupo.tags}">
   ${it}<p>
</g:each>
${grupo.descripcion}
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

</g:if>
