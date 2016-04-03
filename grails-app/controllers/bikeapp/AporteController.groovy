package bikeapp
import grails.plugin.springsecurity.annotation.Secured;

@Secured(['ROLE_USUARIO'])
class AporteController {

	def sesionService

	def save(){		

	    params.usuario=sesionService.usuarioEnSesion() 	
	    params.fecha=new Date()  	         
	    def aporte= new Aporte(params)	    
	 	aporte.save(flush: true)
	    render(template: 'aporte', model:[aportes: grupo.aportes])

   }

   
}