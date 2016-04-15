
function limpiar(){
   $("#contenido").val('');
   //$('#comment').animate({'margin-top': '50px'}, 1000);
   $("#tmp").animate({ scrollTop: $("#tmp").prop("scrollHeight") }, 1000);
}

$("document").ready(function(){
   $("#tmp").animate({ scrollTop: $("#tmp").prop("scrollHeight") }, 3000);
});
