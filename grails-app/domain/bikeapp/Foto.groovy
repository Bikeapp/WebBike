package bikeapp
import groovy.transform.ToString

@ToString
class Foto {

	static belongsTo = [ usuario: Usuario ]
	static hasMany = [ comentarios : Comentario ]
	
	String fecha
	String lat
	String lon

    static constraints = {
    	usuario(nullable:false)
    	comentarios(nullable:true)
    	fecha(nullable:false)
    	lat(nullable:true)
    	lon(nullable:true)
    }
}
