package bikeapp

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USUARIO'])
class PerfilController {

   def sesionService
   
   def index(){
      redirect(action:"miPerfil");
   }

   def show(){
      if( params["username"] == sesionService.usuarioEnSesion().username ){
         redirect(action:"index")
      }
      def usuario = Usuario.findByUsername(params["username"])
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
      render(view:"perfil",model:[usuario:sesionService.usuarioEnSesion()])
   }

   def actualizar(){
      //render "OK"
      def sexos = ["Hombre","Mujer"]
      render(view:"actualizar",model:[usuario:sesionService.usuarioEnSesion(),sexos:sexos])
   }

   def update(){
      def usuario = sesionService.usuarioEnSesion()
      def uploadedFile = request.getFile('selector')
      usuario.foto = (uploadedFile.getBytes() == [] )? null : uploadedFile.getBytes() ;
      usuario.mensaje = params["mensaje"] 
      usuario.sexo = params["sexo"]
      usuario.fecha = params["fecha"]
      usuario.save flush:true,failOnError:true
      redirect(action:"miPerfil")
   }

}
