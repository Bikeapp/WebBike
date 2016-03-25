package bikeapp

class GrupoController {

   def index() {
      if( session.user == null){
         return response.sendError(400)
      }
      def grupos = Grupo.getAll()
      model:[ grupos : grupos ]
   }

   def create(){
      respond new Grupo(params)
   }


   //EN ESTA SE GUARDA LA INFORMACIÓN INICIAL DEL GRUPO, ADIONAL SE TIENE QUE EL ADMINISTRADOR SE REGISTRA DOS VECES, ESTO SE PUEDE
   //REDUCIR, EN LA SIGUIENTE TAREA LO VOY A PENSAR
   def save(Grupo grupoInstance){
      if( grupoInstance == null){
         return response.sendError(500)
      }
      def usuario = session.user
      grupoInstance.administrador = usuario
      grupoInstance.save flush:true 
      def usuario_grupo = new UsuarioGrupo(usuario:usuario,grupo:grupoInstance)
      usuario_grupo.save flush:true
      redirect(action:"index")  
   }


   //MUESTRA LOS GRUPOS CONSULTANDO APROPIADAMENTE LAS CLASES, FIJARSE EN COMO ENTRA LA TABLA INTERMEDIA EN LAS CONSULTAS
   def show(){
      def inx = params['grupoactual']
      def grupo = Grupo.findById(inx)
      def miembros = UsuarioGrupo.findAllByGrupo(grupo)
      render(view:"show",model:[grupo:grupo,miembros:miembros])
   }

   //PERMITE UNIRSE A UN GRUPO, ESTO SIMPLEMENTE SE HACE AGREGANDO UN REGISTRO EN LA TABLA INTERMEDIA
   def unirme(){
      def usuario = session.user
      def grupo = Grupo.findById(params["grupoId"])
      def usuario_grupo = new UsuarioGrupo(usuario:usuario,grupo:grupo)
      usuario_grupo.save flush:true
      redirect(action:"index")
   }
}
