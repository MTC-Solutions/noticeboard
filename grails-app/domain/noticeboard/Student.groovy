package noticeboard

import noticeboard.auth.User

class Student {

    //personal details
    String title
    String firstName
    String middleName
    String lastName
    String studentNumber
    String email

    //time date
    Date dateCreated
    Date lastUpdated

    //relationship
    Institution institution
    static belongsTo = [Institution, Group]


    static hasMany = [
                      users: User,
                      groups: Group
    ]


    static constraints = {
        institution nullable: true
        title nullable: false, blank: false
        firstName nullable: false, blank: false
        middleName nullable: true, blank: true
        lastName nullable: false, blank: false
        studentNumber nullable: false, blank: false
        email nullable: false,blank: false, unique: true, email: true
    }

    static mapping = {
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }
}
