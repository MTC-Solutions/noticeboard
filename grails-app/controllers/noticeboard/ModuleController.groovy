package noticeboard

import grails.plugin.springsecurity.annotation.Secured
import org.apache.poi.xssf.usermodel.XSSFWorkbook
import org.springframework.dao.DataIntegrityViolationException

@Secured(["ROLE_SUPER_ADMIN", "ROLE_INSTITUTION_ADMIN"])
class ModuleController {

    ExcelService excelService
    static layout = "app"

    //read all modules in a course
    def index(Long id) {
        if (!Course.get(id)) {
            return render("Course not found")
        }
        def course = Course.get(id)
        def institution = course.faculty.institution
        return [course: course, institution:institution]
    }

    //call a view to create a module
    def create(Long id) {
        if (!Course.get(id)) {
            return render("Course not found")
        }

        def course = Course.get(id)
        def institution = course.faculty.institution
        return [course: course, institution:institution]
    }

    //save a module into a course
    def save(Long id) {

        withForm {
            if (!Course.get(id)) {
                return render("Course not found")
            }
            def course = Course.get(id)
            def module = new Module(params)
            if (module.validate()) {
                course.addToModules(module)
                if (course.save(flush:true)){
                    flash.message = MessageService.createSuccess("The module ${module.code}")
                    return redirect(action: "show", id: module.id)
                }else {
                    flash.error = MessageService.failedToSave("Module")
                    return render(view: "create", model: [module: module, course: course, institution:  course.faculty.institution])
                }
            } else {
                flash.error = MessageService.validationFailed()
                return render(view: "create", model: [module: module, course: course, institution:  course.faculty.institution])
            }
        }.invalidToken {
            return render("Bad request")
        }


    }

    //show module(call an show view)
    def show(Long id) {
        if (!Module.get(id)) {
            return render("Module not found")
        }

        def module = Module.get(id)
        def institution = module.course.faculty.institution
        return [module: module, institution:institution]

    }

    //edit module(call an edit view)
    def edit(Long id) {
        def module = Module.get(id)
        def institution = module.course.faculty.institution
        return [module: module, institution:institution]
    }

    //update module
    def update(Long id) {
        def module = Module.get(id)
        def newModule = new Module(params)

        withForm{
            if (newModule.validate()){
                module.name = newModule.name
                module.code = newModule.code
                if (module.save(flush:true)){
                    flash.message = MessageService.updateSuccess("Module")
                    return redirect(action:"show", id:id)
                }else{
                    flash.error = MessageService.failedToUpdate("Module")
                    return  render(view: "edit",model: [newModule: newModule,module: module, institution:  module.course.faculty.institution])
                }
            }else {
                flash.error = MessageService.validationFailed()
                return  render(view: "edit",model: [newModule: newModule, module: module, institution:  module.course.faculty.institution])
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    //delete module
    def delete(Long id) {
        if (!Module.get(id)){
            flash.error = MessageService.deleteNotFound("Module")
            return redirect( controller:"user",action: "profile")
        }
        def module = Module.get(id)
        withForm{
                module.delete(flush: true)
                flash.message = MessageService.deleteSuccess("${module.code}")
                return redirect(action: "index", id: module.course.id)
        }.invalidToken {
            return render("bad request")
        }

    }

    //call a view to upload modules
    def upload(Long id) {
        if (!Course.get(id)) {
            return render("Faculty not found")
        }
        def course = Course.get(id)
        def institution = course.faculty.institution
        return [course: course, institution:institution]
    }

    //upload module from excel
    def extract(Long id) {
        if (!Course.get(id)) {
            return render("Course not found")
        }
        def course = Course.get(id)
        withForm {
            def file = request.getFile("file")
            XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream())
            excelService.importModules(workbook, course)
        }.invalidToken { render("Bad request, you can't submit the form twice") }

        return redirect(action: "index", id: course.id)
    }

}
