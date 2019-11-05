<div class="card card-primary">
    <div class="card-header">
        <h5 class="card-title">${faculty.name}</h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <strong><i class="fa fa-home"></i> Faculty Name:</strong> ${faculty.name}
        <br>
        <strong><i class="fa fa-globe"></i> Institution:</strong>
        <g:link controller="institution" action="show" id="${faculty.institution.id}">
            ${faculty.institution.name}
        </g:link>
        <br>
        <strong><i class="fa fa-clock-o"></i> Date Created: </strong> ${faculty.dateCreated}<br>
        <strong><i class="fa fa-clock-o"></i> Last Updated: </strong> ${faculty.lastUpdated}<br><br>
        <g:form controller="faculty" action="delete" id="${faculty.id}">
            <g:link class="btn btn-primary" controller="faculty" action="edit" id="${faculty.id}">
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
            Faculty Content
        </h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <div class="row">
            <div class="col-md-4">

                <g:link class="nav-link" controller="course" action="index" id="${faculty.id}">
                    <i class="fa fa-book"></i>
                    Courses
                    <span class="badge badge-danger pull-right"> ${faculty.courses.size()} </span>
                </g:link>

            </div>
        </div>

    </div>
    <!-- /.card-body -->
</div>