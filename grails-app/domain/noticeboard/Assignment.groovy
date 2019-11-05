package noticeboard

class Assignment {

    String folder
    String description

    Date dateCreated
    Date lastUpdated

    Group group
    static belongsTo = [Group]

    static hasMany = [files: File]

    static constraints = {
        folder nullable: false, blank: false
        description nullable: true, blank: true
        group nullable: true
    }

    static mapping = {
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }
}
