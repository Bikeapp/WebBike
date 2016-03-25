package bikeapp

class Grupo {


   //NOTAR QUE SE CAMBIO LA RELACION, ANTES LA RELACION DE MUCHOS A MUCHOS SE ESTABA REALIZANDO POR MEDIO DE GRAILS
   //SIN EMBARGO NO FUNCIONO COMO SE ESPERABA Y PUES SE UTILIZO ESTE ARTEFACTO
   static hasOne = [administrador:Usuario]
   
   String nombre
   String descripcion

    static constraints = {
         nombre(nullable:false)
         descripcion(nullable:true)
         administrador(nullable:false) 
    }

}
