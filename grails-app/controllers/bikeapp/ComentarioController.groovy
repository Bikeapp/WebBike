package bikeapp

class ComentarioController {

   // no hace nada
   def index(){
      render "OK"
   }

   /*
   *se encarga de guardar el comentario en la base de datos
   *este metodo es invocado por el boton comentar en la vista 'show' de Foto
   *hay que tener en cuenta la forma en al cual capturo el id de la foto, esto lo hago por medio de un campo invisible, para mayor 
   *informacion contacte a mi abogado, no mentiras en la vista pueden ver el campo
   */
   //se actualiza ahora se apunta a lmetodo actualizar comentarios, en el cual se puede actualiza unicamente el template
   def save(Comentario comentarioInstance){
      if( comentarioInstance == null){
         return response.sendError(500)
      }
      comentarioInstance.foto = Foto.findById(params.fotoId)
      comentarioInstance.usuario = session.user
      comentarioInstance.save flush:true
      redirect(controller:"Foto",action: "actualizarComentarios", params:[imagenactual : params.fotoId]);
   }

}
