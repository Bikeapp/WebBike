$("document").ready(function () {
   //Handler for .ready() called.
   window.setTimeout(function () {
      location.href = link
   }, 5000);
});



function enviarSugerencia(e){
   $.ajax({
      type:"POST",
      url:url_enviarSugerencia,
      data:{
         mensaje:$("#mensaje").val(),
         nombre:$("#nombre").val(),
         email:$("#email").val()
      },
      success: function(data){
         $("#mensaje").val("");
         $("#nombre").val("");
         $("#email").val("");
         alert("Sugerencia enviada");
      },
      error: function(){
         alert(url_enviarSugerencia);
         alert("Algo ha salido mal, por favor intentelo de nuevo!!");
      },
      complete: function(){}
   });
}

