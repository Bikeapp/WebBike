
function unirme(e){
   $.ajax({
      type:"POST",
      url:url,
      data:{
         id:$("#grupoId").val()
      },
      success: function(data){
         $("#rutinas").html(data)
      },
      error: function(){
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });

}

function limpiar(){
   $("#contenido").val('');
   //$('#comment').animate({'margin-top': '50px'}, 1000);
   $("#comments").animate({ scrollTop: $("#comments").prop("scrollHeight") }, 1000);
}

$("document").ready(function(){
   $("#comments").animate({ scrollTop: $("#comments").prop("scrollHeight") }, 3000);
});
