<!DOCTYPE html>
<html lang="en">
<head>
<meta name="layout" content="main"/>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 
 
<asset:stylesheet src="bootstrap.min.css"/>
			<style>
				h1,
				h2,
				h3,
				h4,
				h5,
				h6 {
					color: black;
					font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
				    text-transform: uppercase;				    			   
				    font-weight: 700;
				    letter-spacing: 1px;
				}
				body {
				    
				    background: url('${resource(dir: "images", file: "bicycles_gears.jpg")}'); 
				    background-size: auto auto;
				    background-attachment: fixed;
				   
				}
				footer {
				    position: fixed;
   					 bottom: 0;
				}


			   

		    </style>
</head>

<body>

<h1>Subir una foto</h1>

<div class="container-fluid">

	<div class="list-group col-md-2 ">

		<g:link class="list-group-item" action="index">
			<span class="glyphicon glyphicon-arrow-left"></span> 
			Regresar a las fotos
		</g:link>
 
	</div>

</div>





<div role="navigation">
	<g:form url="[resource:fotoInstance, action:'save']"  enctype="multipart/form-data">
		<fieldset class="form">
			<div id="controlessubir" class="controlessubir">
				<img class="img-responsive img-thumbnail" id="vistaimagen" src="" height="auto" width="auto" />
				<input type="file" class="panel panel-default" id="selector" name="selector" />
			</div>
		</fieldset>
		<p>
		<fieldset class="buttons">
			<div class="container">
				<g:submitButton name="create" class="save btn btn-default" value="Subir" id="create" />
			</div>
			
		</fieldset>
	</g:form>
</div>




<asset:javascript src="foto.js" />
<asset:stylesheet href="foto.css" />
<div class="container">
<!-- Example row of columns -->
<footer>
<p>BikeApp&copy; 2016 Company, Inc.</p>
</footer>
</div> <!-- /container -->
</body>
</html>
