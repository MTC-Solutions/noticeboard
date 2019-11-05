package noticeboard

class Module {

    String name
    String code

    Date dateCreated
    Date lastUpdated

    //belongs to
    Course course
    static belongsTo = [Course]

    //many to many
    static hasMany = [
                      groups:Group
    ]

    static constraints = {
        name nullable: false, blank: false
        code nullable: false, blank: false
        course nullable: true
    }

    static mapping = {
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }
}
