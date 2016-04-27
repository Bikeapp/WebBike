package bikeapp

//LO TUVE QUE BORRAR TODO, NO SE QUE ESTABA GENERANDO CONFLICTO Y ME DIO PEREZA PONER A MIRAR UNO POR UNO, LO CIERTO ES QUE EL LOGIN
//Y EL LOGOUT LO VA A MANEJAR SPRING DE AHORA EN ADELANTE, SERIA RE ESCRIBIR EL REGISTRO, SIN EMBARGO ES SOLO AJUSTAR PARA QUE LO HAGA.:

//EN ESTA CLASE PROCURAR NO PONER NADA DADO QUE ES UN CONTROLADOR QUE ES DE TIPO PUBLICO
class UsuarioController {

   def sesionService

   def registro() {
      def user = new Usuario(params)
      user.save(failOnError: true)
      def roleUser = SecRole.findByAuthority('ROLE_USUARIO')
      SecUsuarioSecRole.create user,roleUser,true
      [username:user.username]
   }

   def intereses(){
      def user= Usuario.findByUsername(params['username']) 
      String s="['"
      for(item in params.interes){
         s+=item
         s+="','"
      }
      s=s.substring(0,s.length()-2)
      s+="]"
      user.interes=s
      user.save flush:true,failOnError:true
      redirect(uri:'/')
   }

}
