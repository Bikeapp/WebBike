	<!DOCTYPE html>
	<asset:stylesheet href="bikeApp.css"/>
	<html>
	    <head>  
	    	<meta charset="utf-8">
			  <meta name="viewport" content="width=device-width, initial-scale=1">
			  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
			  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
			  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>	

			  <style>
				h1,
				h2,
				h3,
				h4,
				h5,
				h6 {
					color: white;
					font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
				    text-transform: uppercase;				    			   
				    font-weight: 700;
				    letter-spacing: 1px;
				}
				body {
					
				    font-size: 20px;
				    color:white;
				    background: url('${resource(dir: "images", file: "bike3.jpg")}'); 
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
	    	<div class="page-header">
			  <h1><center>Intereses  </center> </h1>
			</div>
	        
	        
	        <div class="container" style="margin-top:10px">
		        
		        <div class="panel panel-default" style="background-color: rgba(245, 245, 245, 0.4)">
		        	<div class="panel-heading">
		        	 	Formulario de registro de intereses
		        	</div>
		        	<div class="panel-body">
		        		<g:form role="form" action="intereses" method="post" controller="usuario">
				        	<div class="form-group">
				        		<label>Si desea puede agregar uno o varios intereses a su usuario</label>
				        		<div class="checkbox">
								  <label><input type="checkbox" name="interes" value="Ofertas "> Ofertas</label>
								</div>
								<div class="checkbox">
								  <label><input type="checkbox" name="interes" value="Ciclopaseos"> Ciclopaseos</label>
								</div>
								<div class="checkbox">
								  <label><input type="checkbox" name="interes" value="Actualidad y ciclismo"> Actualidad y ciclismo</label>
								</div>
								<div class="checkbox">
								  <label> <input type="checkbox" name="interes" value="Soluciones de movilidad"> Soluciones de movilidad</label>
								</div>
								<div class="checkbox">
								  <label> <input type="checkbox" name="interes" value="Seguridad Vial"> Seguridad Vial</label>
								</div>
								<div class="checkbox">
								  <label> <input type="checkbox" name="interes" value="Ciclomontanismo"> Ciclomontañismo</label>
								</div>
								<div class="checkbox">
								  <label> <input type="checkbox" name="interes" value="Informacion ciclorutas"> Información ciclorutas</label>
								</div>
						     
						    </div>

				        		
							  
							<input type="submit" value="Aceptar" class="btn btn-primary btn-lg">
						</g:form>


		        	</div>       	
		        	
		        </div>	

	        </div>
	    </body>
	</html>