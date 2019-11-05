package noticeboard

class Mark {


    String markStudentNumber
    String achievedMark
    String progress

    Date dateCreated
    Date lastUpdated

    Work work
    static belongsTo = [Work]

    static constraints = {
        work nullable: true
    }

    static mapping = {
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }
}
