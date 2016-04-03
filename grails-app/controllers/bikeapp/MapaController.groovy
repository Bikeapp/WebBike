package bikeapp

import grails.converters.JSON
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_USUARIO'])
class MapaController {

	def puntoInteresService
	def parcheService

    def index() { 
    	//Envía al cliente una lista de los puntos, usuarios y parches. Para utilizarlos en el FrontEnd.
		[puntos : PuntoInteres.list(), usuarios : Usuario.list(), parches: Parche.list()]
    }
    
    def registrar() {
    	puntoInteresService.agregarPunto(params)
    	render(view: 'index',model: [puntos : PuntoInteres.list(), usuarios : Usuario.list(),parches : Parche.list()])
    }
    
    def registrarPunto() {
    	def jsonObj = request.JSON
    	//puntoInteresService.agregarPuntoAJAX(params.nombre, params.lat, params.lon, params.tipo, params.descripcion, params.usuario, params.ruta)
    	//[puntos : PuntoInteres.list(), usuarios : Usuario.list(),parches : Parche.list()]
    }
    
    //Controlador que recibe la llamada AJAX.
    def registrarPuntoTest() {
    	//Utiliza los parametros de la llamada AJAX y el servicio de PuntoInteres para crear un nuevo punto en la BD.
    	puntoInteresService.agregarPuntoAJAX(params.nombre, params.lat, params.lon, params.tipo, params.descripcion, params.usuario, params.ruta)
    	render "Hello"
    }
    
    def parche() {
    	parcheService.crearParche(params)
    	render(view: 'index',model: [parches : Parche.list(), usuarios : Usuario.list(),puntos : PuntoInteres.list()])
    }
}
