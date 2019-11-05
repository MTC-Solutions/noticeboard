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
                    <i class="fa"></i>
                    Edit class notes
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form useToken="true" class="form-validation" action="update" id="${note.id}" method="POST">
                    <div class="form-group">
                        <g:textField value="${note.folder}" class = "form-control" name="folder"/>
                    </div>

                    <div class="form-group">
                        <g:textArea rows="8" value="${note.description}" row="4" class = "form-control" name="description"/>
                    </div>


                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-circle-o"></i>
                        Update
                    </button>
                    <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_ADMIN}, ${noticeboard.IdentityService.ROLE_SUPER_ADMIN}">
                        <g:link class="btn btn-danger" action="index" id="${group.id}">
                            <i class="fa fa-arrow-left"></i>
                            Back
                        </g:link>
                    </sec:ifAnyGranted>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
