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
                    Edit Memorandum
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form useToken = "true" class="form-validation" action="save" id="${group.id}" method="POST">
                    <b>Memorandum Folder</b>
                    <div class="form-group">
                        <g:textField value="${memorandum.folder}" class = "form-control" name="folder"/>
                    </div>

                    <b>Memorandum Description</b>
                    <div class="form-group">
                        <g:textArea value="${memorandum.description}" class = "form-control" name="description"/>
                    </div>


                    <button type="submit" class="btn btn-primary btn-sm">
                        <i class="fa fa-circle-o"></i>
                        Update
                    </button>
                    <a href="" class="btn btn-danger btn-sm">
                        <i class="fa fa-times"></i>
                        Cancel
                    </a>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
