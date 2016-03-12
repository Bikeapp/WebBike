package bikeapp

class FotoController {

   def index(Integer max) {
      if(session.user == null){
         accesoDenegado()
      }
      params.max = Math.min(max ?: 10, 100)
      //respond Foto.list(params), model:[FotoInstanceCount: Foto.count()]
   }

   def create(){
      respond new Foto(params)
   }

   def save(Foto instancia){
      if( instancia == null){
         notFound()
         return
      }
      def uploadedFile = request.getFile('photo')
      instancia.photphoto = uploadedFile.getBytes()
      instancia.save flush:true
      redirect(action: "index")
   }

   /**Esta función es llamada por el .gsp que pinta las fotos, transoforma de un arreglo de byte a una foto visible*/
   def pintaFoto(Foto instancia){
      response.outputStream << instancia.photo
      response.outputStream.flush()
   }


   def accesoDenegado(){
      log.error("Acceso denegado, no hay una sesion activa")
      return response.sendError(400)
   }
}
