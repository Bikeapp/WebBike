class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "400"(view:'/accesoDenegado') 
        "/logoutexit"(view:'j_spring_security_logout')
	}
}
