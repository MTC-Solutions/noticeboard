package noticeboard

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(controller: "home", action: "index")
        "/user/forgot/password"(controller: "home", action: "forgotPassword")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
