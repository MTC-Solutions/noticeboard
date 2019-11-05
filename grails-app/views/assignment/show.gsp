
<div class="card card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-pencil"></i>
            <i class="fa"></i>
            ${assignment.folder}
        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">

        <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                ${assignment.description}
            <hr>
            <strong><i class="fa fa-clock-o"></i> Date Created: </strong> ${assignment.dateCreated}<br>
            <strong><i class="fa fa-clock-o"></i> Last Updated: </strong> ${assignment.lastUpdated}<br><br>
            <g:form useToken="true" action="delete" id="${assignment.id}">

                <g:link class="btn btn-primary btn-sm" action="edit" id="${assignment.id}">
                    <i class="fa fa-pencil"></i>
                    Edit
                </g:link>
                <button type="submit" class="btn btn-danger btn-sm">
                    <i class="fa fa-trash"></i>
                    Delete
                </button>
            </g:form>
        </sec:ifNotGranted>

        <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
            <p>
                ${assignment.description}

            </p>
            <strong><i class="fa fa-clock-o"></i> Posted on: </strong>
            <prettytime:display date="${assignment.dateCreated}"/>
        </sec:ifAllGranted>

    </div>
    <!-- /.card-body -->
</div>


<div class="card card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-folder-open-o"></i>
            <i class="fa"></i>
            Files
            <g:link class="btn btn-success btn-sm" action="edit" id="${assignment.id}">
                <i class="fa fa-upload"></i>
                Upload
            </g:link>
        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">

        ${assignment.group.module.name}

        <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">

        </sec:ifAllGranted>

    </div>
    <!-- /.card-body -->
</div>
