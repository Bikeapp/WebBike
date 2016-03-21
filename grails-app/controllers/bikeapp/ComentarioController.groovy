package bikeapp

class ComentarioController {

   def index(){
      render "OK"
   }

   def save(Comentario comentarioInstance){
      if( comentarioInstance == null){
         return response.sendError(500)
      }
      comentarioInstance.foto = Foto.findById(params.fotoId)
      comentarioInstance.usuario = session.user
      comentarioInstance.save flush:true
      redirect(controller:"Foto",action: "show", params:[imagenactual : params.fotoId]);
   }

}
