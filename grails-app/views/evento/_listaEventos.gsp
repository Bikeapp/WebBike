
<div class="portfolio-items">

<g:each in="${eventos}" >

<div class="col-xs-6 col-sm-4 col-md-3 portfolio-item branded logos">
<div class="portfolio-wrapper">

<div class="portfolio-single">

<!--preview del evento-->
<div class="portfolio-thumb">
<img src="${assetPath(src:'photo.gif')}" class="img-responsive" alt="">
</div>

<div class="portfolio-view">
<ul class="nav nav-pills">
<li><a href="${createLink(action:'mostrarEvento',params:[evento:it.id])}">
<i class="fa fa-link"></i>Ver más
</a></li>
<li>

<!--<a href="${assetPath(src:'photo.gif')}" data-lightbox="example-set">
<a href="${createLink(action:'resumenEvento')}" data-lightbox="example-set">hola
<i class="fa fa-eye">
</i>
</a>
-->

<!-- ここからモーダルウィンドウ -->
<!--
<div id="modal-content">
   <p>Contenido 1 </p>
   <p>Contenido 2</p>
   <p><a id="modal-close">Cerrar</a></p>
</div>
<p><a id="modal-open" class="button-link">Resumen</a></p>
-->
<!-- ここまでモーダルウィンドウ -->


</li>
</ul>
</div>

</div>

<div class="portfolio-info ">
<h2>
${it.nombre}
</h2>
</div>

</div>
</div>

</g:each>

</div>

<!--

<div class="portfolio-pagination">
<ul class="pagination">
<li><a href="#">left</a></li>
<li><a href="#">1</a></li>
<li class="active"><a href="#">3</a></li>
<li><a href="#">9</a></li>
<li><a href="#">9</a></li>
<li><a href="#">9</a></li>
<li><a href="#">9</a></li>
<li><a href="#">right</a></li>
</ul>
</div>
-->
