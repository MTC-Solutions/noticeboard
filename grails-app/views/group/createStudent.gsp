<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-plus"></i>
                    <i class="fa"></i>
                    Add a student to ${group.name}
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" useToken = "true" controller="group" action="saveStudent" id="${group.id}" method="POST">
                    <b>Student Number</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Student Number" name="studentNumber"/>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-plus"></i>
                        Add Student
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