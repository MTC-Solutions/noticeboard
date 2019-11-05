package noticeboard

import grails.plugin.springsecurity.annotation.Secured


@Secured(["ROLE_STUDENT", "ROLE_INSTRUCTOR"])
class AssignmentController {
    static layout = "app"
    //read or index
    def index(Long id) {
        if(!Group.get(id)){
            return render("Module not found")
        }
        return [group:Group.get(id)]
    }

    //create
    def create(Long id){
        if(!Group.get(id)){
            return render("Module not found")
        }
        return [group:Group.get(id)]
    }

    //save
    def save(Long id){
        if(!Group.get(id)){
            return render("Module not found")
        }

        withForm {
            def group = Group.get(id)
            def assignment = new Assignment(params)
            if (assignment.validate()){
                group.addToAssignments(assignment)
                if (group.save(flush:true)){
                    flash.message = MessageService.createSuccess("Assignment")
                    return redirect(action: "show", id: assignment.id)
                }else{
                    flash.error = MessageService.failedToSave("Assignment")
                    return render(view: "create", model: [assignment: assignment, group:group])
                }
            }else{
                flash.error = MessageService.validationFailed()
                return render(view: "create", model: [assignment: assignment, group:group])
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    //show
    def show(Long id){
        if(!Assignment.get(id)){
            return render("Assignment not found")
        }

        def assignment = Assignment.get(id)
        def group = assignment.group

        return [assignment:assignment, group: group]
    }

    //edit
    def edit(Long id){
        if(!Assignment.get(id)){
            return render("Assignment not found")
        }

        def assignment = Assignment.get(id)
        def group = assignment.group

        return [assignment:assignment, group: group]
    }

    //update
    def update(Long id){

        withForm {
            if(!Assignment.get(id)){
                return render("Assignment not found")
            }

            def assignment = Assignment.get(id)
            def newAssignment = new Assignment(params)
            def group = assignment.group
            if (assignment.validate()){
                assignment.folder = newAssignment.folder
                assignment.description = newAssignment.description
                if (assignment.save(flush:true)){
                    flash.message = MessageService.updateSuccess("Assignment")
                    return redirect(action: "show", id: assignment.id)
                }else{
                    flash.error = MessageService.failedToSave("Assignment")
                    return render(view: "create", model: [assignment: assignment, group:group])
                }
            }else{
                flash.error = MessageService.validationFailed()
                return render(view: "create", model: [assignment: assignment, group:assignment.group])
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    //delete
    def delete(Long id){
        if(!Assignment.get(id)){
            return render("Assignment not found")
        }

        withForm {
            def assignment = Assignment.get(id)
            assignment.delete(flush:true)
            flash.message = MessageService.deleteSuccess("Assignment")
            return redirect(action: "index", id: assignment.group.id)
        }.invalidToken{
            return render("Bad request")
        }
    }
}
