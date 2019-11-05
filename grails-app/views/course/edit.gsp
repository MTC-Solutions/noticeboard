<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-pencil"></i>
                    Edit Course
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validationf" useToken="true" controller="course" action="update" id="${course.id}" method="POST">
                    <div class="form-group">
                        <g:textField value="${course.name}" class = "form-control" placeholder="Course Name" name="name"/>
                        <g:hasErrors bean="${course}">
                            <g:renderErrors  bean="${course}" field="name"/>
                        </g:hasErrors>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-circle-o"></i>
                        Upload
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