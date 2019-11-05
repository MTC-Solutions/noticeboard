package noticeboard

class Instructor {

    //personal details
    String title
    String firstName
    String middleName
    String lastName
    String email

    //time date
    Date dateCreated
    Date lastUpdated

    //relationship
    Institution institution
    static belongsTo = [Institution, Group]

    static hasMany = [groups:Group]


    static constraints = {
        title nullable: false, blank: false
        firstName nullable: false, blank: false
        middleName nullable: true, blank: true
        lastName nullable: false, blank: false
        email nullable: false, blank: false, unique: true, email: true
        institution nullable: true
    }

    static mapping = {
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }
}
