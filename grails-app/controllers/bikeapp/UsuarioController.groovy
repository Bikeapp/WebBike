package bikeapp

class UsuarioController {

     def index() {
    }
    
    def registro() {
        render(params)
        session['user']=params.usuario
        def users = new Usuario(params)
        users.save(failOnError: true)
        session['id']=users.id
        render (view:"registro", model: [userList:Usuario.list()])
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
}
