<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-upload"></i>
                    Upload Faculties
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:uploadForm useToken="true" action="extract" id="${institution.id}" method="POST">
                    <p class="alert alert-warning">
                        Please make sure your file is created in the right format(excel file).
                        start by putting your faculties from in Column and change only the row.
                    </p>
                    <div class="form-group">
                        <input type="file" name="file"  class="form-control"/>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-upload"></i>
                        Upload
                    </button>
                        <g:link class="btn btn-danger" action="index" id="${institution.id}">
                            <i class="fa fa-arrow-left"></i>
                            Back
                        </g:link>
                </g:uploadForm>
            </div>
        </div>
    </div>
</div>
</body>
</html>