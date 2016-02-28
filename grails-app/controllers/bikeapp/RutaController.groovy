package bikeapp

class RutaController {

    def index() { }

   def registro(){
     def ruta = new Ruta(params)
     ruta.save(failOnError:true)
   }
}
