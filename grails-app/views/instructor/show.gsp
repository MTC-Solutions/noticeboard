<div class="card card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-user-o"></i>
            <i class="fa"></i>
            ${instructor.title}
            ${instructor.firstName.take(1)}.${instructor.middleName.take(1)}.
            ${instructor.lastName}
        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <strong><i class="fa fa-user-o"></i> First name:</strong> ${instructor.firstName}<br>
        <strong><i class="fa fa-user-o"></i> Middle name:</strong> ${instructor.middleName}<br>
        <strong><i class="fa fa-user-o"></i> Last Nname:</strong> ${instructor.lastName}<br>
        <strong><i class="fa fa-envelope-o"></i> Email:</strong> ${instructor.email}<br>
        <strong><i class="fa fa-graduation-cap"></i> Institution:</strong> ${instructor.institution.name}<br>
        <strong><i class="fa fa-clock-o"></i> Date Created: </strong> ${instructor.dateCreated}<br>
        <strong><i class="fa fa-clock-o"></i> Last Updated: </strong> ${instructor.lastUpdated}<br><br>
        <g:form controller="instructor" action="delete" id="${instructor.id}">
            <g:link class="btn btn-primary" controller="instructor" action="edit" id="${instructor.id}">
                <i class="fa fa-pencil"></i>
                Edit
            </g:link>
            <button type="submit" class="btn btn-danger">
                <i class="fa fa-trash"></i>
                Delete
            </button>
        </g:form>

    </div>
    <!-- /.card-body -->
</div>