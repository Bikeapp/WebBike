package bikeapp

import grails.plugin.springsecurity.annotation.Secured
import grails.converters.JSON

@Secured(['ROLE_USUARIO'])
class MensajeController {

   def sesionService

   def index(){
      def usuario = sesionService.usuarioEnSesion()  	//Obtenemos el usuario para buscar mensajes que corresponde.
      [mensajes:Mensaje.list(),usuario:usuario, conversacionesAll: ConvU.list(), conversaciones: ConvU.findAllByU1OrU2(usuario,usuario),usuarios: Usuario.list()]		//El controlador envía al cliente un parametro con los mensajes que encuentre en la BD para el usuario en sesion.
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
      def mensajes = []
      def usuario1 = sesionService.usuarioEnSesion()	//Encuentro el usuario logueado
      def usuario2 = Usuario.findByNombre(userName)		//Encuentro el usuario con ese username
      def conversacion2 = ConvU.findByU1AndU2(usuario1,usuario2)
      def conversacion3 = ConvU.findByU1AndU2(usuario2,usuario1)
      if (conversacion2 != null){
      	mensajes = Mensaje.findAllByConversacion(conversacion2)	//Encuentro mensajes asociados a esa conversacion
      }
      else if (conversacion3 != null){
      	mensajes = Mensaje.findAllByConversacion(conversacion3)	//Encuentro mensajes asociados a esa conversacion
      }
      else{
      	mensajes = null
      }
      //println("Mensajes:" + mensajes)
      render mensajes as JSON				//devuelvo mensajes a javascript
   }
   
   //Funcion que se encarga de buscar las conversaciones asociadas a un usuario en la base de datos.
   def buscarConversaciones(usr1,usr2){
   		def usuario = usr
   		def s1 = ConvU.findByU1OrU2(usr1,usr1)
   		if (s1 != null){
   			return 'No existen conversaciones para el usuario'
   		}
   		else{
   			def conversacion = new ConvU(u1:usr1,u2:usr2)		//Creo una nueva conversacion con ambos usuarios
      		conversacion.save(flush:true)		//Almaceno
      	}
   
   
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
      def userName = params.userName				//Nombre de usuario del destinatario
      def usuario2 = Usuario.findByNombre(userName)			//Usuario del destinatario en la base de datos
      def conv1 = ConvU.findByU1AndU2(usuario1,usuario2)
      def conv2 = ConvU.findByU1AndU2(usuario2,usuario1)
      if (conv1 != null){
      	JSON.use('deep'){		//MOTHERFUCKER DEEP JSON.
        	render conv1 as JSON
      	}
      }
      else if (conv2 != null){
      	JSON.use('deep'){		//MOTHERFUCKER DEEP JSON.
        	render conv2 as JSON
      	}
      }
      else if (conv1 == null && conv2 == null){
      	def conversacion = new ConvU(u1:usuario1,u2:usuario2)		//Creo una nueva conversacion con ambos usuarios
      	conversacion.save(flush:true)		//Almaceno la nueva conversacion
      	JSON.use('deep'){		//MOTHERFUCKER DEEP JSON.
        	render conversacion as JSON
      	}
      }      
   }
}
