package noticeboard

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_ADMIN", "ROLE_SUPER_ADMIN", "ROLE_INSTITUTION_ADMIN"])
class InstitutionController {
    static layout = "app"
    //index

    def index() {
        def institutions = Institution.listOrderByName(order: "asc")
        return [institutions:institutions]
    }

    //create
    @Secured(["ROLE_ADMIN", "ROLE_SUPER_ADMIN"])
    def create(){}

    //save
    @Secured(["ROLE_ADMIN", "ROLE_SUPER_ADMIN"])
    def save(){

        //make sure no double form submission
        withForm {
            def institution = new Institution(params)
            if(institution.validate()){
                if (institution.save()){
                    institution.save()
                    flash.message = institution.name + " was saved successfully"
                    return redirect([action:"show", id:institution.id])
                }else{
                    flash.message = "Something went wrong, " +institution.name+ " wasn't saved successfully. Please try again"
                    return render(view:"create", model: [institution: institution])
                }
            }else{
                return render(view:"create", model: [institution: institution])
            }

        }.invalidToken{
           return render("Bad request,you might have clicked the form twice return and try again")
        }
    }

    //show
    @Secured(["ROLE_ADMIN", "ROLE_SUPER_ADMIN"])
    def show(Long id){
        if(!Institution.get(id)){
            return render("Institution not found")
        }

        def institution = Institution.get(id)

        return [institution:institution]
    }

    //edit
    @Secured(["ROLE_ADMIN", "ROLE_SUPER_ADMIN"])
    def edit(Long id){
        def institution = Institution.get(id)
        return [institution: institution]
    }

    //update
    @Secured(["ROLE_ADMIN", "ROLE_SUPER_ADMIN"])
    def update(Long id){
        def newInstitution = new Institution(params)
        if (!Institution.get(id)){
            return render("Institution not found")
        }
        def institution = Institution.get(id)

        withForm {
            if (newInstitution.validate()){
                institution.name = newInstitution.name
                institution.country = newInstitution.country
                institution.city = newInstitution.city
                institution.address = newInstitution.address
                institution.postalCode = newInstitution.postalCode
                institution.email = institution.email
                institution.phoneNumber = institution.phoneNumber
                if (institution.save(flush:true)){
                    institution.save(flush:true)
                    flash.success = institution.name + " was updated successfully"
                    return redirect(action: "show", id: id)
                }else{
                    flash.error = "Something went wrong, " +institution.name+ " wasn't saved successfully"
                }
            }else {
                return render(view: "edit", model: [institution: newInstitution])
            }
        }.invalidToken {
            return render("Bad request,you might have clicked the form twice return and try again")
        }
    }

    //delete
    @Secured(["ROLE_ADMIN", "ROLE_SUPER_ADMIN"])
    def delete(Long id){
        if (!Institution.get(id)){
            return render("Institution not found")
        }
        def institution = Institution.get(id)
        withForm {
            if (institution.delete(flush:true)){
                institution.delete(flush:true)
                flash.success = institution.name + " was deleted successfully"
            }else{
                flash.error = "Something went wrong, " +institution.name+ " wasn't deleted successfully"
            }
        }.invalidToken {
            return render("Bad request,you might have clicked the form twice return and try again")
        }
        return redirect([action:"index"])
    }

}
