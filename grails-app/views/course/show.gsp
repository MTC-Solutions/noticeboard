<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">
            ${course.name}
        </h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <strong><i class="fa fa-book"></i> Course Name:</strong> ${course.name}
        <br>
        <strong><i class="fa fa-home"></i> Institution:</strong>
        <g:link controller="institution" action="show" id="${course.faculty.institution.id}">
            ${course.faculty.institution.name}
        </g:link>
        <br>
        <strong><i class="fa fa-table"></i> Faculty Name:</strong>
        <g:link controller="faculty" action="show" id="${course.faculty.id}">
            ${course.faculty.name}
        </g:link>
        <br>
        <strong><i class="fa fa-clock-o"></i> Date Created: </strong> ${course.dateCreated}<br>
        <strong><i class="fa fa-clock-o"></i> Last Updated: </strong> ${course.lastUpdated}<br><br>
        <g:form useToken="true" controller="course" action="delete" id="${course.id}">
            <g:link class="btn btn-primary" controller="course" action="edit" id="${course.id}">
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

<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">
            <i class="fa fa-database"></i>
            Course Content
        </h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <div class="row">
            <div class="col-md-4">
                <g:link controller="module" action="index" id="${course.id}">
                    <i class="fa fa-book"></i>
                    Modules
                    <span class="badge badge-danger pull-right"> ${course.modules.size()} </span>
                </g:link>
            </div>
        </div>
    </div>
    <!-- /.card-body -->
</div>