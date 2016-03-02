package bikeapp
import groovy.transform.ToString

@ToString
class Usuario {

<<<<<<< HEAD
	static hasMany = [puntos: PuntoInteres]

	String usuario
	String email
	String contraseña
	String fecha

    static constraints = {
=======
	static hasMany = [puntos: PuntoInteres, fotos: Foto]

	String usuario		//Nombre de usuario para login
	String email		//Email del usuario
	String contraseña	//Contraseña para login
	String fecha		//Fecha nacimiento
	String interes		//Lista de intereses
	String nombre		//Nombre real del usuario
	String sexo			//Sexo del usuario
	String foto			//Foto de perfil
	String mensaje		//Mensaje dinstintivo del usuario
	String rol			// ???? No se para que lo usamos la verdad....
    static constraints = {
    	usuario(nullable:false)
    	email(nullable:false)
    	contraseña(nullable:false)
    	fecha(nullable:false)
    	interes(nullable:false)
>>>>>>> modelo
    }
}
