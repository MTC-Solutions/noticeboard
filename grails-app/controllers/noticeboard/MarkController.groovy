package noticeboard

import grails.plugin.springsecurity.annotation.Secured
import noticeboard.auth.User
import org.apache.poi.xssf.usermodel.XSSFWorkbook


@Secured("permitAll")
class MarkController {

    def springSecurityService
    ExcelService excelService
    static layout = "app"

    @Secured(["ROLE_STUDENT"])
    def student(Long id){
        if (!Group.get(id)){
            return render("Group not found")
        }

        User user = springSecurityService.getCurrentUser()

        def group = Group.get(id)

        def student = Student.findByEmail(user.username)

        def marks = Mark.findAllByMarkStudentNumber(student.studentNumber)
        return [marks: marks, group: group]
    }

    //read or index
    def index(Long id) {

        if (!Module.get(id)){
            return render("Module not found")
        }
        def module = Module.get(id)
        def works = Work.findAllByWorkModuleCode(module.code)


        return [module:module, works:works, marks:studentMarks(id)]
    }

    //create
    def create(Long id){
        if (!Work.get(id)){
            return render("Module not found")
        }
        def work = Work.get(id)

        return [group:work.group, work: work]
    }

    //save
    def save(Long id){
        if (!Work.get(id)){
            return render("Work not found")
        }

        def mark = new Mark(params)
        def work = Work.get(id)
        withForm {
            if (mark.validate()){
                if (work.group.students.contains(Student.findByStudentNumber(mark.markStudentNumber))){
                    if(!work.marks.contains(Mark.findByMarkStudentNumber(mark.markStudentNumber))){
                        work.addToMarks(mark)
                        if (work.save(flush:true)){
                            flash.message = MessageService.createSuccess("Mark")
                            return redirect(controller:"work", action: "show", id: id)
                        }else {
                            flash.error = MessageService.failedToSave("Mark")
                            return render(view: "create", model: [mark:mark, group: work.group, work: work])
                        }
                    }else {
                        flash.error = "The student number: '${mark.markStudentNumber}' has marks allocated already."
                        return render(view: "create", model: [mark:mark, group: work.group, work: work])
                    }

                }else {
                    flash.error = "The student you're trying to add marks for is not part of the module ${work.group.name}." +
                    " suggestions:\n 1. Check if the student number is correct\n" +
                            "2. Add the student to the module first"
                    return render(view: "create", model: [mark:mark, group: work.group, work: work])
                }
            }else {
                flash.error = MessageService.validationFailed()
                return render(view: "create", model: [mark:mark, group: work.group])
            }

        }.invalidToken {
            return render("Bad request")
        }
    }

    //show
    def show(Long id){
        if (!Work.get(id)){
            return render("Work not found")
        }

        def work = Work.get(id)
        def module = Module.findByCode(work.workModuleCode)
        return [work:work, module: module]
    }

    //edit
    def edit(Long id){
        if (!Mark.get(id)){
           return render("Mark not found")
        }

        return [mark: Mark.get(id), module: Mark.get(id).work.group, work: Mark.get(id).work]
    }

    //update
    def update(Long id){
        if (!Mark.get(id)){
          return render("Mark not found")
        }
        withForm {
            def mark = Mark.get(id)
            def work = mark.work
            def newMark = new Mark(params)
            if (newMark.validate()){
                if (work.group.students.contains(Student.findByStudentNumber(newMark.markStudentNumber))){
                        if (newMark.achievedMark.toInteger() <= work.totalMark.toInteger()){
                            mark.markStudentNumber = newMark.markStudentNumber
                            mark.achievedMark = newMark.achievedMark
                            mark.progress = newMark.progress
                            if (mark.save(flush:true)){
                                flash.message = MessageService.updateSuccess("Mark")
                                return redirect(controller:"work", action: "show", id: mark.work.id)
                            }else{
                                flash.message = MessageService.failedToUpdate("Mark")
                                return render(view: "edit", model: [mark:mark, group: work.group, work: work, newMark:newMark])
                            }
                        }else{
                            flash.error = "The achieved mark ${newMark.achievedMark} can not be greater than ${work.totalMark}" +
                                    " which is the total mark."
                            return render(view: "edit", model: [mark:mark, module: work.group, work: work, newMark:newMark])
                        }

                }else{
                    flash.error = "The student you're trying to update marks for is not part of the group '${work.group.name}'." +
                            " suggestions:\n 1. Check if the student number is correct,\n" +
                            "2. Add the student to the module first"
                    return render(view: "edit", model: [mark:mark, module: work.group, work: work, newMark:newMark])
                }
            }else {
                flash.error = MessageService.validationFailed()
                return render(view: "edit", model: [mark:mark, module: work.group, work: work, newMark:newMark])
            }

        }.invalidToken {
            return render("Bad request")
        }
    }

    //delete
    def delete(Long id){
        if (!Mark.get(id)){
            return render("Mark not found")
        }
        withForm {
            def mark = Mark.get(id)
                mark.delete(flush:true)
                flash.message = MessageService.deleteSuccess("Mark for ${mark.markStudentNumber}")
                return redirect(controller:"work",action: "show", id:mark.work.id)
        }.invalidToken {
            return render("bad request")
        }
    }

    def upload(Long id){
        if (!Work.get(id)){
            return render("Work not found")
        }

        def work = Work.get(id)
        def group = work.group
        [work:work, group: group]
    }

    def extract(Long id){

        withForm {
            if (!Work.get(id)){
                return render("Module not found")
            }
            def work = Work.get(id)
            def file = request.getFile("file")
            XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream())
            excelService.importMarks(workbook, work)
            return redirect(controller:"work", action: "show", id: id)
        }.invalidToken {
            return render("Bad request, you can't submit the form twice")
        }
    }

    private def studentMarks(Long id){
        User user = springSecurityService.getCurrentUser()
        if (!Module.get(id)){
            return render("Module not found")
        }
        if (user.authorities.contains(IdentityService.ROLE_STUDENT)){
            def module = Module.get(id)
            def student = Student.findByEmail(user.username)
            def marks = Mark.findAllByMarkStudentNumber(student.studentNumber)
            return marks
        }
    }
}
