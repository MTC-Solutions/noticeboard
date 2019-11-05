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
                    Create Work
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" useToken="true" controller="work" action="save" id="${group.id}" method="POST">
                    <b>Work name</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Work Name" name="name"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${work}">
                                <g:renderErrors  bean="${work}" field="name"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Total Mark</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Total Mark" name="totalMark"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${work}">
                                <g:renderErrors  bean="${work}" field="totalMark"/>
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