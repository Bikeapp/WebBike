package bikeapp
import groovy.transform.ToString

@ToString
class Evento {

   static belongsTo = [ lider: Usuario, ruta : Ruta ]
   static hasMany = [ usuarios : Usuario ]

   Date fecha
   String descripcion
   PuntoInteres puntoEncuentro

   static constraints = {
      lider(nullable:false)
      ruta(nullable:true)
      descripcion(nullable:false)
      puntoEncuentro(nullable:true)
      fecha(nullable:true)
   }
}
