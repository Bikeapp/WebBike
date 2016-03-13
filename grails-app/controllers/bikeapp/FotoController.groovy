package bikeapp

class FotoController {

   def index(Integer max) {
      if(session.user == null){
         accesoDenegado()
      }
      params.max = Math.min(max ?: 10, 100)
      //respond Foto.list(params), model:[FotoInstanceCount: Foto.count()]
      list()
    }

   def create(){
      respond new Foto(params)
   }

   def save(Foto instancia){
      if( instancia == null){
         return response.sendError(500)
      }
      def uploadedFile = request.getFile('imagen')
      instancia.imagen = uploadedFile.getBytes()
      instancia.usuario = session.user
      instancia.save flush:true
      redirect(action: "index")
   }

   /**Esta función es llamada por el .gsp que pinta las fotos, transoforma de un arreglo de byte a una foto visible*/
   def pintarImagen(Foto instancia){
      response.outputStream << instancia.imagen
      response.outputStream.flush()
   }


   def accesoDenegado(){
      //log.error("Acceso denegado, no hay una sesion activa")
      return response.sendError(400)
   }
   
   def list(){
      def imagenes = Foto.findAllByUsuario(session.user)
      [imagenes:imagenes]
   }

}
