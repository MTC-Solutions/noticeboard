package noticeboard

import grails.plugin.springsecurity.annotation.Secured
import noticeboard.auth.Role
import noticeboard.auth.User
import noticeboard.auth.UserRole
import org.apache.commons.lang.RandomStringUtils
import org.apache.poi.xssf.usermodel.XSSFWorkbook

@Secured(["ROLE_SUPER_ADMIN", "ROLE_INSTITUTION_ADMIN"])
class StudentController {

    def springSecurityService
    ExcelService excelService

    static layout = "app"

    //index
    def index() {
        return [students: Student.listOrderByDateCreated(order: "desc")]
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
            return render("Institution not found")
        }

        String charset = (('A'..'Z') + ('0..9')).join()
        Integer length = 8
        String password = RandomStringUtils.random(length, charset.toCharArray())

        def institution = Institution.get(id)

        def student = new Student(params)

        withForm {
            if (student.validate()) {
                //check whether the student is not in the institution already
                if (institution.students.contains(Student.findByEmailAndStudentNumber(student.email, student.studentNumber))) {
                    //tell the user the student already exist)
                    flash.error = "The student already exist"
                    return render(view: "create", model: [student: student, institution: institution])
                } else {
                    if (User.findByUsername(student.email)) {
                        flash.error = "User with the following email address: " + student.email + " already exist" +
                                ", to avoid conflict the student wasn't created successfully." + " Use a different email address."
                        return render(view: "create", model: [student: student, institution: institution])
                    } else {
                        institution.addToStudents(student)
                        if (institution.save(flush: true)) {
                            institution.save(flush: true)
                            if (institution.students.contains(Student.findByEmail(student.email))) {

                                def user = User.findOrSaveWhere(username: student.email, password: "password")
                                def role = Role.findOrSaveWhere(authority: IdentityService.ROLE_STUDENT)
                                if (!user.authorities.contains(role)) {
                                    UserRole.create(user, role, true)
                                    //sendMail {
                                    //    to student.email
                                    //    subject "Noticeboard"
                                    //    html view: "/emails/send-password", model:[student: student, password: password, institution: institution]
                                    //}
                                    flash.message = "The student was added successfully, He or she can check their email for login instruction"
                                    return redirect(action: "select", id: institution.id)
                                } else {
                                    flash.error = "Something went wrong while granting permissions"
                                    return render(view: "create", model: [student: student, institution: institution])
                                }
                            } else {
                                flash.error = "Failed while creating a user, because the student was't saved successfully"
                                return render(view: "create", model: [student: student, institution: institution])
                            }

                        } else {
                            flash.error = "Failure: something went wrong in the server, please try again"
                            return render(view: "create", model: [student: student, institution: institution])
                        }
                    }
                }
            } else {
                flash.error = "Validation error, please check the errors and correct them before submitting the form."
                return render(view: "create", model: [student: student, institution: institution])
            }
        }.invalidToken {
            flash.error = "Something wen't wrong make sure you don't click save twice."
            return render(view: "create", model: [student: student, institution: institution])
        }
    }

    //show
    def show(Long id) {
        if (!Student.get(id)){
            flash.error = "Student not found"
            return redirect(uri: request.getHeader("referer"))
        }
        def student = Student.get(id)
        def institution = student.institution
        return [student: student, institution: institution]
    }

    def edit(Long id) {
        if (!Student.get(id)) {
            return render("The student you're trying to validate does not exist")
        }
        return [student: Student.get(id)]
    }

    //update
    def update(Long id) {

        withForm {
            def student = Student.get(id)
            def newStudent = new Student(params)
            if (!newStudent.validate()) {
                if (Student.get(id)) {
                    student.title = newStudent.title
                    student.firstName = newStudent.firstName
                    student.middleName = newStudent.middleName
                    student.lastName = newStudent.lastName
                    student.studentNumber = newStudent.studentNumber
                    student.email = newStudent.email
                    if (student.save(flush: true)) {
                        student.save(flush: true)
                        flash.message = "Student updated successfully"
                        return redirect(action: "show", id: student.id)
                    } else {
                        flash.error = "Something wen't wrong, the student wasn't updated successfully"
                        return render(view: "edit", model: [student: student, institution: student.institution])
                    }

                } else {
                    flash.error = "Student not found"
                    return render(view: "edit", model: [student: student, institution: student.institution])
                }
            } else {
                flash.error = "Validation error, please check the errors and correct them before submitting the form."
                return render(view: "edit", model: [student: student, institution: student.institution])
            }

        }.invalidToken {
            def student = Student.get(id)
            flash.error = "Something wen't wrong make sure you don't click save twice."
            return render(view: "edit", model: [student: student, institution: student.institution])
        }


    }

    def delete(Long id) {

        withForm {
            if (!Student.get(id)) {
                return render("student not found")
            }

            def student = Student.get(id)

            def user = User.findByUsername(student.email)
            UserRole.remove(user, Role.findByAuthority(IdentityService.ROLE_STUDENT))
            user.delete(flush: true)
            student.delete(flush: true)
            flash.message = MessageService.deleteSuccess("Student '${student.studentNumber}'")
            return redirect(action: "select", id: student.institution.id)


        }.invalidToken {
            return render("You cant press twice")
        }
    }

    //select(will get students per institution)
    def select(Long id) {
        if (!Institution.get(id)) {
            return render("Institution not found")
        }

        [institution: Institution.get(id)]
    }

    //profile
    def profile() {
        User user = authenticatedUser()
        if (!Student.findByEmail(user.username)) {
            render("User not found")
        }
        def students = Student.findAllByEmail(user.username)
        def student = Student.findByEmail(user.username)

        def groups = Group.findAllByStudents(students)
        def modules = Module.findAllByGroups(groups)
        return [modules: modules, student: student, group: student.group]
    }

    //get logged in user
    private authenticatedUser() {
        if (springSecurityService.isLoggedIn()) {
            def user = springSecurityService.getCurrentUser()
            return user
        }
    }

    //
    def upload(Long id) {
        if (!Institution.get(id)) {
            return render("Faculty not found")
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
            excelService.importStudentsToInstitution(workbook, institution)
            flash.message = "Students uploaded successfully"
            return redirect(action: "select", id: institution.id)
        }.invalidToken {
            return render("Bad request, you can't submit the form twice")
        }
    }
}