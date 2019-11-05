<div class="card card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-book"></i>
            <i class="fa"></i>
            ${module.code}
        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <strong><i class="fa fa-book"></i> Module Name:</strong> ${module.name}
            <br>
        <strong><i class="fa fa-home"></i> Institution Name:</strong>
        <g:link controller="institution" action="show" id="${module.course.faculty.institution.id}">
            ${module.course.faculty.institution.name}
        </g:link>
            <br>
        <strong><i class="fa fa-home"></i> Faculty Name:</strong>
        <g:link controller="institution" action="show" id="${module.course.faculty.id}">
            ${module.course.faculty.name}
        </g:link>
        <br>
        <strong><i class="fa fa-book"></i> Course Name:</strong>
        <g:link controller="institution" action="show" id="${module.course.id}">
            ${module.course.name}
        </g:link>
            <br>
        <strong><i class="fa fa-clock-o"></i> Date Created: </strong> ${module.dateCreated}<br>
        <strong><i class="fa fa-clock-o"></i> Last Updated: </strong> ${module.lastUpdated}<br><br>
        <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_INSTITUTION_ADMIN}, ${noticeboard.IdentityService.ROLE_INSTITUTION_SUPER_ADMIN}">
            <g:form useToken="true" action="delete" id="${module.id}">
                <g:link class="btn btn-primary" action="edit" id="${module.id}">
                    <i class="fa fa-pencil"></i>
                    Edit
                </g:link>
                <button type="submit" class="btn btn-danger">
                    <i class="fa fa-trash"></i>
                    Delete
                </button>
            </g:form>
        </sec:ifAnyGranted>
    </div>
    <!-- /.card-body -->
</div>

<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-database"></i>
            Module Content</h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <div class="row">
            <div class="col-md-4">
                <g:link controller="group" action="index" id="${module.id}">
                    <i class="fa fa-database"></i>
                    Group
                    <span class="badge badge-danger pull-right"> ${module.groups.size()} </span>
                </g:link>
            </div>
        </div>

    </div>
    <!-- /.card-body -->
</div>