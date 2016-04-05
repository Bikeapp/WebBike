package bikeapp

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USUARIO'])
class MensajeController {

   def sesionService

   def index(){
      def usuario = sesionService.usuarioEnSesion()  	//Obtenemos el usuario para buscar mensajes que corresponde.
      [mensajes:Mensaje.list(),usuario:usuario, conversaciones: ConvU.findAllByU1(usuario)]		//El controlador envía al cliente un parametro con los mensajes que encuentre en la BD.
   }
   
   def crearC(){
      def usuario = sesionService.usuarioEnSesion()
      println("------=========="+usuario+"==============---------------")
      def conversacion = new ConvU(u1:usuario.id,u2:usuario.id)
      conversacion.save(flush:true)
      redirect(view:"index")
   }
   
   def crearM(){
      def usuario = sesionService.usuarioEnSesion()
      println("------=========="+usuario+"==============---------------")
      def mensaje = new Mensaje(dueño:usuario.id,conversacion:params.convSel,fecha:"hoy",contenido:params.contenido)
      mensaje.save(flush:true)
      redirect(view:"index")
   }

}
