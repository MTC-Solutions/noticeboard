package noticeboard

class Work {

    String name
    String totalMark

    Group group
    static belongsTo = [Group]
    static hasMany = [marks:Mark]

    static constraints = {
        name nullable: false, blank: false
        group nullable: true
    }
}
