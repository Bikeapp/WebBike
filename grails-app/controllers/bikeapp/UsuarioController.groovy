package bikeapp

class UsuarioController {

     def index() {
    }
    
    def registro() {      
        def users = new Usuario(params)
        users.save(failOnError: true)
        session['id']=users.id
        redirect(uri:'/')
    }

    def intereses(){
        

        def user= Usuario.get(session['id']) 

        String s="['"

        for(item in params.interes){
            s+=item
            s+="','"
        }

        s=s.substring(0,s.length()-2)

        s+="']"

        user.interes=s
        user.save() 

        render(user)
        
    }
	
	def login(){
		
		if (request.method == 'POST'){
			def u = Usuario.findByEmailAndContrasena(params.email,params.contrasena)
			if (u){
				flash.message = "Usuario hola"
				session.user = u
				redirect(uri:'/')
			}else{
				flash.message = "Usuario no encontrado"
				redirect(uri:'/')
			}
		}else if (session.user) {
            // usuario ya encontrado
            redirect(uri:'/')
        }
    }
 
    def logout() {
        session.invalidate()
        redirect(uri:'/')
    }
	
}
