package bikeapp

class UsuarioController {

    def index() {
    }
    
    def registro() {
    	render(params)
    	params.put('interes',"")

    	params.dump();
    	def users = new Usuario(params)
    	users.save(failOnError: true)
    	render (view:"registro", model: [userList:Usuario.list()])
    }
}
