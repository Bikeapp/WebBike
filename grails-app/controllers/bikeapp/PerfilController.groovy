package bikeapp

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USUARIO'])
class PerfilController {

   def sesionService
   
   def index(){
      redirect(action:"miPerfil");
   }

   def show(){
      def usuario = Usuario.findByUsername(params["usuario"])
      [usuario:usuario]
      //render(view:"show",model:[usuario:usuario])     
   }

   def pintarImagen(Usuario instancia){
      response.outputStream << instancia.foto
      response.outputStream.flush()
   }
   
   //Controlador que redirige a los mensajes del usuario
   def mensajes(){
   	  redirect(controller:"mensaje",view:"index")
   }

   def miPerfil(){
      render(view:"show",model:[usuario:sesionService.usuarioEnSesion()])
   }

   def actualizar(){
      //render "OK"
      def sexos = ["Hombre","Mujer"]
      render(view:"actualizar",model:[usuario:sesionService.usuarioEnSesion(),sexos:sexos])
   }

   def update(){
      def usuario = sesionService.usuarioEnSesion()
      def uploadedFile = request.getFile('selector')
      usuario.foto = uploadedFile.getBytes()
      usuario.mensaje = params["mensaje"]
      usuario.sexo = params["sexo"]
      usuario.fecha = params["fecha"]
      usuario.save flush:true
      redirect(action:"miPerfil")
   }

}
