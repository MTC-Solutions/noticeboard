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
                    Create Student
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
            <g:form class="form-validation" useToken="true" action="save" id="${institution.id}">
                <b>Title</b>
                <div class="form-group">
                    <g:textField class = "form-control" placeholder="Title e.g. Mr/Prof" name="title"/>
                    <div class="text-danger">
                    <g:hasErrors bean="${student}">
                        <g:renderErrors  bean="${student}" field="title"/>
                    </g:hasErrors>
                    </div>
                </div>

                <b>First name</b>
                <div class="form-group">
                    <g:textField class = "form-control" placeholder="First name" name="firstName"/>
                    <div class="text-danger">
                        <g:hasErrors bean="${student}">
                            <g:renderErrors  bean="${student}" field="firstName"/>
                        </g:hasErrors>
                    </div>
                </div>

                <b>Middle name</b>
                <div class="form-group">
                    <g:textField class = "form-control" placeholder="Middle name" name="middleName"/>
                    <div class="text-danger">
                        <g:hasErrors bean="${student}">
                            <g:renderErrors  bean="${student}" field="middleName"/>
                        </g:hasErrors>
                    </div>
                </div>

                <b>Last name</b>
                <div class="form-group">
                    <g:textField class = "form-control" placeholder="Last name" name="lastName"/>
                    <div class="text-danger">
                        <g:hasErrors bean="${student}">
                            <g:renderErrors  bean="${student}" field="lastName"/>
                        </g:hasErrors>
                    </div>
                </div>

                <b>Student number</b>
                <div class="form-group">
                    <g:textField class = "form-control" placeholder="Student Number" name="studentNumber"/>
                    <div class="text-danger">
                        <g:hasErrors bean="${student}">
                            <g:renderErrors  bean="${student}" field="studentNumber"/>
                        </g:hasErrors>
                    </div>
                </div>

                <b>Email address</b>
                <div class="form-group">
                    <g:textField class = "form-control" placeholder="Email address" name="email"/>
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
                    <g:link class="btn btn-danger" action="index" id="${institution.id}">
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
