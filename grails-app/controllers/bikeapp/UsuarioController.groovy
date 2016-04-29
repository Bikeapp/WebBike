package bikeapp

//LO TUVE QUE BORRAR TODO, NO SE QUE ESTABA GENERANDO CONFLICTO Y ME DIO PEREZA PONER A MIRAR UNO POR UNO, LO CIERTO ES QUE EL LOGIN
//Y EL LOGOUT LO VA A MANEJAR SPRING DE AHORA EN ADELANTE, SERIA RE ESCRIBIR EL REGISTRO, SIN EMBARGO ES SOLO AJUSTAR PARA QUE LO HAGA.:

import grails.plugin.springsecurity.annotation.Secured

//EN ESTA CLASE PROCURAR NO PONER NADA DADO QUE ES UN CONTROLADOR QUE ES DE TIPO PUBLICO
class UsuarioController {

   def sesionService

   def index(){
      redirect(uri:"/")
   }

   def registro() {
      def user = new Usuario(params)
      user.enabled = false
      user.save flush:true,failOnError: true
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
      redirect(action:'mensaje',params:[username:user.username,usermail:user.email,name:user.nombre])
   }

   def mensaje(){
      def message = "Hola "+params['name']+", \n\n\n\n"+
         "Gracias por registrarse en BikeApp!! \n\n"+
         "Para validar tu cuenta por favor haz click sobre el siguiente enlace:\n\n"+
         "http://localhost:8080/WebBike/usuario/confirmar?username="+params['username']+"\n\n"+
         "Saludos, BikeApp Team!!"
      sendMail {
         async true
         to params['usermail']
         cc "bikeappteam@gmail.com"
         subject "Validación de Cuenta - BikeApp"
         body  message
      }
      render(view:"satisfactorio")
   }


   def test(){
           /*sendMail {
         async true
         to "cigarcial@unal.edu.co"
         cc "bikeappteam@gmail.com"
         subject "Validación de Cuenta - BikeApp"
         body  message
      }*/
      //render "OK"

      render(view:"satisfactorio")
   }

   def confirmar(){
      def user = Usuario.findByUsername(params['username'])
      user.enabled = true
      user.save flush:true,failOnError:true
      //falta esta vista
      redirect(uri:"/")
   }
}
