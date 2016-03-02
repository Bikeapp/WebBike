package bikeapp
import groovy.transform.ToString

@ToString
class Parche {

	static hasMany = [ usuarios : Usuario , comentarios: Comentario]
	static belongsTo = [ lider : Usuario ]
	
	String nombre
	String descripcion

    static constraints = {
    	usuarios(nullable:true)
    	comentarios(nullable:true)
    }
}
