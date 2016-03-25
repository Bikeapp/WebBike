import bikeapp.*

class BootStrap {

    def init = { servletContext ->

         def user = new Usuario(
         usuario: "cigarcial",
         contrasena: "1234",
         email: "unzero@gmail.com",
         fecha: "13-04-97"
         ).save()
         def user1 = new Usuario(
         usuario: "migarcial",
         contrasena: "1234",
         email: "migarcial@gmail.com",
         fecha: "13-04-97"
         ).save()
         def user2 = new Usuario(
         usuario: "ddager",
         contrasena: "1234",
         email: "ddager@gmail.com",
         fecha: "13-04-97"
         ).save()
         def user3 = new Usuario(
         usuario: "ball",
         contrasena: "1234",
         email: "ball@gmail.com",
         fecha: "13-04-97"
         ).save()
   
    }
    def destroy = {
    }
}
