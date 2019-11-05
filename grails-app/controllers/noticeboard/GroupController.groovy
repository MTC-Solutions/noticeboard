package noticeboard

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import noticeboard.auth.User
import org.apache.poi.xssf.usermodel.XSSFWorkbook

@Secured(["ROLE_SUPER_ADMIN", "ROLE_INSTITUTION_ADMIN", "ROLE_STUDENT", "ROLE_INSTRUCTOR"])
class GroupController {
    static layout = "app"
    def excelService
    def springSecurityService

    @Secured("ROLE_STUDENT")
    def description(Long id){
        if (SpringSecurityUtils.ifAllGranted(IdentityService.ROLE_STUDENT)){
            if (!Group.get(id)){
                flash.error = "Group not found"
                return redirect(controller:"user",action: "profile")
            }else{
                def group = Group.get(id)
                return [group: group]
            }
        }
    }

    //extract all group in a module
    def index(Long id) {
        if (!Module.get(id)) {
            return render("Module not")
        }
        def module = Module.get(id)
        def institution = module.course.faculty.institution
        return [module: module, institution: institution]
    }

    //create student
    def create(Long id) {
        if (!Module.get(id)) {
            return render("Module not")
        }
        def module = Module.get(id)
        def institution = module.course.faculty.institution
        return [module: module, institution: institution]
    }

