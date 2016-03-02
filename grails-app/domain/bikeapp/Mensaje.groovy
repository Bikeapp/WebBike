package bikeapp
import groovy.transform.ToString

@ToString
class Mensaje {

	static hasMany = [ usuarios : Usuario]
	
	String contenido
	String fecha

    static constraints = {
    	contenido(nullable:false)
    	fecha(nullable:false)
    }
}
