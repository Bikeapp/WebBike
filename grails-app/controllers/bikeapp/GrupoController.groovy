package bikeapp
import grails.plugin.springsecurity.annotation.Secured;

@Secured(['ROLE_USUARIO'])
class GrupoController {

   def sesionService

   def index() {
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
      def usuario = sesionService.usuarioEnSesion()
      grupoInstance.administrador = usuario
      grupoInstance.save flush:true 
      def usuario_grupo = new UsuarioGrupo(usuario:usuario,grupo:grupoInstance)
      usuario_grupo.save flush:true
      redirect(action:"index")  
   }


   //MUESTRA LOS GRUPOS CONSULTANDO APROPIADAMENTE LAS CLASES, FIJARSE EN COMO ENTRA LA TABLA INTERMEDIA EN LAS CONSULTAS
   def show(){
      def usuario = sesionService.usuarioEnSesion()
      def inx = params['grupoactual']
      def grupo = Grupo.findById(inx)
      def miembros = UsuarioGrupo.findAllByGrupo(grupo)
      def miembro = miembros.every{ it.usuario != usuario}
      render(view:"show",model:[grupo:grupo,miembros:miembros,miembro:miembro])
   }

   //PERMITE UNIRSE A UN GRUPO, ESTO SIMPLEMENTE SE HACE AGREGANDO UN REGISTRO EN LA TABLA INTERMEDIA
   def unirme(){
      def usuario = sesionService.usuarioEnSesion()
      def grupo = Grupo.findById(params["grupoId"])
      def usuario_grupo = new UsuarioGrupo(usuario:usuario,grupo:grupo)
      usuario_grupo.save flush:true
      redirect(action:"index")
   }
}
