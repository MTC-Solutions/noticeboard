package noticeboard

import noticeboard.auth.Role
import noticeboard.auth.User
import noticeboard.auth.UserRole

class BootStrap {

    def init = { servletContext ->
        def adminRole = Role.findOrSaveWhere(authority: IdentityService.ROLE_SUPER_ADMIN)
        def adminUser = User.findOrSaveWhere(username: "tumishomothobekhi@gmail.com", password: "password")

        if (!adminUser.authorities.contains(adminRole)){
            UserRole.create(adminUser, adminRole, true)
        }
    }
    def destroy = {
    }
}
