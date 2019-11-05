<html>
<head>

</head>
<body>

<div class="card mb-3 card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-table"></i>
            Faculties
            <g:link class="btn btn-success btn-sm" action="create" id="${institution.id}">
                <i class="fa fa-plus"></i>
                Create
            </g:link>
            <g:link class="btn btn-danger btn-sm" action="upload" id="${institution.id}">
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
                    <th>Faculty Name</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Faculty Name</th>
                    <th>Action</th>
                </tr>
                </tfoot>
                <tbody>
                <g:each var="faculty" in = "${institution.faculties}">
                    <tr>
                        <td>${faculty.name}</td>
                        <td>
                            <g:form useToken="true" controller="faculty" action="delete" id="${faculty.id}" method="POST">
                                <g:link class="btn btn-info btn-sm" controller="faculty" action="show" id="${faculty.id}">
                                    <i class="fa fa-eye"></i>
                                </g:link>
                                <g:link class="btn btn-success btn-sm" controller="faculty" action="edit" id="${faculty.id}">
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








