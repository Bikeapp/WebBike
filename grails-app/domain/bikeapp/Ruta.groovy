package bikeapp
import groovy.transform.ToString

@ToString
class Ruta {

   static hasMany = [ puntos : PuntoInteres]
   String nombre
   String descripcion
   String calificacion
   

    static constraints = {
      nombre(nullable:false)
      descripcion(nullable:false)
      puntos(nullable:true)
      calificacion(nullable:true)
    }

}
