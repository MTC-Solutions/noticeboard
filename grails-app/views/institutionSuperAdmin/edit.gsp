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
                    Edit Institution Super Admin
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" useToken="true" action="update" id="${institutionSuperAdmin.id}">
                    <b>Title</b>
                    <div class="form-group">
                        <g:textField value="${institutionSuperAdmin.title}" class = "form-control" name="title"/>
                    </div>

                    <b>First name</b>
                    <div class="form-group">
                        <g:textField value="${institutionSuperAdmin.firstName}" class = "form-control" name="firstName"/>
                    </div>

                    <b>Middle name</b>
                    <div class="form-group">
                        <g:textField value="${institutionSuperAdmin.middleName}" class = "form-control" name="middleName"/>
                    </div>

                    <b>Last name</b>
                    <div class="form-group">
                        <g:textField value="${institutionSuperAdmin.lastName}" class = "form-control" name="lastName"/>
                    </div>

                    <b>Email address</b>
                    <div class="form-group">
                        <g:textField value="${institutionSuperAdmin.email}" class = "form-control" placeholder="Email address" name="email"/>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
                    </button>
                    <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_ADMIN}, ${noticeboard.IdentityService.ROLE_SUPER_ADMIN}">
                        <g:link class="btn btn-danger" action="index" id="${institutionSuperAdmin.institution.id}">
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
