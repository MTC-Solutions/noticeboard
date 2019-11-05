package noticeboard

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_SUPER_ADMIN", "ROLE_STUDENT","ROLE_INSTRUCTOR"])
class NoteController {
    static layout = "app"
    //read or index
    def index(Long id) {
        if (!Group.get(id)){
            return render("Module not found")
        }
        def group = Group.get(id)

        return [group: group]
    }

    //create
    def create(Long id){
        if (!Group.get(id)){
            return render("Group not found")
        }
        def group = Group.get(id)

        return [group:group]
    }

    //save
    def save(Long id){
        if (!Group.get(id)){
            return render("Group not found")
        }

        withForm{
            def group = Group.get(id)
            def note = new Note(params)
            if (note.validate()){
                group.addToNotes(note)
                if (note.save(flush:true)){
                    flash.message = MessageService.createSuccess("Class notes")
                    return redirect(action:"show", id:note.id)
                }else{
                    flash.message = MessageService.failedToSave("class notes")
                    return render(view: "create", model: [note: note, group: group])
                }
            }else{
                flash.error = MessageService.validationFailed()
                return render(view: "create", model: [note: note, group: group])
            }
        }.invalidToken{
            return render("Bad request")
        }
    }

    //show
    def show(Long id){
        if(!Note.get(id)){
            return render("Note not found")
        }
        def note = Note.get(id)
        def group = note.group
        return [note:note, group: group]
    }

    //edit
    def edit(Long id){
        if(!Note.get(id)){
            return render("Note not found")
        }
        def note = Note.get(id)
        def group = note.group
        return [note:note, group: group]
    }

    //update
    def update(Long id){
        if(!Note.get(id)){
            return render("Note not found")
        }
        def note = Note.get(id)
        def newNote = new Note(params)
        withForm {
            if (newNote.validate()){
                note.folder = newNote.folder
                note.description = newNote.description
                if (note.save(flush:true)){
                    flash.message = MessageService.updateSuccess("Class notes or material")
                    return redirect(action: "show", id: id)
                }else{
                    flash.error = MessageService.failedToSave("Class notes or material")
                    return render(view: "edit", model: [note: note])
                }
            }else{
                flash.error = MessageService.validationFailed()
                return render(view: "edit", model: [note: note, group: note.group])
            }
        }.invalidToken {
            return render("Bad request")
        }

    }

    //delete
    def delete(Long id){
        if(!Note.get(id)){
            return render("Note not found")
        }
        def note = Note.get(id)

        withForm {
            note.delete(flush: true)
            flash.message = MessageService.deleteSuccess("Class notes or material")
            return redirect(action:"index", id:  note.group.id)
        }.invalidToken {
            return render("Bad request")
        }
    }

    def upload(Long id){
        if (!Note.get(id)){
            return render("Note not found")
        }

    }
}
