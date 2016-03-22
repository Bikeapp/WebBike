package bikeapp

class GrupoController {

   def index() {
      if( session.user == null){
         return response.sendError(400)
      }
   }

   def create(){
      respond new Grupo(params)
   }

   def save(Grupo grupoInstance){
      if( grupoInstance == null){
         return response.sendError(500)
      }
      grupoInstance.administrador = session.user
      grupoInstance.save flush:true 
      redirect(action:"index")  
   }
}
