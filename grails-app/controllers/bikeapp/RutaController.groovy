package bikeapp

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USUARIO'])
class RutaController {

    def index() { }

   def registro(){
     def ruta = new Ruta(params)
     ruta.save(failOnError:true)
   }
}
