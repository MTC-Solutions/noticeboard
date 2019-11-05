<html>
<head>

</head>
<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-plus"></i>
                    Create Notification
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" useToken="true" controller="notification" action="save" id="${group.id}" method="POST">

                    <b>Notification</b>
                    <div class="form-group">
                        <g:textArea rows="8" class = "form-control" placeholder="Notification" name="description"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${notification}">
                                <g:renderErrors  bean="${notification}" field="description"/>
                            </g:hasErrors>
                        </div>
                    </div>


                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
                    </button>
                    <g:link class="btn btn-danger" action="index" id="${group.id}">
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
