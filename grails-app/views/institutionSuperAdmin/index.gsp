<html>
<head>

</head>
<body>

<div class="card mb-3 card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-table"></i>
            Institution Super Admin
            <g:link class="btn btn-success btn-sm" action="create" id="${institution.id}">
                <i class="fa fa-plus"></i>
                Create
            </g:link>
        </h5>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <thead>
                <tr>
                    <th>Title</th>
                    <th>First name</th>
                    <th>Middle name</th>
                    <th>Last name</th>
                    <th>email</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Title</th>
                    <th>First name</th>
                    <th>Middle name</th>
                    <th>Last name</th>
                    <th>email</th>
                    <th>Action</th>
                </tr>
                </tfoot>
                <tbody>
                <g:each var="institutionSuperAdmin" in = "${institution.institutionSuperAdmins}">
                    <tr>
                        <td>${institutionSuperAdmin.title}</td>
                        <td>${institutionSuperAdmin.firstName}</td>
                        <td>${institutionSuperAdmin.middleName}</td>
                        <td>${institutionSuperAdmin.lastName}</td>
                        <td>${institutionSuperAdmin.email}</td>
                        <td>
                            <g:form action="delete" id="${institutionSuperAdmin.id}">
                                <g:link class="btn btn-info btn-sm" action="show" id="${institutionSuperAdmin.id}">
                                    <i class="fa fa-eye"></i>
                                </g:link>
                                <g:link class="btn btn-success btn-sm" action="edit" id="${institutionSuperAdmin.id}">
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








