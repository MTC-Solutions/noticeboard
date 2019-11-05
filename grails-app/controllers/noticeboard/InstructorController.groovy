package noticeboard

import grails.plugin.springsecurity.annotation.Secured
import noticeboard.auth.Role
import noticeboard.auth.User
import noticeboard.auth.UserRole
import org.apache.poi.xssf.usermodel.XSSFWorkbook


@Secured(["ROLE_SUPER_ADMIN", "ROLE_INSTITUTION_ADMIN"])
class InstructorController {
    def springSecurityService
    def excelService
    static layout = "app"
    //read or index
    def index(Long id) {
        if (!Institution.get(id)){
            return render("Institution not found")
        }
        [institution:Institution.get(id)]
    }

    //create
    def create(Long id){
        if (!Institution.get(id)){
            return render("Institution not found")
        }
        return [institution:Institution.get(id)]
    }

    //save
    def save(Long id){
        withForm{
            if (!Institution.get(id)){
                return render("Institution not found")
            }
            def institution = Institution.get(id)
            def instructor  = new Instructor(params)

            if (instructor.validate()){
                if (User.findByUsername(instructor.email)){
                    flash.error = "User with the following email address: " + instructor.email + " already exist" +
                            ", to avoid conflict the instructor wasn't created successfully." + " Use a different email address."
                    return render(view: "create", model: [instructor: instructor, institution: institution])
                }else{
                    institution.addToInstructors(instructor)
                    if (institution.save(flush:true)){
                        def instructorRole = Role.findOrSaveWhere(authority: "ROLE_INSTRUCTOR")
                        def instructorUser = User.findOrSaveWhere(username: instructor.email, password: "password")

                        if (!instructorUser.authorities.contains(instructorRole)){
                            UserRole.create(instructorUser,instructorRole,true)
                        }
                        flash.message = "The instructor was added successfully, He or she can check their email for login instruction"
                        return redirect(action:"show", id:instructor.id)
                    }else {
                        flash.error = MessageService.failedToSave("Student")
                        return render(view: "create", model: [instructor: instructor, institution: institution])
                    }
                }
            }else{
                flash.error = MessageService.validationFailed()
                return render(view: "create", model: [instructor: instructor, institution: institution])
            }

        }.invalidToken {
            return render("Bad request")
        }
    }

    //show
    def show(Long id){
        if (!Instructor.get(id)){
            return render("Instructor not found")
        }
        def instructor = Instructor.get(id)
        def institution = instructor.institution
        return [instructor:instructor, institution: institution]
    }

    //edit
    def edit(Long id){
        if (!Instructor.get(id)){
            return render("Instructor not found")
        }
        def instructor = Instructor.get(id)
        def institution = instructor.institution
        return [instructor:instructor, institution: institution]
    }

    //update
    def update(Long id){

        withForm {
            if (!Instructor.get(id)){
                return render("Instructor not found")
            }
            def newInstructor = new Instructor(params)
            def instructor = Instructor.get(id)
            if (!newInstructor.validate()) {
                    instructor.title = newInstructor.title
                    instructor.firstName = newInstructor.firstName
                    instructor.middleName = newInstructor.middleName
                    instructor.lastName = newInstructor.lastName
                    if (instructor.save(flush: true)) {
                        flash.message = MessageService.updateSuccess("Instructor")
                        return redirect(action: "show", id: instructor.id)
                    } else {
                        flash.error = MessageService.failedToUpdate("Instructor")
                        return render(view: "edit", model: [instructor: instructor, newInstructor: newInstructor, institution: instructor.institution])
                    }

            } else {
                flash.error = MessageService.validationFailed()
                return render(view: "edit", model: [instructor: instructor, newInstructor: newInstructor, institution: instructor.institution])
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    //delete
    def delete(Long id){
        withForm{
            def instructor = Instructor.get(id)
            if (User.findByUsername(instructor.email)){
                def user = User.findByUsername(instructor.email)
                UserRole.remove(user, Role.findByAuthority(IdentityService.ROLE_INSTRUCTOR))
                user.delete(flush: true)
            }
            instructor.delete(flush: true)
            flash.message = MessageService.deleteSuccess("Instructor")
            return redirect(action:"index", id: instructor.institution.id)
        }.invalidToken {
            return render("Bad rerquest")
        }
    }

    def upload(Long id){
        if (!Institution.get(id)){
            return redirect(controller:"user", action: "profile")
        }
        def institution = Institution.get(id)
        [institution: institution]
    }

    def extract(Long id) {

        withForm {
            if (!Institution.get(id)) {
                return render("Faculty not found")
            }
            def institution = Institution.get(id)

            def file = request.getFile("file")
            XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream())
            excelService.importInstructorsToInstitution(workbook, institution)
            flash.message = "Instructors uploaded successfully"
            return redirect(action: "index", id: institution.id)
        }.invalidToken {
            return render("Bad request, you can't submit the form twice")
        }
    }

    //profile
    @Secured(["ROLE_INSTRUCTOR"])
    def profile(){
        User user = authenticatedUser()
        if (!Instructor.findByEmail(user.username)){
            return render("User not found")
        }
        return [instructor: Instructor.findByEmail(user.username)]
    }

    //get logged in user
    private authenticatedUser(){
        if (springSecurityService.isLoggedIn()){
            def user = springSecurityService.getCurrentUser()
            return user
        }
    }
}
