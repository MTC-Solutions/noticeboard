<html>
<head>

</head>
<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h3 class="card-title">Update Admin</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" useToken="true" action = "update" id="${admin.id}" method="post">
                    <div class="form-group">
                        <g:textField value="${admin.title}" class = "form-control" placeholder="Title" name="title"/>
                    </div>
                    <div class="form-group">
                        <g:textField value="${admin.firstName}" class = "form-control" placeholder="First Name" name="firstName"/>
                    </div>
                    <div class="form-group">
                        <g:textField value="${admin.middleName}" class = "form-control" placeholder="Middle Name" name="middleName"/>
                    </div>
                    <div class="form-group">
                        <g:textField value="${admin.lastName}" class = "form-control" placeholder="Last Name" name="lastName"/>
                    </div>
                    <div class="form-group">
                        <g:textField value="${admin.email}" class = "form-control" placeholder="Email" name="email"/>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-pencil"></i>
                        Update
                    </button>
                    <a href="" class="btn btn-danger">
                        <i class="fa fa-times"></i>
                        Cancel
                    </a>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
