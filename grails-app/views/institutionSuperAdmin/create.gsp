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
                    Create Institution Super Admin
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:hasErrors bean="${institutionSuperAdmin}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <g:renderErrors bean="${institutionSuperAdmin}"/>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </g:hasErrors>


                <g:form class="form-validation" useToken="true" action="save" id="${institution.id}">
                    <b>Title</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Title e.g. Mr/Prof" name="title"/>
                    </div>

                    <b>First name</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="First name" name="firstName"/>
                    </div>

                    <b>Middle name</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Middle name" name="middleName"/>
                    </div>

                    <b>Last name</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Last name" name="lastName"/>
                    </div>

                    <b>Email address</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Email address" name="email"/>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
                    </button>
                    <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_ADMIN}, ${noticeboard.IdentityService.ROLE_SUPER_ADMIN}">
                        <g:link class="btn btn-danger" action="index" id="${institution.id}">
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
