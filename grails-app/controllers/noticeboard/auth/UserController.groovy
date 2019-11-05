package noticeboard.auth

import grails.plugin.springsecurity.SpringSecurityUtils
import grails.plugin.springsecurity.annotation.Secured
import grails.validation.ValidationException
import noticeboard.Group
import noticeboard.InstitutionAdmin
import noticeboard.Instructor
import noticeboard.Module
import noticeboard.Student

import static org.springframework.http.HttpStatus.*

@Secured(["ROLE_ADMIN", "ROLE_STUDENT", "ROLE_INSTRUCTOR", "ROLE_SUPER_ADMIN", "ROLE_INSTITUTION_SUPER_ADMIN", "ROLE_INSTITUTION_ADMIN"])
class UserController {
    static layout = "app"
    UserService userService

    def springSecurityService


    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def profile() {
        if (springSecurityService.isLoggedIn()) {
            User user = currentUserLookUp()
            if (SpringSecurityUtils.ifAllGranted("ROLE_INSTRUCTOR")) {
                if (!Instructor.findByEmail(user.username)) {
                    return render("User not found")
                } else {
                    return render(view: "/instructor/profile", model: [instructor: Instructor.findByEmail(user.username)])
                }
            }
            if (SpringSecurityUtils.ifAllGranted("ROLE_STUDENT")) {
                if (!Student.findByEmail(user.username)) {
                    return render("User not found")
                } else {
                    if (!Student.findByEmail(user.username)) {
                        render("User not found")
                    }
                    def student = Student.findByEmail(user.username)

                    return render(view: "/student/profile", model: [student: student])
                }
            }

            if (SpringSecurityUtils.ifAllGranted("ROLE_ADMIN")) {
                return render(view: "dashboard")
            }
            if (SpringSecurityUtils.ifAllGranted("ROLE_SUPER_ADMIN")) {
                return render(view: "dashboard")
            }

            if (SpringSecurityUtils.ifAllGranted("ROLE_INSTITUTION_ADMIN")){
                def institutionAdmin = InstitutionAdmin.findByEmail(user.username)
                def institution = institutionAdmin.institution
                return render(view: "/institution/show", model: [institution:institution])
            }

        }
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond userService.list(params), model: [userCount: userService.count()]
    }

    def show(Long id) {
        respond userService.get(id)
    }

    def create() {
        respond new User(params)
    }

    def save(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view: 'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond userService.get(id)
    }

    def update(User user) {
        if (user == null) {
            notFound()
            return
        }

        try {
            userService.save(user)
        } catch (ValidationException e) {
            respond user.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), user.id])
                redirect user
            }
            '*' { respond user, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        userService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }

    def changePassword() {}

    def saveNewPassword() {
        withForm {
            String currentPassword = params.currentPassword
            String newPassword = params.newPassword
            String confirmPassword = params.confirmPassword
            if (!currentPassword.isEmpty() && !newPassword.isEmpty() && !confirmPassword.isEmpty()) {
                User user = currentUserLookUp()
                if (currentPassword) {
                    if (springSecurityService.passwordEncoder.isPasswordValid(user.password, currentPassword, null)) {
                        user.password = newPassword
                        if (user.save(flush: true)) {
                            user.save(flush: true)
                            flash.message = "Your is password is updated successfully"
                            return redirect(action: "profile")
                        } else {
                            render("Something went wrong")
                        }
                    } else {
                        flash.message = "The current password you entered don't match the current user password on the system, please try again"
                        return render(view: "changePassword")
                    }

                } else {
                    flash.message = "No user"
                    return render(view: "changePassword")
                }
            } else {
                flash.message = "All fields are required, please try again"
                return render(view: "changePassword")
            }

        }.invalidToken {
            render("Bad request")
        }


    }

    @Secured(["permitAll"])
    def processPassword() {

        withForm {
            String email = params.email
            if (email) {
                if (User.findAllByUsername(email)) {
                    render("user found")
                } else {
                    flash.message = "Username don't not found in the system, please check typing errors"
                    return redirect(controller: "home", action: "forgotPassword")
                }
            } else {
                flash.message = "Email field is required"
                return redirect(controller: "home", action: "forgotPassword")
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    private def currentUserLookUp() {
        if (springSecurityService.isLoggedIn()) {
            User user = springSecurityService.getCurrentUser()
        } else {
            redirect(controller: "login")
        }
    }
}
