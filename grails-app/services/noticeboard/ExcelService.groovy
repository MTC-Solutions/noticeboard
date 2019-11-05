package noticeboard

import grails.gorm.transactions.Transactional
import noticeboard.auth.Role
import noticeboard.auth.User
import noticeboard.auth.UserRole
import org.apache.poi.ss.usermodel.Cell
import org.apache.poi.xssf.usermodel.XSSFSheet
import org.apache.poi.xssf.usermodel.XSSFWorkbook

@Transactional
class ExcelService {

    //import faculty into an existing institution
    def importFaculties(XSSFWorkbook workbook, Institution institution){
        XSSFSheet sheet1 = workbook.getSheetAt(0)
        def rowNum = sheet1.getLastRowNum()

        for (int i=1; i <= rowNum; i++){
            String name = sheet1.getRow(i).getCell(0).getStringCellValue()
            institution.addToFaculties(new Faculty(name: name))
            institution.save(flush:true)
        }
    }

    //import course into an existing faculty
    def importCourses(XSSFWorkbook workbook, Faculty faculty){
        XSSFSheet sheet1 = workbook.getSheetAt(0)
        def rowNum = sheet1.getLastRowNum()

        for (int i=1; i <= rowNum; i++){
            String name = sheet1.getRow(i).getCell(0).getStringCellValue()
            faculty.addToCourses(new Course(name: name))
            faculty.save(flush:true)
        }
    }

    //import modules into an existing course
    def importModules(XSSFWorkbook workbook, Course course){
        XSSFSheet sheet1 = workbook.getSheetAt(0)
        def rowNum = sheet1.getLastRowNum()
        for (int i=1; i <= rowNum; i++){
            String name = sheet1.getRow(i).getCell(0).getStringCellValue()
            String code = sheet1.getRow(i).getCell(1).getStringCellValue()
            course.addToModules(new Module(name: name,code: code ))
            course.save(flush:true)
        }
    }

    //import student to institution
    def importStudentsToInstitution(XSSFWorkbook workbook, Institution institution){
        XSSFSheet sheet1 = workbook.getSheetAt(0)
        def rowNum = sheet1.getLastRowNum()
        for (int i=1; i <= rowNum; i++){
            String title = sheet1.getRow(i).getCell(0).getStringCellValue()
            String firstName = sheet1.getRow(i).getCell(1).getStringCellValue()
            String middleName = sheet1.getRow(i).getCell(2).getStringCellValue()
            String lastName = sheet1.getRow(i).getCell(3).getStringCellValue()

            //making sure we get the value a string
            def row = sheet1.getRow(i)
            def cell = row.getCell(4)
            cell.setCellType(Cell.CELL_TYPE_STRING)
            String studentNumber = cell.getStringCellValue()

            String email = sheet1.getRow(i).getCell(5).getStringCellValue().trim()

            institution.addToStudents(new Student(
                    title: title,
                    firstName: firstName,
                    middleName: middleName,
                    lastName: lastName,
                    studentNumber:studentNumber,
                    email: email
            ))
            institution.save(flush:true)
            if(institution.students.contains(Student.findByEmail(email))){
                def studentRole = Role.findOrSaveWhere(authority: IdentityService.ROLE_STUDENT)
                def studentUser = User.findOrSaveWhere(username: email, password: "password")

                if (!studentUser.authorities.contains(studentRole)){
                    UserRole.create(studentUser,studentRole,true)
                }
            }
        }
    }

    //import students to a module
    def importMarks(XSSFWorkbook workbook,Work work){

        XSSFSheet sheet1 = workbook.getSheetAt(0)
        def rowNum = sheet1.getLastRowNum()

        //check
        for (int i=1; i <= rowNum; i++){
            //making sure we get the value a string
            def row = sheet1.getRow(i)
            def cell = row.getCell(0)
            cell.setCellType(Cell.CELL_TYPE_STRING)
            String studentNumber = cell.getStringCellValue()

            String achievedMark = sheet1.getRow(i).getCell(1).getNumericCellValue().toString()
            String totalMark = sheet1.getRow(i).getCell(2).getNumericCellValue().toString()
            String progress = sheet1.getRow(i).getCell(3).getStringCellValue()

            if (work.group.students.contains(Student.findByStudentNumber(studentNumber))){
                work.addToMarks(new Mark(
                        markStudentNumber: studentNumber,
                        achievedMark: achievedMark,
                        progress: progress
                ))

                work.save(flush:true)
            }
        }
    }

    //import students to a group
    def importStudentsToGroup(XSSFWorkbook workbook,Institution institution, Group group){

        XSSFSheet sheet1 = workbook.getSheetAt(0)
        def rowNum = sheet1.getLastRowNum()

        def error = [:]

        for (int i=1; i <= rowNum; i++){
            //making sure we get the value a string
            def row = sheet1.getRow(i)
            def cell = row.getCell(0)
            cell.setCellType(Cell.CELL_TYPE_STRING)
            String studentNumber = cell.getStringCellValue().trim()

            if(institution.students.contains(Student.findByStudentNumber(studentNumber))){
                def s = Student.findByStudentNumber(studentNumber)
                group.addToStudents(s)
            }
            group.save(flush:true)
        }
    }

    //import instructors to institution
    def importInstructorsToInstitution(XSSFWorkbook workbook, Institution institution){
        XSSFSheet sheet1 = workbook.getSheetAt(0)
        def rowNum = sheet1.getLastRowNum()
        for (int i=1; i <= rowNum; i++){
            String title = sheet1.getRow(i).getCell(0).getStringCellValue()
            String firstName = sheet1.getRow(i).getCell(1).getStringCellValue()
            String middleName = sheet1.getRow(i).getCell(2).getStringCellValue()
            String lastName = sheet1.getRow(i).getCell(3).getStringCellValue()
            String email = sheet1.getRow(i).getCell(4).getStringCellValue().trim()

            institution.addToInstructors(new Instructor(
                    title: title,
                    firstName: firstName,
                    middleName: middleName,
                    lastName: lastName,
                    email: email
            ))
            institution.save(flush:true)
            if(institution.instructors.contains(Instructor.findByEmail(email))){
                def instructorRole = Role.findOrSaveWhere(authority: IdentityService.ROLE_INSTRUCTOR)
                def instructorUser = User.findOrSaveWhere(username: email, password: "password")

                if (!instructorUser.authorities.contains(instructorRole)){
                    UserRole.create(instructorUser,instructorRole,true)
                }
            }
        }
    }

    //import instructors to a group
    def importInstructorsToGroup(XSSFWorkbook workbook,Institution institution, Group group){

        XSSFSheet sheet1 = workbook.getSheetAt(0)
        def rowNum = sheet1.getLastRowNum()

        def error = [:]

        for (int i=1; i <= rowNum; i++){
            //making sure we get the value a string
            def row = sheet1.getRow(i)
            def cell = row.getCell(0)
            cell.setCellType(Cell.CELL_TYPE_STRING)
            String email = cell.getStringCellValue().trim()

            if(institution.students.contains(Instructor.findByEmail(email))){
                def instructor = Instructor.findByEmail(email)
                group.addToInstructors(instructor)
                instructor.save()
            }
        }
    }
}
