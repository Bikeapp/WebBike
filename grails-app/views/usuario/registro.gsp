<!--                 PILAS CON ESTA VISTA, AUNQUE DICE REGISTRO NO CORRESPONDE CON LA VISTA DE REGISTRO -->

<!DOCTYPE html>
<asset:stylesheet href="bikeApp.css"/>
<html>
<head>
<meta name="layout" content="public"/>
</head>
<body>
<div class="header">
</div>

${username}

<div>
<p>Si desea puede agregar uno o varios intereses a su usuario</p>
<g:form action="intereses" method="post" controller="usuario">
<g:hiddenField name="username" value="${username}"/>
<input type="checkbox" name="interes" value="Ofertas "> Ofertas <br>
<input type="checkbox" name="interes" value="Ciclopaseos"> Ciclopaseos<br>
<input type="checkbox" name="interes" value="Actualidad y ciclismo"> Actualidad y ciclismo<br>
<input type="checkbox" name="interes" value="Soluciones de movilidad"> Soluciones de movilidad<br>
<input type="submit" value="Submit">
</g:form>


</div>	
</body>
</html>
