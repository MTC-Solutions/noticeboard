package noticeboard

class File {

    String folder
    String description

    Date dateCreated
    Date lastUpdated

    //alphabetical order
    Assignment assignment
    Memorandum memorandum
    Note note
    static belongsTo = [
                        Assignment,
                        Memorandum,
                        Note
    ]

    static constraints = {
        folder nullable: false, blank: false
        description nullable: true, blank: true
        assignment nullable: true
        memorandum nullable: true
        note nullable: true
    }

    static mapping = {
        dateCreated type: "timestamp"
        lastUpdated type: "timestamp"
    }
}
