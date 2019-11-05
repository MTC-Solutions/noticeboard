package noticeboard

import grails.gorm.transactions.Transactional
import noticeboard.auth.User

@Transactional
class CountService {

    //All

    static final def allStudents(){
        return Student.all.size()
    }

    static final def allInstitutions(){
        return Institution.all.size()
    }

    static final def allInstructors(){
        return Instructor.all.size()
    }

    static final def allAdmins(){
        return Admin.all.size()
    }

    static final def allUsers(){
        return Admin.all.size()
    }

    static final def allFaculties(){
        return Faculty.all.size()
    }


    //In a group
    static final def groupStudents(Group group){
        return group.students.size()
    }

    static final def groupNotes(Group group){
        return group.notes.size()
    }

    static final def groupNotifications(Group group){
        return group.notifications.size()
    }

    static final def groupAssignments(Group group){
        return group.assignments.size()
    }

    static final def groupWorks(Group group){
        return group.works.size()
    }

    static final def groupMemorandums(Group group){
        return group.memorandums.size()
    }

    //in a institution
    static final def institutionAdmins(Institution institution){
        return institution.institutionAdmins.size()
    }

    static final def institutionStudents(Institution institution){
        return institution.students.size()
    }

    static final def institutionInstructors(Institution institution){
        return institution.instructors.size()
    }

    static final def institutionFaculties(Institution institution){
        return institution.faculties.size()
    }

}
