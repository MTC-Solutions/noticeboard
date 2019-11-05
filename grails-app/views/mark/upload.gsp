<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fa fa-upload"></i>
                    Upload Marks
                </h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:uploadForm class="form-validation" useToken="true" action="extract" id="${work.id}" method="POST">
                    <p class="alert alert-info">
                        Please make sure your file is created in the right format(excel file).
                        start by putting your faculties from in Column and change only the row.
                    </p>

                    <b>Marks Spreadsheet file</b>
                    <div class="form-group">
                        <input type="file" name="file"  class="form-control"/>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-upload"></i>
                        Upload
                    </button>
                    <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_ADMIN}, ${noticeboard.IdentityService.ROLE_SUPER_ADMIN}">
                        <g:link class="btn btn-danger" action="index" id="${work.group.id}">
                            <i class="fa fa-arrow-left"></i>
                            Back
                        </g:link>
                    </sec:ifAnyGranted>
                </g:uploadForm>
            </div>
        </div>
    </div>
</div>
</body>
</html>