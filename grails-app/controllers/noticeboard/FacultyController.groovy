package noticeboard

import grails.plugin.springsecurity.annotation.Secured
import org.apache.poi.xssf.usermodel.XSSFSheet
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.springframework.web.multipart.MultipartFile

@Secured(["ROLE_SUPER_ADMIN", "ROLE_INSTITUTION_ADMIN"])
class FacultyController {

    ExcelService excelService

    static layout = "app"
    //index
    def index(Long id) {
        if (!Institution.get(id)) {
            return render("Institution not found")
        }

        return [institution: Institution.get(id)]
    }

    //create
    def create(Long id) {
        if (!Institution.get(id)) {
            return render("Institution not found")
        }

        return [institution: Institution.get(id)]
    }

    //save
    def save(Long id) {
        if (!Institution.get(id)) {
            flash.message = "You're trying to add a faculty to an institution that does not exist."
            return redirect(action: "profile")
        }

        def institution = Institution.get(id)
        def faculty = new Faculty(params)
        withForm {
            if (!faculty.hasErrors()) {
                institution.addToFaculties(faculty)
                if (institution.save(flush: true)) {
                    institution.save(flush: true)
                    flash.message = MessageService.createSuccess("${faculty.name}")
                    return redirect(action: "show", id: faculty.id)
                } else {
                    flash.error  = MessageService.failedToSave("Faculty")
                    return render(view: "create", model: [faculty: faculty, institution: institution])
                }
            } else {
                flash.error = MessageService.validationFailed()
                return render(view: "create", model: [faculty: faculty, institution: institution])
            }
        }.invalidToken {
            flash.error = MessageService.badRequest()
            return render(view: "create", model: [faculty: faculty, institution: institution])
        }
    }

    //show
    def show(Long id) {
        if (!Faculty.get(id)) {
            return render("Faculty not found")
        }

        def faculty = Faculty.get(id)
        def institution = faculty.institution

        return [faculty: faculty, institution:institution ]
    }

    def edit(Long id) {
        def faculty = Faculty.get(id)
        def institution = faculty.institution

        return [faculty: faculty, institution:institution ]
    }

    def update(Long id) {


        withForm{
            def faculty = Faculty.get(id)
            def institution = faculty.institution
            def newFaculty = new Faculty(params)
            if (!newFaculty.hasErrors()){
                faculty.name = newFaculty.name
                if (faculty.save(flush:true)){
                    faculty.save(flush:true)
                    flash.message = MessageService.createSuccess("Faculty")
                    return redirect(action: "show", id: id)
                }else{
                    flash.error = MessageService.failedToSave()
                    return render(view: "create", model: [faculty: faculty, institution:institution])
                }
            }else{
                flash.error = MessageService.validationFailed("Faculty")
                return render(view: "create", model: [faculty: faculty, institution:institution])
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    def delete(Long id) {
        if (!Faculty.get(id)){
            flash.error = MessageService.deleteNotFound("Faculty")
            return redirect(controller:"user",action: "profile")
        }
        def faculty = Faculty.get(id)
        withForm {

            if (faculty.delete(flush: true)){
                flash.message = MessageService.deleteSuccess("${faculty.name}")
                return redirect(action: "index", id: faculty.institution.id)
            }else{
                flash.message = MessageService.deleteSuccess("${faculty.name}")
                return redirect(action: "index", id: faculty.institution.id)
            }
        }.invalidToken {
            flash.error = MessageService.badRequest()
            return redirect(action: "index", id: faculty.institution.id)
        }

    }

    def upload(Long id) {
        if (!Institution.get(id)) {
            return render("Institution not found")
        }

        return [institution: Institution.get(id)]
    }

    def extract(Long id) {
        if (!Institution.get(id)) {
            return render("Institution not found")
        }

        def institution = Institution.get(id)


        withForm {
            def file = request.getFile("file")
            XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream())
            excelService.importFaculties(workbook, institution)

        }.invalidToken { render("You not press submit twice") }


        return redirect(action: "index", id: institution.id)
    }
}
