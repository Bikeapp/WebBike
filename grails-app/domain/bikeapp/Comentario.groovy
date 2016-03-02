package bikeapp
import groovy.transform.ToString

@ToString
class Comentario {

	static belongsTo = [ ruta: Ruta ]
	
	String contenido
	String fecha

    static constraints = {
    	contenido(nullable:false)
    	fecha(nullable:false)
    }
}
