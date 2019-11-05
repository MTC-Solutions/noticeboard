<html>
<head>

</head>
<body>
<!-- Example DataTables Card-->
<div class="card mb-3 card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-table"></i>
            <i class="fa"></i>
            Students in ${module.code}
            <g:link class="btn btn-success btn-sm" controller="module" action="createStudent" id="${module.id}">
                <i class="fa fa-plus"></i>
                Add
            </g:link>
            <g:link class="btn btn-danger btn-sm" controller="module" action="uploadStudents" id="${module.id}">
                <i class="fa fa-upload"></i>
                Upload
            </g:link>
        </h5>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Title</th>
                    <th>First Name</th>
                    <th>Middle Name</th>
                    <th>Last Name</th>
                    <th>Student Number</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Title</th>
                    <th>First Name</th>
                    <th>Middle Name</th>
                    <th>Last Name</th>
                    <th>Student Number</th>
                    <th>Email</th>
                    <th>Action</th>
                </tr>
                </tfoot>
                <tbody>
                <g:each var="student" in = "${module.students}">
                    <tr>
                        <td>${student.title}</td>
                        <td>${student.firstName}</td>
                        <td>${student.middleName}</td>
                        <td>${student.lastName}</td>
                        <td>${student.studentNumber}</td>
                        <td>${student.email}</td>
                        <td>
                            <g:form useToken="true" controller="student" action="delete" id="${student.id}" method="post">
                                <g:link class="btn btn-info btn-sm" controller="student" action="show" id="${student.id}">
                                    <i class="fa fa-eye"></i>
                                </g:link>
                                <g:link class="btn btn-success btn-sm" controller="student" action="edit" id="${student.id}">
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








