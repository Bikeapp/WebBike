package bikeapp

//LO TUVE QUE BORRAR TODO, NO SE QUE ESTABA GENERANDO CONFLICTO Y ME DIO PEREZA PONER A MIRAR UNO POR UNO, LO CIERTO ES QUE EL LOGIN
//Y EL LOGOUT LO VA A MANEJAR SPRING DE AHORA EN ADELANTE, SERIA RE ESCRIBIR EL REGISTRO, SIN EMBARGO ES SOLO AJUSTAR PARA QUE LO HAGA.:

//EN ESTA CLASE PROCURAR NO PONER NADA DADO QUE ES UN CONTROLADOR QUE ES DE TIPO PUBLICO
class UsuarioController {

   def sesionService
  
    def registro() {
        
        def users = new Usuario(params)
        users.save(failOnError: true)
		def roleUser = SecRole.findByAuthority('ROLE_USUARIO')
		SecUsuarioSecRole.create users,roleUser  
		
    }
	
}
