<!DOCTYPE html>
<html lang="en">

	<head>
		<meta name="layout" content="main"/>
		<asset:stylesheet src="perfil.css"/>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.8.0/jquery-1.8.0.min.js"></script>	
		<asset:javascript src="jR3DCarousel.min.js"/>
		<script type="text/javascript">
			jQuery(document).ready(function( $ ) {
				console.log(${imagenes.size});
				var slides = [];
				<g:each var="imagen" in="${imagenes}" status="i">
					slides.push({src:"${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id }")}"});					
                           
				</g:each>
				
						
				
				var jR3DCarousel;
				var carouselProps =  {

					width: 400, 				/* largest allowed width */
					height: 222, 				/* largest allowed height */
					slideLayout : 'fill',     /* "contain" (fit according to aspect ratio), "fill" (stretches object to fill) and "cover" (overflows box but maintains ratio) */
					animation: 'slide3D', 		/* slide | scroll | fade | zoomInSlide | zoomInScroll */
					animationCurve: 'ease',
					animationDuration: 700,
					animationInterval: 1000,
					//slideClass: 'jR3DCarouselCustomSlide',
					autoplay: false,
					onSlideShow: show,		/* callback when Slide show event occurs */
					navigation: 'circles',	/* circles | squares */
					slides: slides 			/* array of images source or gets slides by 'slide' class */
									  
							}
				function setUp(){
			 		jR3DCarousel = $('.jR3DCarouselGallery').jR3DCarousel(carouselProps);
					$('.settings').html('<pre>$(".jR3DCarouselGallery").jR3DCarousel('+JSON.stringify(carouselProps, null, 4)+')</pre>');		
					
				}
				function show(slide){
					console.log("Slide shown: ", slide.find('img').attr('src'))
				}
				$('.carousel-props input').change(function(){
					if(isNaN(this.value))
						carouselProps[this.name] = this.value || null; 
					else
						carouselProps[this.name] = Number(this.value) || null; 
					
					for(var i = 0; i < 999; i++)
				     clearInterval(i);
					$('.jR3DCarouselGallery').empty();
					setUp();
					jR3DCarousel.showNextSlide();
				})
				
				$('[name=slides]').change(function(){
					carouselProps[this.name] = getSlides(this.value); 
					for (var i = 0; i < 999; i++)
				     clearInterval(i);
					$('.jR3DCarouselGallery').empty();
					setUp();
					jR3DCarousel.showNextSlide();		
				});
				
				function getSlides(no){
					slides = [];
					for ( var i = 0; i < no; i++) {
						slides.push({src: 'https://unsplash.it/'+Math.floor(1366-Math.random()*200)+'/'+Math.floor(768+Math.random()*200)})
					}
					return slides;
				}
				
				//carouselProps.slides = getSlides(7);
				setUp()
			  })
			</script>

			<style type="text/css">
				
				
				.jR3DCarouselGallery,.jR3DCarouselGallery1 {
					margin: 0 auto; /* optional - if want to center align */
				}
				
				.wrapper {
					padding-right: 10px;
					padding-left: 10px;
					width: 48%;
					height: 299px;
					float: left;
					overflow: auto;
					border-left: 1px solid #999;
				}
				.wrapper div {
					margin: 8px auto;
				}
				</style>
			
	</head>

	<body>

<!-- 
		<h1>Mis fotos</h1>
		<nav class="navbar navbar-default">
		  <div class="container-fluid">
		    <div class="navbar-header">
		    	
				<g:link class="btn btn-default navbar-btn create" role="button" action="create">Agregar Imagen</g:link>
				
		      
		    </div>
		  </div>
		</nav>
		
			
	



		<div class="lightbox-container">
		    <table id="albumfotos"> 
				<g:each var="imagen" in="${imagenes}" status="i">
					
					
					<tr>
					<div class="box">
						<img alt="An example image 2" class="lightbox-image" src="${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id}")}" width='300' height='300' />
					</div>
					</tr>
					<td>
					<g:link class="btn btn-default navbar-btn create" action="show" params="[imagenactual : imagen.id]">Agregar Imagen</g:link>
					</td>
					
					
					
				</g:each>
			</table>
		    
		</div> -->

			
		
			
		
	

		
<div class="section">
         <div class="container">
            <div class="row">
            	
               <div class="col-md-12">
                  <h1 class="text-center">Mis Fotos</h1>
               </div>
            </div>
         </div>
      </div>
      <div class="section">
         <div class="container">
         	<div>
					<div class="jR3DCarouselGallery"></div>
				</div>
            <div class="row">
               <div class="col-md-12">
                  <div id="carousel-example" data-interval="false" class="carousel slide" data-ride="carousel">
                     <div class="carousel-inner">
                        <div class="item active">
                           <img src="${createLink(controller:'Foto', action:'pintarImagen', id:1)}">
                           <div class="carousel-caption">
                              <h2>Title</h2>
                              <p>Description</p>
                           </div>
                        </div>
						<g:each var="imagen" in="${imagenes}" status="i">
                        <div class="item">
							<img src="${createLink(controller:'Foto', action:'pintarImagen', id:"${imagen.id }")}">
                           <div class="carousel-caption">
                              <h2>${imagen.id}</h2>
                              <p>Description</p>
                           </div>
                        </div>
						</g:each>
                     </div>
                     <a class="left carousel-control" href="#carousel-example" data-slide="prev"><i class="icon-prev  fa fa-angle-left"></i></a><a class="right carousel-control" href="#carousel-example" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="section">
         <div class="container">
            <div class="row">
               <div class="col-md-6"><g:link class="btn btn-lg btn-primary" action="create">Añadir Foto</g:link></div>
               <div class="col-md-6 text-right"><a class="btn btn-lg btn-primary">Comentar</a></div>
            </div>
         </div>
      </div>
		
		
		

		<!-- <asset:stylesheet href="foto.css" /> -->
		<div >
		<!-- Example row of columns -->
		<footer>
		<p>BikeApp&copy; 2016 Company, Inc.</p>
		</footer>
		</div> <!-- /container -->

		
		<script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
		<!-- <script src="js/lightweightLightbox.min.js"></script> -->
		<asset:javascript src="lightweightLightbox.js"/>
		<asset:javascript src="foto.js"/>
		<script type="text/javascript">
		    $(".lightbox-container").lightweightLightbox();
		</script>


	</body>
</html>
