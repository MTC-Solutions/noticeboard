<html>
<head>

</head>
<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fa fa-circle-o"></i>
                    Update Marks
                </h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form useToken="true" class="form-validation" controller="mark" action="update" id="${mark.id}" method="POST">

                    <b>Student number</b>
                    <div class="form-group">
                        <g:textField value="${mark.markStudentNumber}" class = "form-control" placeholder="Student number" name="markStudentNumber"/>
                    </div>

                    <b>Achieved mark</b>
                    <div class="form-group">
                        <g:textField value="${mark.achievedMark}" class = "form-control"  name="achievedMark"/>
                    </div>


                    <b>Progress</b>
                    <div class="form-group">
                        <g:textField value="${mark.progress}" class = "form-control"  name="progress"/>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
                    </button>
                    <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_ADMIN}, ${noticeboard.IdentityService.ROLE_SUPER_ADMIN}">
                        <g:link class="btn btn-danger" action="index" id="${work.id}">
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