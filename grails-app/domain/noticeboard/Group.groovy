package noticeboard

class Group {

    String name

    Date dateCreated
    Date lastUpdated

    Module module
    static belongsTo = [Module]


    //many to many
    static hasMany = [
            assignments: Assignment,
            notifications: Notification,
            memorandums: Memorandum,
            notes:Note,
            students:Student,
            instructors:Instructor,
            works:Work
    ]

    static mapping = {
        table "`group`"
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }

    static constraints = {
        name nullable: false, blank: false
        module nullable: true
    }
}
