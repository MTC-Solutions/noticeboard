package noticeboard

import grails.plugin.springsecurity.annotation.Secured


@Secured(["ROLE_INSTRUCTOR"])
class FileController {
    FileUploadService fileUploadService
    static layout = "app"

    //note
    def note(Long id){
        def group = Group.get(id)
        return [group:group]
    }

    def uploadNote(){
        def file = request.getFile("file")
        if(!file){
            return render("Is empty")
        }
        def serverDir = servletContext.getRealPath("/")
        def homeDir = new java.io.File(System.getProperty("user.home"))
        java.io.File fileDigest = new java.io.File(homeDir, "files")
        fileDigest.mkdirs()
        if(fileDigest){
            file.transferTo(fileDigest)
            return ("Done")
        }else{
            fileDigest.mkdirs()
            file.transferTo(fileDigest)
            return render("Directory created and file uploaded successfully")
        }
    }

    //notification
    def assignment(Long id){
        def assignment = Assignment.get(id)
        return [assignment:assignment, module:assignment.module]
    }

    def uploadAssignment(Long id){
        def file = request.getFile("file")
        def webRoot = servletContext.getRealPath("/")
        File fileDigest = new File(webRoot,"files/memorandums")
        file.transferTo(fileDigest)

        def module = Note.get(id).module
        return redirect(controller:"notification",action:"show", id:module.id)
    }

    //assignment
    def memorandum(Long id){
        def memorandum = Memorandum.get(id)
        return [memorandum:memorandum, module:memorandum.module]
    }

    def uploadMemorandum(Long id){
        def file = request.getFile("file")
        def webRoot = servletContext.getRealPath("/")
        File fileDigest = new File(webRoot,"files/assignments")
        file.transferTo(fileDigest)

        def module = Note.get(id).module
        return redirect(controller: "assignment",action:"show", id:module.id)
    }
}
