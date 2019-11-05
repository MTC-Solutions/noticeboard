<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-plus"></i>
                    <i class="fa"></i>
                    Add a student to ${module.name}
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" controller="module" action="addStudent" id="${module.id}" method="POST">
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Email" name="email"/>
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