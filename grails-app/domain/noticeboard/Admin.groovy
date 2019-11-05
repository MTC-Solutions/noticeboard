package noticeboard

class Admin {

    //personal details
    String title
    String firstName
    String lastName
    String middleName
    String email

    //time date
    Date dateCreated
    Date lastUpdated

    static constraints = {
        title size: 2..8, blank: false, nullable: false
        firstName size: 3..100, blank: false, nullable: false
        middleName size: 3..100, blank: true, nullable: true
        lastName size: 3..100, blank: false,nullable: false
        email email: true, blank: false, nullable: false
    }

    static mapping = {
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }
}
