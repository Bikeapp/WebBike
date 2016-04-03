<div id="aporte">	
	<g:each in="${grupo.aportes}" status = "i" var="aporte">

	       <div style="margin:10px"><b>${aporte.usuario.email}:</b><br>${aporte.contenido}<br><i>${aporte.fecha}</i></div> 
	</g:each>
</div>
<br>
