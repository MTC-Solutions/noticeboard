package noticeboard

import grails.plugin.springsecurity.annotation.Secured
import noticeboard.auth.User
import org.apache.commons.lang.RandomStringUtils
import org.springframework.security.crypto.bcrypt.BCrypt


@Secured(["permitAll"])
class HomeController {

    static layout = "index"

    def index() {}


    def forgotPassword() {}

    def processPassword() {
        withForm {
            String email = params.email
            if (email) {
                if (User.findByUsername(email)) {
                    User user = User.findByUsername(email)
                    String charset = (('A'..'Z') + ('0..9')).join()
                    Integer length = 8
                    String token = RandomStringUtils.random(length, charset.toCharArray())

                    String hashedToken = BCrypt.hashpw(token, BCrypt.gensalt(5))

                    String link = "http://localhost:8080/home/sendPassword/?email=${email}&token=${hashedToken}"

                    def student = Student.findByEmail(email)
                    sendMail {
                        to email
                        subject "Noticeboard"
                        html view: "/emails/reset-password", model: [link:link, student:student]
                    }
                    user.token = hashedToken
                    user.save(flush:true)
                    return render("it's fine")
                } else {
                    flash.message = "User with the following email ${email} does not exist"
                    return render(view: "forgotPassword")
                }
            } else {
                flash.message = "Email field is required"
                return render(view: "forgotPassword")
            }
        }.invalidToken {

        }
    }

    def sendPassword(){
        String email = params.email
        String token = params.token
        if (email && token){
            if (User.findByUsername(email)){
                User user = User.findByUsername(email)
                if (user.token == token){

                    String charset = (('A'..'Z') + ('0..9')).join()
                    Integer length = 8
                    String password = RandomStringUtils.random(length, charset.toCharArray())

                    def student = Student.findByEmail(email)
                    user.password = password
                    user.token = null
                    if (user.save(flush:true)){
                        user.save(flush:true)
                        sendMail {
                            to email
                            subject "Noticeboard"
                            html view: "/emails/send-reset-password", model: [password:password, student:student]
                        }
                        return render("Check your emails")
                    }else{
                        return render("Server problem please try again.")
                    }

                }else {
                    return render("no match")
                }
            }else {

            }
        }else {
            return render("Try resert again information is missing")
        }

    }
}

