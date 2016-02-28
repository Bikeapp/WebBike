package bikeapp

class Parche {

	static hasMany = [ usuarios : Usuario , wayPoints: PuntoInteres]
	
	String nombre
	Usuario lider
	String descripcion
	String lat
	String lon

    static constraints = {
    	usuarios(nullable:false)
    }
}
