<html>
<head>
<meta name="layout" content="public"/>
<!--  SE PREGUNTARAN QUE HACE ESTA JS AQUI, SU RAZON DE SER ES QUE NECESITO QUE GRAILS LO RESUELVA Y ESO NO SUPE COMO HACERLO DESDE EL .js-->
<script>
   var link = '<g:createLink controller="usuario" action="index" />'
</script>
<asset:javascript src="usuario.js" />
</head>

<body>

   ${msj}

   Redireccionamiento en 5seg

</body>
</html>
