<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
</head>

<body>

<g:remoteLink class="logout" controller="logout">
Logout
</g:remoteLink> 

<section id="portfolio">
<div class="container">
<div class="row">

<ul class="portfolio-filter text-center">
<li><a class="btn btn-default active" href="javascript:obtenerEventos()">Mis Eventos</a></li>
<li><a class="btn btn-default" href="#" data-filter="*">Eventos Futuros</a></li>
<li><a class="btn btn-default" href="#" data-filter="*">Eventos Pasados</a></li>
<li><a class="btn btn-default" href="#" data-filter="*">Eventos Pasados</a></li>
</ul><!--/#portfolio-filter-->

<g:render template="listaEventos" />

</div>
</div>
</section>

</body>
</html>
