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
                    Create Instructor
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-valicdation" useToken="true" action="save" id="${institution.id}" method="POST">
                    <b>Title</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Title e.g. Mr/Prof" name="title"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${instructor}">
                                <g:renderErrors  bean="${instructor}" field="title"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>First name</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="First name" name="firstName"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${instructor}">
                                <g:renderErrors  bean="${instructor}" field="firstName"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Middle name</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Middle name" name="middleName"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${instructor}">
                                <g:renderErrors  bean="${instructor}" field="middleName"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Last name</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Last name" name="lastName"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${instructor}">
                                <g:renderErrors  bean="${instructor}" field="lastName"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Email address</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Email address" name="email"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${instructor}">
                                <g:renderErrors  bean="${instructor}" field="email"/>
                            </g:hasErrors>
                        </div>
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
