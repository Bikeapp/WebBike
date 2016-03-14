package bikeapp

import grails.converters.JSON

class MapaController {

	def puntoInteresService
	def parcheService

    def index() { 
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
    
    def registrarPuntoTest() {
    	puntoInteresService.agregarPuntoAJAX(params.nombre, params.lat, params.lon, params.tipo, params.descripcion, params.usuario, params.ruta)
    	render "Hello"
    }
    
    def parche() {
    	parcheService.crearParche(params)
    	render(view: 'index',model: [parches : Parche.list(), usuarios : Usuario.list(),puntos : PuntoInteres.list()])
    }
}
