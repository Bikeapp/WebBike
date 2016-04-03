package bikeapp
import groovy.transform.ToString

@ToString
class PuntoInteres {

   static belongsTo = [ usuario : Usuario, ruta: Ruta,evento:Evento]

   double lat
   double lng
   String nombre
   String descripcion
   double calificacion
   String tipo

   static constraints = {
      usuario(nullable:false)
      ruta(nullable:true)
      nombre(nullable:true)
      descripcion(nullable:true)
      calificacion(nullable:true)
      evento(nullable:true)
   }
}
