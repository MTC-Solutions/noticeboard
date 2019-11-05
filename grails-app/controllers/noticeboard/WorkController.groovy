package noticeboard

import grails.plugin.springsecurity.annotation.Secured

@Secured(["permitAll"])
class WorkController {

    static layout = "app"

    def index(Long id) {
        if (!Group.get(id)){
            return render("Group not found, work can exist in a group")
        }
        def group = Group.get(id)
        return [group: group]
    }

    def create(Long id){
        if(!Group.get(id)){
            return render("Group not found")
        }
        [group: Group.get(id)]
    }

    def save(Long id){
        if(!Group.get(id)){
            return render("Group not found")
        }
        def group = Group.get(id)
        def work = new Work(params)
        withForm{
            if (work.validate()){
                group.addToWorks(work)
                if (group.save(flush:true)){
                    flash.message = MessageService.createSuccess("Work")
                    return redirect(action:"index", id:id)
                }else {
                    flash.error = MessageService.failedToSave("Work")
                    return render(view: "edit", model: [group: work.group, work: work])
                }
            }else {
                flash.error = MessageService.validationFailed()
                return render(view: "create", model: [group: group, work:work])
            }
        }.invalidToken {
            return render("Bad request")
        }
    }

    def show(Long id){
        if (!Work.get(id)){
            return render("Work not found")
        }
        def work = Work.get(id)
        return [group: work.group, work: work]
    }

    def edit(Long id){
        if (!Work.get(id)){
            return render("work not found")
        }
        def work = Work.get(id)
        def group = work.group
        [work: work, group: group]
    }

    def update(Long id){
        if (!Work.get(id)){
            return render("work not found")
        }
        def work = Work.get(id)
        def newWork = new Work(params)

        withForm {
            if (work.validate()){
                work.name = newWork.name
                work.totalMark = newWork.totalMark
                if(work.save(flush:true)){
                    flash.message = MessageService.updateSuccess("Work")
                    return redirect(action: "show", id: id)
                }else {
                    flash.error = MessageService.failedToSave("Work")
                    return render(view: "edit", model: [group: work.group, work: work, newWork:newWork])
                }
            }else{
                flash.error = MessageService.validationFailed()
                return render(view: "edit", model: [group: work.group, work: work, newWork:newWork])
            }
        }.invalidToken {

        }
    }

    def delete(Long id){
        if (!Work.get(id)){
            return render("Work not found")
        }
        withForm {
            def work = Work.get(id)
            work.delete(flush: true)
            flash.message = MessageService.deleteSuccess("Work ${work.name}")
            return redirect(action: "index", id: work.group.id)
        }.invalidToken {
            return render("Bad request")
        }
    }

}
