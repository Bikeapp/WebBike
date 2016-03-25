package bikeapp
import groovy.transform.ToString

@ToString
class Usuario {


      //SE CAMBIA LA RELACION YA NO VOY A USAR LA RELACION MUCHOS A MUCHOS DE GRAILS
      //QUE NO ME PREGUNTAN PERO ES DEL ASCO, NO ME QUISO TRABAJAR BIEN, CUANDO NO ERA UNA COSA ERA LA OTRA Y AL FINAL 
      //NO DEJO GUARDAR EN LA BASE DE DATOS
      //VER LA 'TABLA' INTERMEDIA 'UsuarioGrupo'
	static hasMany = [puntos: PuntoInteres, fotos: Foto,comentarios:Comentario,grupos:Grupo]

	String usuario		//Nombre de usuario para login
	String email		//Email del usuario
	String contrasena	//Contraseña para login
	String fecha		//Fecha nacimiento
	String interes		//Lista de intereses
	String nombre		//Nombre real del usuario
	String sexo			//Sexo del usuario
	String foto			//Foto de perfil
	String mensaje		//Mensaje dinstintivo del usuario
	String rol			// ???? No se para que lo usamos la verdad....
    static constraints = {
    	usuario(nullable:false,unique:true)
    	email(nullable:false, email:true,unique:true)
    	contrasena(nullable:false)
    	fecha(nullable:false)
    	interes(nullable:true)
    	puntos(nullable:true)
		nombre(nullable:true)
		sexo(nullable:true)
		foto(nullable:true)
		mensaje(nullable:true)
		rol(nullable:true)

    }

}
