<html>
<head>

</head>
<body>
<!-- Example DataTables Card-->
<div class="card mb-3 card-primary">
    <div class="card-header">
        <h3 class="card-title">List of Admins
            <g:link class="btn btn-success btn-sm" controller="admin" action="create">
                <i class="fa fa-plus"></i>
                Create
            </g:link>
        </h3>
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
                <g:each var="admin" in = "${admins}">
                    <tr>
                        <td>${admin.title}</td>
                        <td>${admin.firstName}</td>
                        <td>${admin.middleName}</td>
                        <td>${admin.lastName}</td>
                        <td>${admin.email}</td>
                        <td>
                            <g:form controller="admin" action="delete" id="${admin.id}" method="post">
                                <g:link class="btn btn-info btn-sm" controller="admin" action="show" id="${admin.id}">
                                    <i class="fa fa-eye"></i>
                                </g:link>
                                <g:link class="btn btn-success btn-sm" controller="admin" action="edit" id="${admin.id}">
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








