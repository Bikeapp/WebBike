package bikeapp
import groovy.transform.ToString

//SE REALIZAN DOS CAMBIOS IMPORTANTES EN ESTA CLASE
// LA PRIMERA ES FIJARSE QUE AHORA ESTA CLASE HEREDA DE LA CLASE SECUSUARIO, LA CUAL 
//ES LA CLASE QUE SPRING UTILIZA PARA MANEJAR LOS USUARIOS, SI CONSULTAN LA BASE DE DATOS SE DARAN CUENTA 
//QUE CUANDO SE CREA UN USUARIO ESTA CREACION SE VE REFLEJADA SOBRE LA CLASE SECUSUARIO
//LA SEGUNDA ES LA ELIMINACION DEL CAMPO usuario Y contrasena ESTOS CAMPOS AHORA SE LLAMAN 
// username Y password LOS CUALES VIVEN EN LA CLASE SECUSUARIO, ESTO SE DEBE A QUE AHORA ESTOS CAMPOS VAN A SERVIR COMO PUNTO DE AUTENTICACION
//ADEMAS QUE SPRING UTILIZA CIERTOS ALGORITMOS PARA CIFRAR Y MANEJAR ASUNTOS DE CLAVES
@ToString
class Usuario extends SecUsuario{

	static hasMany = [puntos: PuntoInteres, fotos: Foto,comentarios:Comentario,grupos:Grupo]

	String email		//Email del usuario
	String fecha		//Fecha nacimiento
	String interes		//Lista de intereses
	String nombre		//Nombre real del usuario
	String sexo			//Sexo del usuario
	String foto			//Foto de perfil
	String mensaje		//Mensaje dinstintivo del usuario
	String rol			// ???? No se para que lo usamos la verdad....
    static constraints = {
    	email(nullable:false, email:true)
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