    //save student
    def save(Long id) {

        withForm {
            if (!Module.get(id)) {
                return render("Module not found")
            }

            def module = Module.get(id)
            def group = new Group(params)
            def institution = module.course.faculty.institution
            if (group.validate()) {
                module.addToGroups(group)
                if (module.save(flush: true)) {
                    flash.message = MessageService.createSuccess("Group")
                    return redirect(action: "show", id: group.id)
                } else {
                    flash.message = MessageService.failedToSave("Module")
                    return render(view: "create", model: [module: module, group: group, institution: institution])
                }
            } else {
                flash.error = MessageService.validationFailed()
                return render(view: "create", model: [module: module, group: group, institution: institution])
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    //show group
    def show(Long id) {
        if (!Group.get(id)) {
            return render("Group not found")
        }
        def group = Group.get(id)
        def institution = group.module.course.faculty.institution
        return [group: group, institution: institution]
    }

    //edit group
    def edit(Long id) {
        if (!Group.get(id)) {
            return render("Group not found")
        }
        def group = Group.get(id)
        def institution = group.module.course.faculty.institution
        return [group: group, institution: institution]
    }

    //update group
    def update(Long id) {
        withForm {
            if (!Group.get(id)) {
                return render("Group not found")
            }
            def group = Group.get(id)
            def newGroup = new Group(params)
            def institution = group.module.course.faculty.institution
            if (group.validate()) {
                group.name = newGroup.name
                if (group.save(flush: true)) {
                    flash.message = MessageService.updateSuccess("Group")
                    return redirect(action: "show", id: group.id)
                } else {
                    flash.message = MessageService.failedToUpdate("Group")
                    return render(view: "edit", model: [newGroup: newGroup, institution: institution])
                }
            } else {
                flash.error = MessageService.validationFailed()
                return render(view: "edit", model: [newGroup: newGroup, institution: institution])
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    //delete a group
    def delete(Long id) {
        withForm {
            if (!Group.get(id)) {
                return render("Group not launch")
            }
            def group = Group.get(id)
            group.delete(flush: true)
            return redirect(action: "index", id: group.module.id)
        }.invalidToken {
            return render("Bad request")
        }
    }

    //create student inside a a group, the student must be available
    def createStudent(Long id) {
        if (!Group.get(id)) {
            return render("Group not found")
        }
        def group = Group.get(id)
        def institution = group.module.course.faculty.institution
        [group: group, institution: institution]
    }

    //save a student
    def saveStudent(Long id) {

        withForm {
            if (!Group.get(id)) {
                return render("Group not found")
            }
            def group = Group.get(id)
            String studentNumber = params.studentNumber
            def institution = group.module.course.faculty.institution
            if (studentNumber) {
                def student = Student.findByStudentNumber(studentNumber)
                if (institution.students.contains(student)) {
                    def student2 = Student.findByStudentNumberAndInstitution(
                            studentNumber,
                            institution
                    )
                    group.addToStudents(student2)
                    if (group.save(flush: true)) {

                        flash.message = MessageService.createSuccess("Group")
                        return redirect(action: "students", id: group.id)
                    } else {
                        flash.message = MessageService.failedToSave("Group")
                        return render(view: "createStudent", model: [group: group])
                    }
                } else {
                    return render("The student with the student number '${studentNumber}'" +
                            " is not in ${institution.name}")
                }
            } else {
                return render("Validation error")
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    //upload student to a group
    def uploadStudents(Long id) {
        if (!Group.get(id)) {
            return render("Group not found")
        }

        def group = Group.get(id)
        def institution = group.module.course.faculty.institution
        return [group: group, institution: institution]
    }

    //extract students from spreadsheet file and upload into a group
    def extractStudents(Long id) {

        withForm {
            if (!Group.get(id)) {
                return render("Group not found")
            }
            def group = Group.get(id)
            def file = request.getFile("file")
            XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream())
            excelService.importStudentsToGroup(workbook, group.module.course.faculty.institution, group)
            return redirect(action: "students", id: group.id)
        }.invalidToken {
            render("Bad request, you can't submit the form twice")
        }
    }

    //get all students in a group
    def students(Long id) {
        if (!Group.get(id)) {
            return render("Group not found")
        }
        def group = Group.get(id)
        def institution = group.module.course.faculty.institution
        return [group: group, institution: institution]
    }

    //remove student from a group
    def removeStudent(Long id) {
        withForm {
            if (!Student.get(id)) {
                "Student not available"
            }

            def student = Student.get(id)
            if (student.group) {
                def group = student.group
                group.removeFromStudents(student)
                if (group.save(flush: true)) {
                    flash.message = MessageService.deleteSuccess("Student")
                    return redirect(action: "students", id: group.id)
                } else {
                    flash.message = MessageService.failedToDelete("Student")
                    return redirect(action: "students", id: group.id)
                }
            } else {
                return render("The student you're trying to remove is not in any group in the institution")
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    //create instructor inside a a group, the student must be available
    def createInstructor(Long id) {
        if (!Group.get(id)) {
            return render("Group not found")
        }
        def group = Group.get(id)
        def institution = group.module.course.faculty.institution
        return [group: group, institution: institution]
    }

    def saveInstructor(Long id) {

        withForm {
            if (!Group.get(id)) {
                return render("Group not found")
            }
            def group = Group.get(id)
            String email = params.email
            def institution = group.module.course.faculty.institution
            if (email) {
                if (institution.instructors.contains(Instructor.findByEmail(email))) {
                    group.addToInstructors(Instructor.findByEmail(email))
                    if (group.save(flush: true)) {
                        flash.message = MessageService.createSuccess("Instructor")
                        return redirect(action: "instructors", id: group.id)
                    } else {
                        flash.message = MessageService.failedToSave("Group")
                        return render(view: "createInstructor", model: [group: group])
                    }
                } else {
                    return render("The instructor with the email '${email}'" +
                            " is not in ${institution.name}")
                }
            } else {
                return render("Validation error")
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    //upload Instructor to a group
    def uploadInstructors(Long id) {
        if (!Group.get(id)) {
            return render("Group not found")
        }
        def group = Group.get(id)
        def institution = group.module.course.faculty.institution
        return [group: group, institution: institution]
    }

    def extractInstructors(Long id) {

        withForm {
            if (!Group.get(id)) {
                return render("Group not found")
            }
            def group = Group.get(id)
            def file = request.getFile("file")
            XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream())
            excelService.importInstructorsToGroup(workbook, group.module.course.faculty.institution, group)
            return redirect(action: "instructors", id: group.id)
        }.invalidToken {
            render("Bad request, you can't submit the form twice")
        }
    }

    //instructors
    def instructors(Long id) {
        if (!Group.get(id)) {
            return render("Group not found")
        }
        def group = Group.get(id)
        def institution = group.module.course.faculty.institution
        return [group: group, institution: institution]
    }

    //remove instructor from a group
    def removeInstructor(Long id) {
        withForm {
            if (!Instructor.get(id)) {
                "Student not available"
            }

            def instructor = Instructor.get(id)
            if (instructor.group) {
                def group = instructor.group
                group.removeFromInstructors(instructor)
                if (group.save(flush: true)) {
                    flash.message = MessageService.deleteSuccess("Instructor")
                    return redirect(action: "instructors", id: group.id)
                } else {
                    flash.message = MessageService.failedToDelete("Instructor")
                    return redirect(action: "instructors", id: group.id)
                }
            } else {
                return render("The instructor you're trying to remove is not in any group in the institution")
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

}
