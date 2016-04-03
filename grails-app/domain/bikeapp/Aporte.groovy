package bikeapp
import groovy.transform.ToString

@ToString
class Aporte {

	 
	static belongsTo = [ grupo: Grupo, usuario:Usuario ]

	String contenido
	String fecha = new Date()

    static constraints = {
    	grupo(nullable:false)
    	usuario(nullable:false)
    	contenido(nullable:false)
    	fecha(nullable:false)
    }
}
