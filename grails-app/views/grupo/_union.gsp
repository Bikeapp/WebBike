<g:if test="${miembro}">

<form name="join">
<input type="button" onclick="unirme()" value="Unirme">
<g:hiddenField name="grupoId" value="${grupo.id}"/>
<g:javascript>
var url = "${createLink(controller:'Grupo',action:'unirme')}"
</g:javascript>
</form>

</g:if>
<g:else>
<!--CASO EN EL CUAL HACE PARTE DEL GRUPO, EN CUYO CASO PUEDE COMENTAR -->

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
</fieldset>
</g:formRemote>

</g:else>

<br>
<div id="miembros">
<g:each var="miembro" in="${miembros}">
<table>
<tr>
<td> ${miembro.usuario.username} </td>
</tr>
</table>
</g:each>
</div>

