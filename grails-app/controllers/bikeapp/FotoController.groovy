package bikeapp

class FotoController {

   //metodo index, es el encargado de llamar a la vista para mostrar el "album de fotos", para ello 
   //primero se tienen que reunir las fotos, eso lo hago en el metodo list()
  def index(Integer max) {
      if(session.user == null){
         accesoDenegado()
      }
      params.max = Math.min(max ?: 10, 100)
      //respond Foto.list(params), model:[FotoInstanceCount: Foto.count()]
      list()
    }


   //create de crear una nueva foto
   def create(){
      respond new Foto(params)
   }

   //Save nos permite guardar la foto en la base de datos, primero se valida que tengamos una instancia valida
   //donde guardar la foto, luego se captura la foto que el usuario selecciono, y posteriormente se convierte en un arreglo de bytes
   //antes de guardar capturo la sesion actual del usuario que esta activa y guardo, al final me dirigo a la pagina principal, es decir
   //a la que tiene el album de fotos, este metodo es invocado por la vista de create
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

   /**
   * este metodo es el encargado de mostrar una foto en particular, para ello desde la vista se captura el id de la imagen, 
   * y se pasa al modelo de esta vista, show, la imagen actual así como su indice, es una bobada redundante pero pues que se le hace
   */
   def show(){
      def inx = params['imagenactual']
      def img = Foto.findById(inx)
      def comentarios = Comentario.findAllByFoto(img)
      //render comentarios
      render(view:"show", model:[imagencapturada: img, inx : inx,comentarios:comentarios] )
   }


   /*
   * METODO ACTUALIZAR COMENTARIOS, SE ENCARGA DE VOLVER A LEER LOS COMENTARIOS DE LA FOTO Y LOS ENVIA AL TEMPLATE
   * NOTAR LA DIFERENCIA ENTRE EL redirect DEL METODO show Y EL DE ESTE METODO, AHORA APUNTO AL TEMPLATE DE comentarios
   * ES IMPORTANTE LEER SOBRE ESTA CARACTERISTICA QUE TIENE GRAILS Y ENTENDER COMO ES QUE FUNCIONA 
   */
   def actualizarComentarios(){
   
      def inx = params['imagenactual']
      def img = Foto.findById(inx)
      def comentarios = Comentario.findAllByFoto(img)
      //render comentarios
      render(template:"comentario", model:[comentarios:comentarios])

   }

}
