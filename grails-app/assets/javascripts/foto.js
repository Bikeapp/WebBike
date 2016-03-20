/*
 * CODIGO JAVASCRIPT PARA LAS VISTAS QUE MANEJAN LAS FOTOS
 */

/*
 * Se encarga de pintar la imagen en el componente de previsualización
 */
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#vistaimagen').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

/*
 * En esta parte el código se registra el evento "cambio de estado" para el seleccionador de archivos
 */
$("#selector").change(function(){
    readURL(this);
});

/*
 * Funcion que valida si hay un archivo seleccionado, si no se genera un mensaje
 */
$("#create").on("click",function(){
   var selec = $("#selector")
   if( selec.val() == ''){
      alert("Por favor selecione una imagen");
      $("#vistaimagen").css("background-color","#ffe6e6");
      return false;
   }
   return true;
});
