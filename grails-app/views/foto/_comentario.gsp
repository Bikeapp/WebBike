<div id="comment">
<g:each in="${comentarios}" status="i" var="it">
   <table id="comentario_${i}">
   <tr>
    ${it.contenido} 
   </tr>
   <tr>
   <td> ${it.usuario.username} </td>
   <td> ${it.dateCreated} </td>
   </tr>
   </table>
</g:each>
</div>
