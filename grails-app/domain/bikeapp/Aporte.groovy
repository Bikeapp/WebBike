package bikeapp
import groovy.transform.ToString

@ToString
class Aporte {

	 
	static belongsTo = [ grupo: Grupo, usuario:Usuario ]

	String contenido
      //esto debe ser de tipo fecha
	String fecha = new Date()

    static constraints = {
    	grupo(nullable:false)
    	usuario(nullable:false)
    	contenido(nullable:false)
    	fecha(nullable:false)
    }
}
