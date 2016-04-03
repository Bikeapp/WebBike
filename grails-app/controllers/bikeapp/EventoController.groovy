package bikeapp

import grails.plugin.springsecurity.annotation.Secured


@Secured(['ROLE_USUARIO'])
class EventoController {

   def sesionService

   def index() {
      def misEventos = Evento.findAllByLider(sesionService.usuarioEnSesion())
      [misEventos:misEventos]
   }

   def nuevoEvento(){
      respond new Evento(params)
   }

   def guardar(Evento instance){
      def usuario = sesionService.usuarioEnSesion()
      def puntoInteres = new PuntoInteres()
      puntoInteres.usuario = usuario
      puntoInteres.lat = Double.parseDouble( params["lat"] )
      puntoInteres.lng = Double.parseDouble( params["lng"] )
      puntoInteres.tipo = "PUNTO_ENCUENTRO"
      puntoInteres.save flush:true,failOnError:true

      instance.puntoEncuentro = puntoInteres
      instance.descripcion = params["descripcion"]
      instance.lider = usuario
      instance.fecha = params["fecha"]
      instance.save flush:true,failOnError:true
      redirect(action:"index")
   }
}
