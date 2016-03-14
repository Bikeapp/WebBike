function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#vistaimagen').attr('src', e.target.result);
        }

        reader.readAsDataURL(input.files[0]);
    }
}

$("#selector").change(function(){
    readURL(this);
});

$("#create").on("click",function(){
   var selec = $("#combo")
   alert("OK");
   if( selec.files.length == 0){
      alert("Por favor selecione una imagen");
      $("#vistaimagen").css("background-color","#ffe6e6");
      return false;
   }
   return true;
});
