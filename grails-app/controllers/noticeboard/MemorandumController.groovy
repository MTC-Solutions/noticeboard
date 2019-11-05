package noticeboard

import grails.plugin.springsecurity.annotation.Secured

@Secured("permitAll")
class MemorandumController {
    static layout = "app"
    //read or index
    def index(Long id) {
        if (!Group.get(id)){
            return render("Not found")
        }
        return [group: Group.get(id)]
    }

    //create
    def create(Long id){
        if (!Group.get(id)){
            return render("Not found")
        }
        return [group:Group.get(id)]
    }

    //save
    def save(Long id){
        if (!Group.get(id)){
            return render("Not found")
        }

        //
        withForm {
            def group = Group.get(id)
            def memorandum = new Memorandum(params)
            if (memorandum.validate()){
                group.addToMemorandums(memorandum)
                if (group.save(flush:true)){
                    flash.message = MessageService.createSuccess("Memorandum")
                    return redirect(action: "show", id: memorandum.id)
                }else{
                    flash.error = MessageService.failedToSave("Assignment")
                    return render(view: "create", model: [memorandum: memorandum, group:group])
                }
            }else{
                flash.error = MessageService.validationFailed()
                return render(view: "create", model: [memorandum: memorandum, group:group])
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    //show
    def show(Long id){
        if (!Memorandum.get(id)){
            return render("Memorandum not found")
        }

        def memorandum = Memorandum.get(id)
        def group = memorandum.group

        return [group: group, memorandum: memorandum]
    }

    //edit
    def edit(Long id){
        if (!Memorandum.get(id)){
            return render("Memorandum not found")
        }

        def memorandum = Memorandum.get(id)
        def group = memorandum.group

        return [group: group, memorandum:memorandum]
    }

    //update
    def update(Long id){

        if (!Memorandum.get(id)){
            return render("Memorandum not found")
        }

        //
        withForm {
            def memorandum = Memorandum.get(id)
            def newMemorandum = new Memorandum(params)
            if (newMemorandum.validate()){
                memorandum.folder = newMemorandum.folder
                memorandum.description = newMemorandum.description
                if (memorandum.save(flush:true)){
                    flash.message = MessageService.updateSuccess("Memorandum")
                    return redirect(action: "show", id: memorandum.id)
                }else{
                    flash.error = MessageService.failedToSave("Assignment")
                    return render(view: "edit", model: [memorandum: memorandum, group:memorandum.group])
                }
            }else{
                flash.error = MessageService.validationFailed()
                return render(view: "edit", model: [memorandum: memorandum, group:memorandum.group])
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    //delete
    def delete(Long id){
        if (!Memorandum.get(id)){
            return render("Memorandum not found")
        }

        withForm {
            def memorandum = Memorandum.get(id)
            memorandum.delete(flush: true)
            flash.message = MessageService.deleteSuccess("Memorandum")
            return redirect(action: "index", id: memorandum.id)
        }.invalidToken {
            return render("Bad request")
        }
    }
}
