package bikeapp

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_USUARIO'])
class MensajeController {

   def sesionService

   def index(){
      def usuario = sesionService.usuarioEnSesion()  	//Obtenemos el usuario para buscar mensajes que corresponde.
      [mensajes:Mensaje.list(),usuario:usuario, conversaciones: ConvU.findAllByU1(usuario)]		//El controlador envía al cliente un parametro con los mensajes que encuentre en la BD para el usuario en sesion.
   }
   
   //Se utiliza para crear una conversacion nueva.
   def crearC(){
      def usuario = sesionService.usuarioEnSesion()		//Obtiene el usuario
      def conversacion = new ConvU(u1:usuario.id,u2:usuario.id)	//Crea una conversacion con el usuario
      conversacion.save(flush:true)		//Persiste en la base de datos
      redirect(view:"index")			//Redirecciona a la pagina principal de mensajes
   }
   
   //Se utiliza para crear mensajes.
   def crearM(){
      def usuario = sesionService.usuarioEnSesion()			//Obtiene el usuario
      def mensaje = new Mensaje(dueño:usuario.id,conversacion:usuario.id,fecha:"hoy",contenido:params.contenido)		//Crea un nuevo mensaje
      mensaje.save(flush:true)			//persiste en la base de datos.
      redirect(view:"index")			//redirecciona a index de mensajes.
   }
   
   
   def buscarMensajes(){
      def userName = params.userName		//Recibo el userName
      def usuario1 = sesionService.usuarioEnSesion()	//Encuentro el usuario logueado
      def usuario2 = Usuario.findByNombre(userName)		//Encuentro el usuario con ese username
      def conversacion = ConvU.findByU1AndU2(usuario1,usuario2)		//Encuentro conversacion entre ambos usuarios
      def mensajes = Mensaje.findAllByConversacion(conversacion)	//Encuentro mensajes asociados a esa conversacion
      //println("Mensajes:" + mensajes)
      render mensajes as JSON				//devuelvo mensajes a javascript
   }
   
   
   def crearMensaje(){
   	  def userName = params.userName			//Obtengo el parametro nombre para buscar el usuario.
      def usuario1 = sesionService.usuarioEnSesion()		//encuentro el usuario logueado
      def usuario2 = Usuario.findByNombre(userName)			//Encuentro el usuario destino
      def conversacion = ConvU.findByU1AndU2(usuario1,usuario2)			//Encuentro la conversacion actual
      def mensaje = new Mensaje(fecha:"hoy",conversacion:conversacion,dueño:usuario1,contenido:params.contenido)		//Creo el nuevo mensaje
      mensaje.save(flush:true)
      render mensaje.contenido
   }
   
   
   def crearConversacion(){
      def usuario1 = sesionService.usuarioEnSesion()		//Usuario creador de la conversacio
      def userName = params.convSel				//Nombre de usuario del destinatario
      def usuario2 = Usuario.findByNombre(userName)			//Usuario del destinatario en la base de datos
      def conversacion = new ConvU(u1:usuario1,u2:usuario2)		//Creo una nueva conversacion con ambos usuarios
      conversacion.save(flush:true)		//Almaceno la nueva conversacion
      render conversacion as JSON
      
   }

}
