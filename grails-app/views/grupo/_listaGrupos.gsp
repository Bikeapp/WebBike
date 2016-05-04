<g:javascript>
var url_obtGrupo = "${createLink(controller:'Grupo',action:'obtenerGrupo')}"
</g:javascript>

<g:each in="${grupos}" >
<a class="list-group-item" onclick="obtenerGrupo(${it.id})">
${it.nombre}</a>
</g:each>

