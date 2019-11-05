package noticeboard

class InstitutionSuperAdmin {

    //personal details
    String title
    String firstName
    String middleName
    String lastName
    String email

    //time date
    Date dateCreated
    Date lastUpdated

    Institution institution
    static belongsTo = [Institution]


    static constraints = {
        title nullable: false, blank: false
        firstName nullable: false, blank: false
        middleName nullable: true, blank: true
        lastName nullable: false, blank: false
        email nullable: false,blank: false, unique: true, email: true
        institution nullable: true
    }

    static mapping = {
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }
}
