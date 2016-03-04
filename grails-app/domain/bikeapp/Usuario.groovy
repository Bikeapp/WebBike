package bikeapp
import groovy.transform.ToString

@ToString
class Usuario {

	static hasMany = [puntos: PuntoInteres]

	String usuario
	String email
	String contrasena
	String fecha

    static constraints = {
    }
}
