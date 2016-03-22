package bikeapp
import groovy.transform.ToString

@ToString
class Usuario {

	static hasMany = [puntos: PuntoInteres, fotos: Foto,comentarios:Comentario,grupos:Grupo]

	String usuario		//Nombre de usuario para login
	String email		//Email del usuario
	String contrasena	//Contraseña para login
	String fecha		//Fecha nacimiento
	String interes		//Lista de intereses
	String nombre		//Nombre real del usuario
	String sexo			//Sexo del usuario
	String foto			//Foto de perfil
	String mensaje		//Mensaje dinstintivo del usuario
	String rol			// ???? No se para que lo usamos la verdad....
    static constraints = {
    	usuario(nullable:false)
    	email(nullable:false, email:true)
    	contrasena(nullable:false)
    	fecha(nullable:false)
    	interes(nullable:true)
    	puntos(nullable:true)
		nombre(nullable:true)
		sexo(nullable:true)
		foto(nullable:true)
		mensaje(nullable:true)
		rol(nullable:true)

    }
}
