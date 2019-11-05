package noticeboard

import grails.plugin.springsecurity.annotation.Secured
import noticeboard.auth.Role
import noticeboard.auth.User
import noticeboard.auth.UserRole

@Secured(["ROLE_SUPER_ADMIN"])
class InstitutionAdminController {

    static layout = "app"

    def index(Long id) {
        if (!Institution.get(id)){
            return render("Institution not found")
        }
        return [institution:Institution.get(id)]
    }

    def create(Long id){

        if (!Institution.get(id)){
            return render("Institution not found")
        }
        return [institution:Institution.get(id)]
    }

    def save(Long id){
        withForm {
            if (!Institution.get(id)){
                return render("Institution not found")
            }

            def institution = Institution.get(id)
            def institutionAdmin = new InstitutionAdmin(params)

            if (institutionAdmin.validate()){
                institution.addToInstitutionAdmins(institutionAdmin)
                if (!User.findByUsername(institutionAdmin.email)){
                    if (institution.save(flush:true)){
                        flash.message = MessageService.createSuccess("Institution admin")
                        def userAdmin = User.findOrSaveWhere(username: institutionAdmin.email, password: "password")
                        def userRole  = Role.findOrSaveWhere(authority: IdentityService.ROLE_INSTITUTION_ADMIN)
                        if (!userAdmin.authorities.contains(userRole)){
                            UserRole.create(userAdmin,userRole,true)
                            return redirect(action: "index", id: id)
                        }else{
                            return ("Something went wrong")
                        }

                    }else{
                        flash.error = MessageService.failedToSave("Institution admin")
                        return render(view: "create", model: [institution: institution, institutionAdmin: institutionAdmin])
                    }
                }else {
                    flash.error = "A user with email '${institutionAdmin.email}' already exist. Please use another email."
                    return render(view: "create", model: [institution: institution, institutionAdmin: institutionAdmin])
                }

            }else {
                flash.error = MessageService.validationFailed()
                return render(view: "create", model: [institution: institution, institutionAdmin: institutionAdmin])
            }

        }.invalidToken {
            return render("Bad request")
        }
    }

    def show(Long id){
        if (!InstitutionAdmin.get(id)){
            return render("Institution admin not found")
        }
        return [institutionAdmin:InstitutionAdmin.get(id)]
    }

    def edit(Long id){
        if (!InstitutionAdmin.get(id)){
            return render("Institution admin not found")
        }
        return [institutionAdmin:InstitutionAdmin.get(id)]
    }

    def update(Long id){

        withForm {

            if (!InstitutionAdmin.get(id)){
                return render("Institution admin not found")
            }

            def institutionAdmin = InstitutionAdmin.get(id)
            def newInstitutionAdmin = new InstitutionAdmin(params)

            if (institutionAdmin.validate()){
                institutionAdmin.title = newInstitutionAdmin.title
                institutionAdmin.firstName = newInstitutionAdmin.firstName
                institutionAdmin.middleName = newInstitutionAdmin.middleName
                institutionAdmin.lastName = newInstitutionAdmin.lastName
                institutionAdmin.email = newInstitutionAdmin.email
                if (institutionAdmin.save(flush:true)){
                    flash.message = MessageService.updateSuccess("Institution admin")
                    return redirect(action: "show", id:id)
                }else{
                    flash.error = MessageService.failedToUpdate("Institution admin")
                    return render(view: "edit", model: [newInstitutionAdmin: newInstitutionAdmin])
                }
            }else {
                flash.error = MessageService.validationFailed()
                return render(view: "edit", model: [newInstitutionAdmin: newInstitutionAdmin])
            }

        }.invalidToken {
            return render("Bad request")
        }


    }

    def delete(Long id){
        withForm{
            if (!InstitutionAdmin.get(id)){
                return render("Institution admin not found")
            }
            def institutionAdmin = InstitutionAdmin.get(id)
            if (User.findByUsername(institutionAdmin.email)){
                def user = User.findByUsername(institutionAdmin.email)
                UserRole.remove(user,Role.findByAuthority(IdentityService.ROLE_INSTITUTION_ADMIN))
                user.delete(flush: true)
            }
            institutionAdmin.delete(flush:true)
            flash.message = MessageService.deleteSuccess("Institution admin ${institutionAdmin.lastName}")
            return redirect(action: "index", id:institutionAdmin.institution.id)
        }.invalidToken {
            return render("Bad request")
        }
    }
}
