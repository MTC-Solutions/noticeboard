package noticeboard

class Faculty {

    String name

    Date dateCreated
    Date lastUpdated

    //belongs to
    Institution institution
    static belongsTo = [Institution]

    //many to many
    static hasMany = [courses: Course]

    static constraints = {
        name nullable: false
    }

    static mapping = {
        institution nullable: true
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }
}
