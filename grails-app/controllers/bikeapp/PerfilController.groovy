package bikeapp

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USUARIO'])
class PerfilController {

   def sesionService

   def show(){
      def usuario = Usuario.findByUsername(params["usuario"])
      render(view:"show",model:[usuario:usuario])     
   }

   def pintarImagen(Usuario instancia){
      response.outputStream << instancia.foto
      response.outputStream.flush()
   }

   def miPerfil(){
      render(view:"show",model:[usuario:sesionService.usuarioEnSesion()])
   }

   def actualizar(){
      render params["usuario"]
      render "OK"
      //render(view:"actualizar",model:[usuario:params["usuario"]])
   }


}
