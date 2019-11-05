package noticeboard

import grails.gorm.transactions.Transactional
import noticeboard.auth.User

@Transactional
class IdentityService {

    static String ROLE_STUDENT = "ROLE_STUDENT"
    static String ROLE_ADMIN   = "ROLE_ADMIN"
    static String ROLE_SUPER_ADMIN = "ROLE_SUPER_ADMIN"
    static String ROLE_INSTRUCTOR = "ROLE_INSTRUCTOR"
    static String ROLE_INSTITUTION_ADMIN = "ROLE_INSTITUTION_ADMIN"
    static String ROLE_INSTITUTION_SUPER_ADMIN = "ROLE_INSTITUTION_SUPER_ADMIN"
    static String PERMIT_ALL = "permitAll"

    
    static def isAdmin(User user){
        if (user.authorities.contains(ROLE_ADMIN)){
            return true
        }
        return false
    }

    static def isSuperAdmin(User user){
        if (user.authorities.contains(ROLE_SUPER_ADMIN)){
            return true
        }
        return false
    }

    static def isStudent(User user){
        if (user.authorities.contains(ROLE_STUDENT)){
            return true
        }
        return false
    }

    static def isInstructor(User user){
        if (user.authorities.contains(ROLE_INSTRUCTOR)){
            return true
        }
        return false
    }

    static def isInstitutionAdmin(User user){
        if (user.authorities.contains(ROLE_INSTITUTION_ADMIN)){
            return true
        }
        return false
    }

    static def isInstitutionSuperAdmin(User user){
        if (user.authorities.contains(ROLE_INSTITUTION_SUPER_ADMIN)){
            return true
        }
        return false
    }



}
