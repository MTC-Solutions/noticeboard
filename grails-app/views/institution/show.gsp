<div class="card card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-graduation-cap"></i>
            ${institution.name}
        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <strong><i class="fa fa-globe"></i> &nbsp; Country:</strong> ${institution.country}<br>
        <strong><i class="fa fa-globe"></i> &nbsp; City:</strong> ${institution.city}<br>
        <strong><i class="fa fa-location-arrow"></i> &nbsp; Address:</strong> ${institution.address}<br>
        <strong><i class="fa fa-code"></i> &nbsp;Postal Code:</strong> ${institution.postalCode}<br>
        <strong><i class="fa fa-envelope-o"></i> &nbsp;Email address:</strong> ${institution.email}<br>
        <strong><i class="fa fa-phone"></i> &nbsp; Phone number:</strong> ${institution.phoneNumber}<br>
        <strong><i class="fa fa-clock-o"></i> &nbsp; Date Created: </strong> ${institution.dateCreated}<br>
        <strong><i class="fa fa-clock-o"></i> &nbsp; Last Updated: </strong> ${institution.lastUpdated}<br><br>
        <g:form useToken="true" controller="institution" action="delete" id="${institution.id}">
            <g:link class="btn btn-primary" controller="institution" action="edit" id="${institution.id}">
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
            Institution Content
        </h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <div class="row">
            <div class="col-md-4">
                <g:link controller="faculty" action="index" id="${institution.id}">
                    <i class="fa fa-book"></i>
                    Faculties
                    <span class="badge badge-danger pull-right"> ${institution.faculties.size()} </span>
                </g:link>
                <br>

                <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_INSTITUTION_ADMIN}">
                    <g:link  controller="institutionSuperAdmin" action="index" id="${institution.id}">
                        <i class="fa fa-user"></i>
                        Super Admin
                    </g:link>
                    <br>
                    <g:link  controller="institutionAdmin" action="index" id="${institution.id}">
                        <i class="fa fa-users"></i>
                        Admins
                        <span class="badge badge-danger pull-right"> ${institution.institutionAdmins.size()} </span>
                    </g:link>
                    <br>
                </sec:ifNotGranted>

                <g:link  controller="instructor" action="index" id="${institution.id}">
                    <i class="fa fa-users"></i>
                    Instructors
                    <span class="badge badge-danger pull-right"> ${institution.instructors.size()} </span>
                </g:link>
                <br>

                <g:link  controller="student" action="select" id="${institution.id}">
                    <i class="fa fa-users"></i>
                    Students
                    <span class="badge badge-danger pull-right"> ${institution.students.size()} </span>
                </g:link>

            </div>
        </div>

    </div>
    <!-- /.card-body -->
</div>