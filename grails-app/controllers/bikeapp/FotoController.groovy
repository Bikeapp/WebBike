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
      def uploadedFile = request.getFile('selector')
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

   /*
   * Se leventa un error, tipo 400, cuando no se encuentra un usuario con sesion activa
   */
   def accesoDenegado(){
      //log.error("Acceso denegado, no hay una sesion activa")
      return response.sendError(400)
   }
 
   /*
   *Filtra las imagenes de acuerdo al usuario que se encuentre en sesión
   */  
   def list(){
      def imagenes = Foto.findAllByUsuario(session.user)
      [imagenes:imagenes]
   }

   def show(){
      def inx = params['imagenactual']
      def img = Foto.findById(inx)
      render(view:"show", model:[imagencapturada: img, inx : inx] )
   }

}
