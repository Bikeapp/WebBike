<!DOCTYPE html>
<head>
<meta name="layout" content="main"/>
</head>

<body>
</br></br></br>


<!-- Main jumbotron for a primary marketing message or call to action -->
<div class="jumbotron">
<div class="container">
<h1>Algo ha salido mal.</h1>
<p>La operación no ha sido exitosa, por favor vuelve a intentarlo.</p>
</br></br></br>
<p>
<sec:ifNotLoggedIn>
<a class="btn btn-primary btn-lg" href="/WebBike" role="button">Volver al inicio</a></p>
</sec:ifNotLoggedIn>

<sec:ifLoggedIn>
<a class="btn btn-primary btn-lg" href="/WebBike/Perfil" role="button">Volver al inicio</a></p>
</sec:ifLoggedIn>

</div>
</div>


</body>
</html>
