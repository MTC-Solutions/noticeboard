<body>
    <div class="row">
        <div class="col-md-8 mx-auto">
            <div class="card card-primary">
                <div class="card-header">
                    <h5 class="card-title">
                        <i class="fa fa-plus"></i>
                        Create Course
                    </h5>
                </div>
                <!-- /.card-header -->
                <!-- form start -->
                <div class="card-body">
                    <g:form class="form-vggalidation" useToken="true" controller="course" action="save" id="${faculty.id}" method="POST">
                        <div class="form-group">
                            <g:textField class = "form-control" placeholder="Course Name" name="name"/>
                            <div class="text-danger">
                                <g:hasErrors bean="${course}">
                                    <g:renderErrors  bean="${course}" field="name"/>
                                </g:hasErrors>
                            </div>
                        </div>

                        <button type="submit" class="btn btn-primary">
                            <i class="fa fa-save"></i>
                            Save
                        </button>
                        <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_ADMIN}, ${noticeboard.IdentityService.ROLE_SUPER_ADMIN}">
                            <g:link class="btn btn-danger" action="index" id="${faculty.id}">
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