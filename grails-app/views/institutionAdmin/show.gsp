<div class="card card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-user"></i>
            Institution admin
        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <strong><i class="fa fa-user"></i> Title:</strong> ${institutionAdmin.title}<br>
        <strong><i class="fa fa-user"></i> First name:</strong> ${institutionAdmin.firstName}<br>
        <strong><i class="fa fa-user"></i> Middle name:</strong> ${institutionAdmin.middleName}<br>
        <strong><i class="fa fa-user"></i> Last name:</strong> ${institutionAdmin.lastName}<br>
        <strong><i class="fa fa-envelope-o"></i> Email address:</strong> ${institutionAdmin.email}<br>
        <strong><i class="fa fa-clock-o"></i> &nbsp; Date Created: </strong> ${institutionAdmin.dateCreated}<br>
        <strong><i class="fa fa-clock-o"></i> &nbsp; Last Updated: </strong> ${institutionAdmin.lastUpdated}<br><br>
        <g:form useToken="true" action="delete" id="${institutionAdmin.id}">
            <g:link class="btn btn-primary" action="edit" id="${institutionAdmin.id}">
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

