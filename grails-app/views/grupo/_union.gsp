<g:if test="${miembro}">
<div class="sidebar-item  recent">
<h3>Unirme</h3>
<form name="join">
<input type="button" name="buscar" class="btn btn-submit" value="Unirme" onclick="unirme()">
<g:hiddenField name="grupoId" value="${grupo.id}"/>
<g:javascript>
var url = "${createLink(controller:'Grupo',action:'unirme')}"
</g:javascript>
</form>
</div>
</g:if>

