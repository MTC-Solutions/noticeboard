package noticeboard

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_SUPER_ADMIN"])
class InstitutionSuperAdminController {

    static layout = "app"
    def index(Long id) {
        if (!Institution.get(id)){
            return render("Institution not found")
        }
        [institution:Institution.get(id)]
    }

    def create(Long id){

        if (!Institution.get(id)){
            return render("Institution not found")
        }
        return [institution:Institution.get(id)]
    }

    def save(Long id){

        if (!Institution.get(id)){
            return render("Institution not found")
        }

        def institution = Institution.get(id)

        //avoid CRSF
        withForm {

            def institutionSuperAdmin = new InstitutionSuperAdmin(params)
            //checking if form has errors
            if (!institutionSuperAdmin.validate()){
                return render(view: "create", model: [institutionSuperAdmin: institutionSuperAdmin, institution: institution])

            }else {
                institution.addToInstitutionSuperAdmins(institutionSuperAdmin)
                institutionSuperAdmin.save()
                return render("errors")
            }//end checking if form has errors

        }.invalidToken {
            return render("Invalid request")
        }
    }

    def show(Long id){
        if (!InstitutionSuperAdmin.get(id)){
            return render("Institution super admin not found")
        }
        return [institutionSuperAdmin:InstitutionSuperAdmin.get(id)]
    }

    def edit(Long id){
        if (!InstitutionSuperAdmin.get(id)){
            return render("Institution super admin not found")
        }
        [institutionSuperAdmin:InstitutionSuperAdmin.get(id)]
    }

    def update(Long id){
        if (!InstitutionSuperAdmin.get(id)){
            return render("Institution super admin not found")
        }
        def institutionSuperAdmin = InstitutionSuperAdmin.get(id)
        def newInstitutionSuperAdmin = new InstitutionSuperAdmin(params)

        institutionSuperAdmin.title = newInstitutionSuperAdmin.title
        institutionSuperAdmin.firstName = newInstitutionSuperAdmin.firstName
        institutionSuperAdmin.middleName = newInstitutionSuperAdmin.middleName
        institutionSuperAdmin.lastName = newInstitutionSuperAdmin.lastName
        institutionSuperAdmin.email = newInstitutionSuperAdmin.email

        institutionSuperAdmin.save(flush:true)

        return redirect(action: "show", id:id)
    }

    def delete(Long id){

        if (!InstitutionSuperAdmin.get(id)){
            return render("Institution super admin not found")
        }
        def institutionSuperAdmin = InstitutionSuperAdmin.get(id)

        institutionSuperAdmin.save(flush:true)
        return redirect(action: "index", id:institutionSuperAdmin.institution.id)
    }
}
