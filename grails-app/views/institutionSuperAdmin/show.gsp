<div class="card card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-user"></i>
            Institution admin
        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <strong><i class="fa fa-user"></i> Title:</strong> ${institutionSuperAdmin.title}<br>
        <strong><i class="fa fa-user"></i> First name:</strong> ${institutionSuperAdmin.firstName}<br>
        <strong><i class="fa fa-user"></i> Middle name:</strong> ${institutionSuperAdmin.middleName}<br>
        <strong><i class="fa fa-user"></i> Last name:</strong> ${institutionSuperAdmin.lastName}<br>
        <strong><i class="fa fa-envelope-o"></i> Email address:</strong> ${institutionSuperAdmin.email}<br>
        <strong><i class="fa fa-clock-o"></i> &nbsp; Date Created: </strong> ${institutionSuperAdmin.dateCreated}<br>
        <strong><i class="fa fa-clock-o"></i> &nbsp; Last Updated: </strong> ${institutionSuperAdmin.lastUpdated}<br><br>
        <g:form action="delete" id="${institutionSuperAdmin.id}">
            <g:link class="btn btn-primary" action="edit" id="${institutionSuperAdmin.id}">
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

