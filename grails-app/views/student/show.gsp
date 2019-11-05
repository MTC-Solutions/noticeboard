<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title"> ${student.title}
                                ${student.firstName.take(1)}.${student.middleName.take(1)}
                                ${student.lastName}</h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <strong><i class="fa fa-user-o"></i> First Name:</strong> ${student.firstName}<br>
        <g:if test="${student.middleName}">
        <strong><i class="fa fa-user-o"></i> Middle Name:</strong> ${student.middleName}<br>
        </g:if>
        <strong><i class="fa fa-user-o"></i> Last Name:</strong> ${student.lastName}<br>
        <strong><i class="fa fa-user-o"></i> Email:</strong> ${student.email}<br>
        <strong><i class="fa fa-user-o"></i> Institution:</strong> ${student.institution.name}<br>
        <strong><i class="fa fa-clock-o"></i> Date Created: </strong> ${student.dateCreated}<br>
        <strong><i class="fa fa-clock-o"></i> Last Updated: </strong> ${student.lastUpdated}<br><br>
        <g:form controller="student" action="delete" id="${student.id}">
            <g:link useToken="true" class="btn btn-primary" controller="student" action="edit" id="${student.id}">
                <i class="fa fa-pencil"></i>
                Edit Student
            </g:link>
            <g:submitButton class="btn btn-danger" name="Delete Student"/>
        </g:form>
    </div>
    <!-- /.card-body -->
</div>