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
                    <i class="fa"></i>
                    Edit Instructor
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-valfidation" useToken="true" action="update" id="${instructor.id}" method="POST">
                    <b>Title</b>
                    <div class="form-group">
                        <g:textField value="${instructor.title}" class = "form-control"  name="title"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${newInstructor}">
                                <g:renderErrors  bean="${newInstructor}" field="title"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>First name</b>
                    <div class="form-group">
                        <g:textField value="${instructor.firstName}" class = "form-control"  name="firstName"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${newInstructor}">
                                <g:renderErrors  bean="${newInstructor}" field="firstName"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Middle name</b>
                    <div class="form-group">
                        <g:textField value="${instructor.middleName}" class = "form-control" name="middleName"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${newInstructor}">
                                <g:renderErrors  bean="${newInstructor}" field="middleName"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Last name</b>
                    <div class="form-group">
                        <g:textField value="${instructor.lastName}" class = "form-control" name="lastName"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${newInstructor}">
                                <g:renderErrors  bean="${newInstructor}" field="lastName"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Email address</b>
                    <div class="form-group">
                        <g:textField value="${instructor.email}" class = "form-control"  name="email"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${newInstructor}">
                                <g:renderErrors  bean="${newInstructor}" field="email"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
                    </button>
                    <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_ADMIN}, ${noticeboard.IdentityService.ROLE_SUPER_ADMIN}">
                        <g:link class="btn btn-danger" action="index" id="${instructor.institution.id}">
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
