<g:each in="${grupo.aportes}" status = "i" var="aporte">
<div style="margin:10px"><b>

<g:link controller="perfil" action="show" params="[usuario : aporte.usuario.username]">
${aporte.usuario.username}</g:link>
</b><br>${aporte.contenido}<br><i>${aporte.fecha}</i></div> 
</g:each>
