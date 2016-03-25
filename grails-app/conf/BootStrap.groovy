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
      def usuario1 = new Usuario(
         username: "cigarcial",
         password: "1234",
         enable: true,
         email: "cigarcial@gmail.com",
         fecha: "13-04-94"
         ).save()
      SecUsuarioSecRole.create usuario1,userRole  
      def usuario2 = new Usuario(
         username: "migarcial",
         password: "1234",
         enable: true,
         email: "migarcial@gmail.com",
         fecha: "13-04-94"
         ).save()
      SecUsuarioSecRole.create usuario2,userRole  
      def usuario3 = new Usuario(
         username: "cneiva",
         password: "1234",
         enable: true,
         email: "cneiva@gmail.com",
         fecha: "13-04-94"
         ).save()
      SecUsuarioSecRole.create usuario3,userRole  
      def usuario4 = new Usuario(
         username: "ddager",
         password: "1234",
         enable: true,
         email: "ddager@gmail.com",
         fecha: "13-04-94"
         ).save()
      SecUsuarioSecRole.create usuario4,userRole  
   }
    def destroy = {
    }
}
