package bikeapp

class AmistadService {

   def Amigos(Usuario u1){
   	  [amigos : Amigos.findAllBy(u1)]
      //return Usuario.get(springSecurityService.principal.id)
   }
}