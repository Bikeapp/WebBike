<g:javascript>
var url_obtGrupo = "${createLink(controller:'Grupo',action:'obtenerGrupo')}"
var url_verGrupo = "${createLink(controller:'Grupo',action:'verificarDuplicado')}"
</g:javascript>
<g:each in="${grupos}" >
<li>
<a href="javascript:obtenerGrupo(${it.id})">${it.nombre}<span class="pull-right">(1)</span>
</a>
</li>
<!--<li class="active"><a href="#">Dolor sit amet<span class="pull-right">(8)</span></a></li>-->
</g:each>

