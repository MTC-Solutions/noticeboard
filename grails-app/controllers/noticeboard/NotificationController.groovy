package noticeboard

import grails.plugin.springsecurity.annotation.Secured

@Secured(["ROLE_SUPER_ADMIN", "ROLE_STUDENT", "ROLE_INSTRUCTOR", "ROLE_INSTITUTION_ADMIN"])
class NotificationController {
    static layout = "app"

    //index
    def index(Long id){
        if (!Group.get(id)){
            return render("Module not found")
        }
        def group = Group.get(id)

        return [group: group]
    }

    //create
    def create(Long id){
        if (!Group.get(id)){
            return render("Module not found")
        }
        def group = Group.get(id)

        return [group: group]
    }

    //save
    def save(Long id){
        if (!Group.get(id)){
            return render("Group not found")
        }
        def group = Group.get(id)
        def notification = new Notification(params)
        withForm{
            if(notification.validate()){
                group.addToNotifications(notification)
                if (group.save(flush:true)){
                    flash.message = MessageService.createSuccess("Notification")
                    return redirect(action:"show", id:notification.id)
                }else{
                    flash.message = MessageService.failedToSave("notification")
                    return render(view: "create", model:[notification: notification, group: group])
                }
            }else{
                flash.error = MessageService.validationFailed()
                return render(view: "create", model:[notification: notification, group: group])
            }
        }.invalidToken {
           return render("Bad request")
        }

    }

    //show
    def show(Long id){
        if (!Notification.get(id)){
            return render("Module not found")
        }
        def notification = Notification.get(id)
        def group = notification.group
        return [notification:notification, group: group]
    }

    //edit
    def edit(Long id){
        if (!Notification.get(id)){
            return render("Module not found")
        }
        def notification = Notification.get(id)
        def group = notification.group
        return [notification:notification, group: group]
    }

    //update
    def update(Long id){

        withForm {
            if (!Notification.get(id)){
                return render("Module not found")
            }
            def notification = Notification.get(id)
            def newNotification = new Notification(params)

            def group = notification.group
            if (newNotification.validate()){
                notification.description = newNotification.description
                if (notification.save(flush:true)){
                    flash.message = MessageService.updateSuccess("Notification")
                    return redirect(action: "show", id: id)
                }else{
                    flash.error = MessageService.failedToUpdate("Notification")
                    return render(view: "edit", model: [notification: notification, group: group])
                }
            }else{
                flash.error = MessageService.validationFailed()
                return render(view: "edit", model: [newNotification:newNotification, notification: notification, group: group])
            }
        }.invalidToken {
            return render("bad request")
        }

    }

    //delete
    def delete(Long id){

        if (!Notification.get(id)){
            flash.error = MessageService.deleteNotFound("Notification")
            return redirect(controller:"user", action: "profile")
        }
        def notification = Notification.get(id)
        withForm {
            notification.delete(flush: true)
            flash.message = MessageService.deleteSuccess("Notification")
            return redirect(action: "index", id:notification.group.id)
        }.invalidToken {
            render("Bad request")
        }

    }

}
