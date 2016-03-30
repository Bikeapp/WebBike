package bikeapp

import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_USUARIO'])
class EventoController {

   def sesionService

   def index() {
      def misEventos = Evento.findByLider(sesionService.usuarioEnSesion())
      [misEventos:misEventos]
   }

   def nuevoEvento(){
      respond new Evento(params)
   }

   def guardar(Evento instance){
      instance.descripcion = params["descripcion"]
      instance.lider = sesionService.usuarioEnSesion()
      instance.save flush:true
      redirect(action:"index")
   }
}
