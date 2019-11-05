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
                    Edit Student
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">

                <g:form class="form-validation" useToken="true" action="update" id="${student.id}">
                    <b>Title</b>
                    <div class="form-group">
                        <g:textField value="${student.title}" class = "form-control"  name="title"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${student}">
                                <g:renderErrors  bean="${student}" field="title"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>First name</b>
                    <div class="form-group">
                        <g:textField value="${student.firstName}" class = "form-control"  name="firstName"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${student}">
                                <g:renderErrors  bean="${student}" field="firstName"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Middle name</b>
                    <div class="form-group">
                        <g:textField value="${student.middleName}" class = "form-control"  name="middleName"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${student}">
                                <g:renderErrors  bean="${student}" field="middleName"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Last name</b>
                    <div class="form-group">
                        <g:textField value="${student.lastName}" class = "form-control"  name="lastName"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${student}">
                                <g:renderErrors  bean="${student}" field="lastName"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Student number</b>
                    <div class="form-group">
                        <g:textField value="${student.studentNumber}" class = "form-control" name="studentNumber"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${student}">
                                <g:renderErrors  bean="${student}" field="studentNumber"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <b>Email address</b>
                    <div class="form-group">
                        <g:textField value="${student.email}" class = "form-control"  name="email"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${student}">
                                <g:renderErrors  bean="${student}" field="email"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
                    </button>
                        <g:link class="btn btn-danger" action="index" id="${student.institution.id}">
                            <i class="fa fa-arrow-left"></i>
                            Back
                        </g:link>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
