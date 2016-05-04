package bikeapp

class AmistadService {

   def sesionService

   def Amigos(Usuario u1){
   	  def amigos = Amistad.findAllByU1OrU2(u1,u1)
   	  def n_amigos = []
   	  (amigos).each{
   	  	if (it.u1 == sesionService.usuarioEnSesion()){
   	  	   n_amigos.add(it.u2.username)
   	  	}
   	  	else{
   	  	   n_amigos.add(it.u1.username)
   	  	}   	  	 
   	  }
   	  return n_amigos
   }
}