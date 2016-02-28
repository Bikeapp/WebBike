package bikeapp

class Ruta {

   static hasMany = [ puntos : PuntoInteres]
   String nombre

    static constraints = {
      nombre blank:false, nullable:false 
    }

}
