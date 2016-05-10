<html>
<head>
	<meta name="layout" content="main"/>
	<asset:javascript src="grupo.js" />
	<asset:stylesheet href="grupos.css" />

</head>



<body>

	<li><g:remoteLink class="logout" controller="logout">
		Logout
	</g:remoteLink> </li>

	<section id="blog" class="padding-top">
		<div class="container">
			<div class="row">

				<div class="col-md-3 col-sm-5">
					<div class="sidebar blog-sidebar">

						<div class="sidebar-item  recent">
							<h3>Buscar Grupos</h3>
							<div class="media">
								<g:javascript>
								var url_busGrupo = "${createLink(controller:'Grupo',action:'buscarGrupos')}"
							</g:javascript>
							<form id="buscar-grupo" name="buscar-grupo" method="post" >
								<div class="form-group">
									<input type="text" name="tags" class="form-control" required="required" placeholder="Tags a buscar" id="tags">
									<input type="button" name="buscar" class="btn btn-submit" value="Buscar" onclick="buscarGrupos()">
								</div>
							</form>
						</div>
					</div>

					<div class="sidebar-item categories">
						<h3>Grupos</h3>
						<ul class="nav navbar-stacked" id="listaGrupos">
							<g:render template="listaGrupos" />
						</ul>

						<input type="button" name="buscar" class="btn btn-submit" value="Nuevo Grupo" id="btnCrearGrupo">

						<script>
							$(document).ready(function(){
							    $("#btnCrearGrupo").click(function(){
							        $("#crearGrupo").modal();
							    });
							});
						</script>
					</div>

				</div>
			</div>

			<div class="col-md-9 col-sm-7">
				<div class="row" id="contenido-grupo">
					<g:render template="grupo" />
				</div>
			</div>

		</div>
	</div>


	<div id="crearGrupo" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Nuevo Grupo</h4>
				</div>
				<g:form url="[resource:grupoInstance, action:'save']"  enctype="multipart/form-data" role="form">
				<div class="modal-body">

					<div class="form-group">
						<label for="nombre">Nombre del grupo:</label>
						<g:textField name="nombre" class="form-control campoCrear" placeholder="Nombre"/>					  
					</div>

					<script>
							$(document).ready(function(){
							    $(".campoCrear").on("input",function() {check();})
							});
					</script>
					<div class="form-group">
						<label for="descripcion">Descripción del grupo:</label>
						<g:textArea name="descripcion" class="form-control campoCrear" placeholder="Descripción" />					  
					</div>

					<div class="form-group">
						<label for="tags">Tags:</label>
						<g:textArea name="tags" class="form-control " placeholder="Tags (separados por comas ',' )"/>					  
					</div>


					

					
				</div>
				<div class="modal-footer">
					<g:submitButton name="create" class="btn btn-submit" value="Crear" id="create" disabled="true" />									
				</div>
				</g:form>
			</div>

		</div>
	</div>


</section>

<!--/#blog-->
<!--/#blog-->
<!--/#blog-->
<!--/#blog-->


</body>
</html>
