<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-upload"></i>
                    Upload memorandum
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:uploadForm class="form-validation" action="uploadMemorandum" id="${memorandum.id}" method="POST">
                    <b>Memorandum file</b>
                    <p class="text-danger">Maximum size 25MB</p>
                    <div class="form-group">
                        <input type="file" name="file"  class="form-control"/>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-upload"></i>
                        Upload
                    </button>
                    <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_ADMIN}, ${noticeboard.IdentityService.ROLE_SUPER_ADMIN}">
                        <g:link class="btn btn-danger" controller="memorandum" action="show" id="${memorandum.module.id}">
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