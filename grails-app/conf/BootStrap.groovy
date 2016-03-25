import bikeapp.*

class BootStrap {

   def springSecurityService
   
   //ESTE ARCHIVO NOS PERMITE REALIZAR UNA CONFIGURACION INICIAL SOBRE EL PROYECTO, EN ESTA PARTE ESTOY INSERTANDO DOS ROLES
   //Y UN USUARIO EN LA BASE DE DATOS, ESTO DADO QUE TUVE QUE ELIMINAR TODA LA PARTE DE REGISTRO Y LOGIN DEL USUARIO, PERDON
    def init = { servletContext ->
      //def userRole = SecRole.findByAuthority("ROL_USUARIO")?: new SecRole(autority:"ROL_USUARIO").save()
      //UNA OBSERVACION PARA ESTA PARTE ES QUE PARA SPRING LOS ROLES DEBEN COMENZAR CON 'ROLE_*', SINO ESTAN DE ESTA FORMA NO 
      //LES VA A FUNCIONAR BIEN EL ROL
      def userRole = new SecRole(authority:"ROLE_USUARIO").save()
      def adminRole = new SecRole(authority:"ROLE_ADMIN").save()
      //INSERTO UN NUEVO USUARIO EN LA BASE DE DATOS
      def usuarioNormal = new Usuario(
         username: "cigarcial",
         password: "1234",
         enable: true,
         email: "cigarcial@unal.edu.co",
         fecha: "13-04-94"
         ).save()
   
      SecUsuarioSecRole.create usuarioNormal,userRole  
 }
    def destroy = {
    }
}
