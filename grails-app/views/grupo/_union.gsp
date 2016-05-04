<h1>Miembros</h1>
<ol>
<g:each var="miembro" in="${miembros}">
<li> ${miembro.usuario.username} </li>
</g:each>
</ol>
<g:if test="${miembro}">
<form name="join">
<a class="btn btn-primary" data-toggle="button" onclick="unirme()">Have Fun!!</a>
<g:hiddenField name="grupoId" value="${grupo.id}"/>
<g:javascript>
var url = "${createLink(controller:'Grupo',action:'unirme')}"
</g:javascript>
</form>
</g:if>

