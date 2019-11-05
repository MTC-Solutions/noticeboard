package noticeboard

class Institution {

    String name
    String country
    String address
    String city
    String postalCode
    String email
    String phoneNumber

    Date dateCreated
    Date lastUpdated

    static hasMany = [
                      students: Student,
                      instructors: Instructor,
                      faculties:Faculty,
                      institutionAdmins:InstitutionAdmin,
                      institutionSuperAdmins:InstitutionSuperAdmin
    ]

    static constraints = {
        name size: 5..250, nullable: false, unique: true
        country size: 2..250, nullable: false, unique: false
        address size: 5..250, nullable: false, unique: false
        city size: 2..250, nullable: false, unique: false
        postalCode size: 2..10, nullable: false, unique: false
        email size: 5..250, nullable: false, unique: true
        phoneNumber size: 5..50, nullable: false, unique: true
    }

    static mapping = {
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }
}
