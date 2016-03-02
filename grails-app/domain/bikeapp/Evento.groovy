package bikeapp
import groovy.transform.ToString

@ToString
class Evento {

	static belongsTo = [ lider: Usuario, ruta : Ruta ]
	static hasMany = [ usuarios : Usuario ]
	
	String fecha
	String descripcion
	String lon
	String lat

    static constraints = {
    	lider(nullable:false)
    	ruta(nullable:true)
    	usuarios(nullable:true)
    	descripcion(nulalble:false)
    	lon(nullable:false)
    	lat(nullable:false)
    }
}
