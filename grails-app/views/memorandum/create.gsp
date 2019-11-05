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
                    <i class="fa"></i>
                    Create Memorandum
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form useToken = "true" class="form-validation" action="save" id="${group.id}" method="POST">
                    <b>Memorandum Folder</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Memorandum Folder" name="folder"/>
                    </div>

                    <b>Memorandum Description</b>
                    <div class="form-group">
                        <g:textArea rows = "8" class = "form-control" placeholder="Memorandum Description" name="description"/>
                    </div>


                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-plus"></i>
                        Save
                    </button>
                    <a href="" class="btn btn-danger">
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
