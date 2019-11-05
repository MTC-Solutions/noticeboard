<html>
<head>

</head>
<body>

<div class="card mb-3 card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-table"></i>
            Courses
            <g:link class="btn btn-success btn-sm" action="create" id="${faculty.id}">
                <i class="fa fa-plus"></i>
                Create
            </g:link>
            <g:link class="btn btn-danger btn-sm" action="upload" id="${faculty.id}">
                <i class="fa fa-upload"></i>
                Upload
            </g:link>
        </h5>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Course Name</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Course Name</th>
                    <th>Action</th>
                </tr>
                </tfoot>
                <tbody>
                <g:each var="course" in = "${faculty.courses}">
                    <tr>
                        <td>${course.name}</td>
                        <td>
                            <g:form useToken="true" controller="course" action="delete" id="${course.id}" method="POST">
                                <g:link class="btn btn-info btn-sm" controller="course" action="show" id="${course.id}">
                                    <i class="fa fa-eye"></i>
                                </g:link>
                                <g:link class="btn btn-success btn-sm" controller="course" action="edit" id="${course.id}">
                                    <i class="fa fa-pencil"></i>
                                </g:link>
                                <button type="submit" class="btn btn-danger btn-sm">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </g:form>
                        </td>
                    </tr>
                </g:each>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>








