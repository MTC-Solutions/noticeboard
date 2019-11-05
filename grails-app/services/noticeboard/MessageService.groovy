package noticeboard

import grails.gorm.transactions.Transactional

@Transactional
class MessageService {

    static def notFound(String s){
        return "${s} not found"
    }

    static def createSuccess(String s) {
        return s +" was created successfully"
    }

    static def validationFailed(){
        return " Validation error, please correct the form and try again."
    }

    static def updateSuccess(String s) {
        return s +" was updated successfully"
    }

    static def failedToSave(String s){
        return "Internal server error. The object wasn't ${s} saved successfully, please try again"
    }

    static def failedToUpdate(String s){
        return "Internal server error. ${s} was not saved successfully, please try again"
    }

    static def failedToDelete(String s){
        return "Internal server error. ${s} wasn't deleted successfully, please try again"
    }

    static def badRequest(){
        return "Bad request, these might be caused by double clicking the form. For security reasons " +
                "is not allowed. reload the form and continue. Thank you"
    }

    static def deleteNotFound(String s){
        return "${s} you're trying to delete does not exist."
    }

    static def deleteSuccess(String s){
        return "${s} deleted successfully"
    }

}
