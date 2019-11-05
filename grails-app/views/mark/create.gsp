<html>
    <head>

    </head>
<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">
                    <i class="fa fa-plus"></i>
                    Add Marks for ${work.name}
                </h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" useToken="true" controller="mark" action="save" id="${work.id}" method="POST">

                    <b>Student number</b>
                    <div class="form-group">
                        <g:textField value="${}" class = "form-control" placeholder="Student number" name="markStudentNumber"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${mark}">
                                <g:renderErrors  bean="${mark}" field="markStudentNumber"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Achieved mark</b>
                    <div class="form-group">
                        <g:textField value="${}" class = "form-control" placeholder="Achieved Mark" name="achievedMark"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${mark}">
                                <g:renderErrors  bean="${mark}" field="achievedMark"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Progress</b>
                    <div class="form-group">
                        <g:textField value="${}" class = "form-control" placeholder="Progress" name="progress"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${mark}">
                                <g:renderErrors  bean="${mark}" field="progress"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
                    </button>
                    <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_ADMIN}, ${noticeboard.IdentityService.ROLE_SUPER_ADMIN}">
                        <g:link class="btn btn-danger" controller="work" action="show" id="${work.id}">
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