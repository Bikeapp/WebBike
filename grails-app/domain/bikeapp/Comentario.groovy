package bikeapp
import groovy.transform.ToString

@ToString
class Comentario {

   static belongsTo = [usuario:Usuario, foto:Foto]

   Date dateCreated
   String contenido

   static constraints = {
      contenido(nullable:false)
      usuario(nullable:false)
      foto(nullable:false)
   }
}
