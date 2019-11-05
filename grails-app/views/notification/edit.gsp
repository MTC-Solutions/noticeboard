<html>
<head>

</head>
<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-pencil"></i>
                    Edit Notification
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form useToken="true" class="form-validation" controller="notification" action="update" id="${notification.id}" method="POST">

                    <b>Notification</b>
                    <div class="form-group">
                        <g:textArea rows="8" value="${notification.description}" class = "form-control" name="description"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${newNotification}">
                                <g:renderErrors  bean="${newNotification}" field="description"/>
                            </g:hasErrors>
                        </div>
                    </div>


                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-circle-o"></i>
                        Update
                    </button>
                        <g:link class="btn btn-danger" action="index" id="${notification.id}">
                            <i class="fa fa-arrow-left"></i>
                            Back
                        </g:link>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
