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
<g:formRemote name="formulario_aporte" update="comments" url="[controller: 'Aporte', action: 'save']" after="limpiar()">
<fieldset class="form">
<div id="contenido_aporte_input">
<label>Aporte:</label> <br>			
<g:textArea name="contenido" />
</div>
<g:hiddenField name="grupo" value="${grupo.id}" />
</fieldset>
<fieldset class="buttons">
<g:submitButton name="create" class="save" value="Aportar" id="aporte_boton" />
                  <a class="btn btn-primary">Click me</a>
</fieldset>
</g:formRemote>
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
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  














</g:if>
