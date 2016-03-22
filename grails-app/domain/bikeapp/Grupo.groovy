package bikeapp

class Grupo {

   static belongsTo = Usuario
   static hasMany = [usuarios:Usuario]
   static hasOne = [administrador:Usuario]
   
   String nombre
   String descripcion

    static constraints = {
         nombre(nullable:false)
         descripcion(nullable:true)
         administrador(nullable:false) 
    }
}
