package bikeapp

class UsuarioController {

    def index() {
    }
    
    def registro() {
    	render(params)
    	def users = new Usuario(params)
    	users.save(failOnError: true)
    	render (view:"registro", model: [userList:Usuario.list()])
    }
}
