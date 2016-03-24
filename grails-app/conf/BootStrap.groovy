import bikeapp.*

class BootStrap {

    def init = { servletContext ->

         def user = new Usuario(
         usuario: "cigarcial",
         contrasena: "1234",
         email: "unzero@gmail.com",
         fecha: "13-04-97"
         ).save()
    }
    def destroy = {
    }
}
