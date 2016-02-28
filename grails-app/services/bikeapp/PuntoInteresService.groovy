package bikeapp
import groovy.json.*

import grails.transaction.Transactional
import grails.converters.XML

@Transactional
class PuntoInteresService {

    def serviceMethod() {

    }
    
    def agregarPunto(params) {
    	Usuario test = Usuario.get(params.dueño)
    	PuntoInteres local = new PuntoInteres(lat:params.lat,lon:params.lon,nombre:params.nombre,descripcion:params.descripcion,calificacion:"N/A",tipo:params.tipo,usuario:test)
    	local.save(failOnError: true)
    }
}
