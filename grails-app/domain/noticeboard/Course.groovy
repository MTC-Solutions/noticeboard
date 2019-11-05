package noticeboard

class Course {

    String name

    Date dateCreated
    Date lastUpdated

    //belongs to
    Faculty faculty
    static belongsTo = [Faculty]

    //many to many
    static hasMany = [modules:Module]

    static constraints = {
        faculty nullable: true
        name nullable: false, blank: false
    }

    static mapping = {
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }
}
