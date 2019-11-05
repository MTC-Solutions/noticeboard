<div class="card card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-bell"></i>
            Notification
        </h5>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
        <p>${notification.description}</p>
        <small>
            <strong><i class="fa fa-clock-o"></i> Created: </strong>
            <prettytime:display showTime="true" date="${notification.dateCreated}"/>
            <br>
            <strong><i class="fa fa-clock-o"></i>  Updated: </strong>
            <prettytime:display showTime="true" date="${notification.lastUpdated}"/>
        </small>
        <g:form useToken="true" controller="notification" action="delete" id="${notification.id}">
            <g:link class="btn btn-primary" controller="notification" action="edit" id="${notification.id}">
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