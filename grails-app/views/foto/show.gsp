<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>

foto capturada
<br>
<img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${inx}")}" width='800' height='600'/>
<br>
<g:each in="${comentarios}">
   <table>
   <tr>
   <td> ${it.contenido} </td>
   <td> ${it.usuario.usuario} </td>
   <td> ${it.dateCreated} </td>
   </tr>
   </table>
</g:each>


<g:form url="[resource:comentarioInstance, action:'save',controller:'Comentario']"   enctype="multipart/form-data">
<fieldset class="form">
<div id="controlessubir" class="controlessubir">
<g:textField name="contenido" />
<g:hiddenField name="fotoId" value="${inx}" />
</div>
</fieldset>
<p>
<fieldset class="buttons">
<g:submitButton name="create" class="save" value="Comentar" id="create" />
</fieldset>
</g:form>

</body>
</html>
