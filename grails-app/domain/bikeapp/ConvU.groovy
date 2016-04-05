package bikeapp
import groovy.transform.ToString

@ToString
class ConvU {

	Usuario u1
	Usuario u2

    static constraints = {
    	u1(nullable:false)
    	u2(nullable:false)
    }
}
