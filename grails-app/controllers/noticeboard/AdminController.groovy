package noticeboard

import grails.plugin.springsecurity.annotation.Secured
import noticeboard.auth.Role
import noticeboard.auth.User
import noticeboard.auth.UserRole

@Secured(["ROLE_SUPER_ADMIN"])
class AdminController {
    static layout = "app"

    //read or create
    def index() {
        def admins = Admin.listOrderByDateCreated(order: "desc")
        [admins:admins]
    }

    //create
    def create(){}

    //save
    def save(){
        def admin = new Admin(params)

        def adminRole = Role.findOrSaveWhere(authority: IdentityService.ROLE_ADMIN)
        def adminUser = User.findOrSaveWhere(username: admin.email, password:  "password")

        if(!admin.save()){
            return render("coudn't save admin")
        }

        if (!adminUser.authorities.contains(adminRole)){
            UserRole.create(adminUser, adminRole, true)
        }

        admin.save()

        redirect([action: "show", id:admin.id])
    }

    //show
    def show(Long id){
        [admin: Admin.get(id)]
    }

    //edit
    def edit(Long id){
        [admin: Admin.get(id)]
    }

    //delete
    def update(Long id){
         if (!Admin.get(id)){
             return render("Admin not found")
         }

        def admin = Admin.get(id)
        def newAdmin = new Admin(params)

        admin.title = newAdmin.title
        admin.firstName = newAdmin.firstName
        admin.middleName = newAdmin.middleName
        admin.lastName = newAdmin.lastName
        admin.email = newAdmin.email

        admin.save(flush:true)

        return redirect([action: "show", id:id])
    }

    //delete
    def delete(Long id){
        if (!Admin.get(id)){
            return render("Admin not found")
        }

        def admin = Admin.get(id)

        admin.delete(flush: true)
        return redirect([action: "index"])
    }

}
