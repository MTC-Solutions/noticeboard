package noticeboard

class Notification {

    String description
    boolean isViewed = false

    Date dateCreated
    Date lastUpdated

    Group group
    static belongsTo = [Group]

    static constraints = {
        description nullable: false, blank: false
        group nullable: true
    }


    static mapping = {
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }
}
