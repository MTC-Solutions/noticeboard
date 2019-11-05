package noticeboard

import grails.plugin.springsecurity.annotation.Secured
import org.apache.poi.xssf.usermodel.XSSFWorkbook


@Secured(["ROLE_SUPER_ADMIN", "ROLE_INSTITUTION_ADMIN"])
class CourseController {
    ExcelService excelService
    static layout = "app"

    def index(Long id) {
        if (!Faculty.get(id)) {
            return render("Faculty not found")
        }

        def faculty = Faculty.get(id)
        def institution = faculty.institution

        [faculty: faculty, institution:institution]
    }

    def create(Long id) {
        if (!Faculty.get(id)) {
            return render("Faculty not found")
        }

        def faculty = Faculty.get(id)
        def institution = faculty.institution

        [faculty: faculty, institution:institution]
    }

    def save(Long id) {
        if (!Faculty.get(id)) {
            flash.error = "You can't a course without a faculty."
            return redirect(controller: "user", action: "profile")
        }
        def faculty = Faculty.get(id)
        def course = new Course(params)
        withForm {

            if (course.validate()) {
                faculty.addToCourses(course)
                if (faculty.save(flush: true)) {
                    flash.message = MessageService.createSuccess("The course ${course.name}")
                    return redirect(action: "show", id: course.id)
                } else {
                    flash.error = MessageService.failedToSave("The course ${course.name}")
                    return render(view: "create", model: [course: course, faculty: faculty, institution: faculty.institution])
                }
            } else {
                flash.error = MessageService.validationFailed()
                return render(view: "create", model: [course: course, faculty: faculty, institution:  faculty.institution])
            }
        }.invalidToken {
            flash.error = MessageService.badRequest()
            return render(view: "create", model: [course: course, faculty: faculty, institution:  faculty.institution])
        }

    }

    def show(Long id) {
        if (!Course.get(id)) {
            flash.error = MessageService.notFound("Course")
            return redirect(controller: "user", action: "profile")
        }
        def course = Course.get(id)
        def institution = course.faculty.institution

        [course: course, institution:institution]
    }

    def edit(Long id) {
        if (!Course.get(id)) {
            flash.error = MessageService.notFound("Course")
            return redirect(controller: "user", action: "profile")
        }
        def course = Course.get(id)
        def institution = course.faculty.institution

        [course: course, institution:institution]
    }

    def update(Long id) {
        def course = Course.get(id)
        def newCourse = new Course(params)
        def courseName = course.name

        withForm {
            if (newCourse.validate()) {
                course.name = newCourse.name
                if (course.save(flush: true)) {
                    flash.message = MessageService.updateSuccess("The course ${courseName}")
                    return redirect(action: "show", id: course.id)
                } else {
                    flash.error = MessageService.badRequest()
                    return render(view: "edit", model: [course: course, institution: course.faculty.institution])
                }

            } else {
                flash.error = MessageService.validationFailed()
                return render(view: "edit", model: [course: course, institution: course.faculty.institution])
            }
        }.invalidToken {
            flash.error = MessageService.badRequest()
            return render(view: "edit", model: [course: course, institution: course.faculty.institution])
        }
    }

    def delete(Long id) {
        if (!Course.get(id)) {
            flash.error = MessageService.deleteNotFound()
            return redirect(controller: "user", action: "profile")
        }

        def course = Course.get(id)

        withForm {
            course.delete(flush: true)
            flash.message = MessageService.deleteSuccess("The course ${course.name}")
            return redirect(action: "index", id: course.faculty.id, institution: course.faculty.institution)

        }.invalidToken {
            flash.error = MessageService.badRequest()
            return render(view: "edit", model: [course: course, institution: course.faculty.institution])
        }

    }

    def upload(Long id) {
        if (!Faculty.get(id)) {
            return render("Faculty not found")
        }
        def faculty = Faculty.get(id)
        return [faculty: faculty, institution: faculty.institution]
    }

    def extract(Long id) {
        if (!Faculty.get(id)) {
            return render("Faculty not found")
        }
        def faculty = Faculty.get(id)
        withForm {
            def file = request.getFile("file")
            XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream())
            excelService.importCourses(workbook, faculty)
            return redirect(action: "index", id: faculty.id)
        }.invalidToken {
            return render("Bad request, you can't submit the form twice")
        }
    }
}
