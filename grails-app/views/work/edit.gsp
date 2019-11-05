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
                    Update Work
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" useToken="true" controller="work" action="update" id="${work.id}" method="POST">
                    <b>Work name</b>
                    <div class="form-group">
                        <g:textField value="${work.name}" class = "form-control" placeholder="Work Name" name="name"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${newWork}">
                                <g:renderErrors  bean="${newWork}" field="name"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Total Mark</b>
                    <div class="form-group">
                        <g:textField value="${work.totalMark}" class = "form-control" placeholder="Work Name" name="totalMark"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${newWork}">
                                <g:renderErrors  bean="${newWork}" field="totalMark"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
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