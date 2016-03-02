package bikeapp
import groovy.transform.ToString

@ToString
class Parche {

	static hasMany = [ usuarios : Usuario , comentarios: Comentario]
	
	String nombre
	Usuario lider
	String descripcion

    static constraints = {
    	usuarios(nullable:true)
    	comentarios(nullable:true)
    }
}
