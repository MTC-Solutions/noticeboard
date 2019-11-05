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
            Instructors
            <g:link class="btn btn-success btn-sm" controller="instructor" action="create" id="${institution.id}">
                <i class="fa fa-plus"></i>
                Add
            </g:link>
            <g:link class="btn btn-danger btn-sm" controller="instructor" action="upload" id="${institution.id}">
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
                    <th>Title</th>
                    <th>First Name</th>
                    <th>Middle Name</th>
                    <th>Last Name</th>
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
                    <th>Email</th>
                    <th>Action</th>
                </tr>
                </tfoot>
                <tbody>
                <g:each var="instructor" in = "${institution.instructors}">
                    <tr>
                        <td>${instructor.title}</td>
                        <td>${instructor.firstName}</td>
                        <td>${instructor.middleName}</td>
                        <td>${instructor.lastName}</td>
                        <td>${instructor.email}</td>
                        <td>
                            <g:form useToken="true" controller="instructor" action="delete" id="${instructor.id}" method="post">
                                <g:link class="btn btn-info btn-sm" controller="instructor" action="show" id="${instructor.id}">
                                    <i class="fa fa-eye"></i>
                                </g:link>
                                <g:link class="btn btn-success btn-sm" controller="instructor" action="edit" id="${instructor.id}">
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








