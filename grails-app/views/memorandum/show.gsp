
<div class="card card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-folder-open-o"></i>
            <i class="fa"></i>
            ${memorandum.folder}
        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">

        <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                ${memorandum.description} <hr>
            <strong><i class="fa fa-clock-o"></i> Date Created: </strong> ${memorandum.dateCreated}<br>
            <strong><i class="fa fa-clock-o"></i> Last Updated: </strong> ${memorandum.lastUpdated}<br><br>
            <g:form action="delete" id="${memorandum.id}">

                <g:link class="btn btn-primary btn-sm" action="edit" id="${memorandum.id}">
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
                ${memorandum.description}
            </p>
            <strong><i class="fa fa-clock-o"></i> Posted on: </strong>
            <prettytime:display date="${memorandum.dateCreated}"/>
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
            <g:link class="btn btn-success btn-sm" controller="file" action="uploadMemorandum" id="${memorandum.id}">
                <i class="fa fa-upload"></i>
                Upload
            </g:link>
        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">



        <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">

        </sec:ifAllGranted>

    </div>
    <!-- /.card-body -->
</div>
