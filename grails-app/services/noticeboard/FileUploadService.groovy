package noticeboard

import grails.gorm.transactions.Transactional
import grails.web.context.ServletContextHolder
import org.springframework.web.multipart.MultipartFile
import java.io.File

@Transactional
class FileUploadService {

    def uploadFile(MultipartFile file, String name, String destinationDirectory){
        def servletContext = ServletContextHolder.servletContext
        def storagePath = servletContext.getRealPath(destinationDirectory)
        def storagePathDirectory = new File(storagePath)
        if (!storagePathDirectory.exists()){
            println("Creating destination")
            if (storagePathDirectory.mkdirs()){
                println("Success making dir")
            }else {
                println("Failed creating directory")
            }
        }

        if (!file.isEmpty()){
            file.transferTo(new File("${storagePath}/${name}"))
            println("File transfer successfully")
            return "${storagePath}/${name}"
        }else {
            println("File is empty")
            return null
        }
    }
}
