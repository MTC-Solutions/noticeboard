
<div class="card card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-folder-open-o"></i>
            <i class="fa"></i>
            ${note.folder}

        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">

        <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
            <p>
                ${note.description}
            </p>
            <strong><i class="fa fa-clock-o"></i> Date Created: </strong> ${note.dateCreated}<br>
            <strong><i class="fa fa-clock-o"></i> Last Updated: </strong> ${note.lastUpdated}<br><br>
            <g:form useToken="true" action="delete" id="${note.id}">
                <g:link class="btn btn-primary" action="edit" id="${note.id}">
                    <i class="fa fa-pencil"></i>
                    Edit
                </g:link>
                <button type="submit" class="btn btn-danger">
                    <i class="fa fa-trash"></i>
                    Delete
                </button>
            </g:form>
        </sec:ifNotGranted>

        <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
            ${note.description}<br>
            <small>
                <b><i class="fa fa-clock-o"></i>
                    Posted:
                </b><prettytime:display date="${note.dateCreated}"/>
            </small>
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
            <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <g:link class="btn btn-success btn-sm" controller="file" action="note" id="${group.id}">
                    <i class="fa fa-upload"></i>
                    Upload
                </g:link>
            </sec:ifNotGranted>
        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">

        </sec:ifAllGranted>

    </div>
    <!-- /.card-body -->
</div>
