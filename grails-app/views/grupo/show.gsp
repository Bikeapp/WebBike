<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>
<body>


<h1>Bienvenidos al grupo ${grupo.nombre}</h1>


<g:each var="miembro" in="${miembros}">
<table>
   <tr>
   <td> ${miembro.usuario} </td>
   </tr>
</table>
</g:each>



<g:form name="comentar" url="[action:'unirme',controller:'Grupo']" >
<fieldset class="datos">
<g:hiddenField name="grupoId" value="${grupo.id}" />
</fieldset>
<fieldset class="buttons">
<g:submitButton name="unirme" class="save" value="unirme" id="unirme" />
</fieldset>
</g:form>

<br>


<asset:stylesheet href="foto.css" />
<div class="container">
<!-- Example row of columns -->
<footer>
<p>BikeApp&copy; 2016 Company, Inc.</p>
</footer>
</div> <!-- /container -->

</body>
</html>

