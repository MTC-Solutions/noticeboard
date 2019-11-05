<div class="card card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-folder-open"></i>
            <i class="fa"></i>
            ${group.name}
        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <strong>
            <i class="fa fa-folder"></i>
            Group Name:</strong> ${group.name}
        <br>
        <strong><i class="fa fa-clock-o"></i> Date Created: </strong> ${group.dateCreated}<br>
        <strong><i class="fa fa-clock-o"></i> Last Updated: </strong> ${group.lastUpdated}<br><br>
        <g:form useToken="true" action="delete" id="${group.id}">
            <g:link class="btn btn-primary" action="edit" id="${group.id}">
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
            Group Content</h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <div class="row">
            <div class="col-md-4">
                <g:link controller="notification" action="index" id="${group.id}">
                    <i class="fa fa-bell-o"></i>
                    Notifications
                    <span class="badge badge-danger pull-right"> ${group.notifications.size()} </span>
                </g:link>
                <br>
                <g:link controller="note" action="index" id="${group.id}">
                    <i class="fa fa-book"></i>
                    Class Notes
                    <span class="badge badge-danger pull-right"> ${group.notes.size()} </span>
                </g:link>
                <br>
                <g:link controller="assignment" action="index" id="${group.id}">
                    <i class="fa fa-file-text"></i>
                    Assignments
                    <span class="badge badge-danger pull-right"> ${group.assignments.size()} </span>
                </g:link>
                <br>
                <g:link controller="work" action="index" id="${group.id}">
                    <i class="fa fa-check"></i>
                    Marks
                    <span class="badge badge-danger pull-right"> ${group.works.size()} </span>
                </g:link>
                <br>
                <g:link controller="memorandum" action="index" id="${group.id}">
                    <i class="fa fa-check-square-o"></i>
                    Memorandums
                    <span class="badge badge-danger pull-right"> ${group.memorandums.size()} </span>
                </g:link>
                <br>
                <g:link controller="group" action="students" id="${group.id}">
                    <i class="fa fa-users"></i>
                    Students
                    <span class="badge badge-danger pull-right"> ${group.students.size()} </span>
                </g:link>
                <br>
                <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_INSTRUCTOR}">
                    <g:link controller="group" action="instructors" id="${group.id}">
                        <i class="fa fa-users"></i>
                        Instructors
                        <span class="badge badge-danger pull-right"> ${group.instructors.size()} </span>
                    </g:link>
                </sec:ifNotGranted>
            </div>
        </div>

    </div>
    <!-- /.card-body -->
</div>