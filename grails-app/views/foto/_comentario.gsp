<div id="comment">
<g:each in="${comentarios}">
   <table id="comentario">
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
<br>
