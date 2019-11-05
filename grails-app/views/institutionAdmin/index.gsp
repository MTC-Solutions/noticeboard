<html>
<head>

</head>
<body>

<div class="card mb-3 card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-table"></i>
            Institution Admins
            <g:link class="btn btn-success btn-sm" action="create" id="${institution.id}">
                <i class="fa fa-plus"></i>
                Create
            </g:link>
        </h5>
    </div>
    <div class="card-body">
        <div class="table-responsive">
            <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
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
                <g:each var="institutionAdmin" in = "${institution.institutionAdmins}">
                    <tr>
                        <td>${institutionAdmin.title}</td>
                        <td>${institutionAdmin.firstName}</td>
                        <td>${institutionAdmin.middleName}</td>
                        <td>${institutionAdmin.lastName}</td>
                        <td>${institutionAdmin.email}</td>
                        <td>
                            <g:form useToken="true" action="delete" id="${institutionAdmin.id}">
                                <g:link class="btn btn-info btn-sm" action="show" id="${institutionAdmin.id}">
                                    <i class="fa fa-eye"></i>
                                </g:link>
                                <g:link class="btn btn-success btn-sm" action="edit" id="${institutionAdmin.id}">
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








