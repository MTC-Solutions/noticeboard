<html>
<head>

</head>
<body>

<div class="card mb-3 card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-table"></i>
            Modules
            <g:link class="btn btn-success btn-sm" controller="module" action="create" id="${course.id}">
                <i class="fa fa-plus"></i>
                Create
            </g:link>
            <g:link class="btn btn-danger btn-sm" controller="module" action="upload" id="${course.id}">
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
                    <th>Module Name</th>
                    <th>Module Code</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Module Name</th>
                    <th>Module Code</th>
                    <th>Action</th>
                </tr>
                </tfoot>
                <tbody>
                <g:each var="module" in = "${course.modules}">
                    <tr>
                        <td>${module.name}</td>
                        <td>${module.code}</td>
                        <td>
                            <g:form useToken="true" controller="module" action="delete" id="${module.id}" method="POST">
                                <g:link class="btn btn-info btn-sm" controller="module" action="show" id="${module.id}">
                                    <i class="fa fa-eye"></i>
                                </g:link>
                                <g:link class="btn btn-success btn-sm" controller="module" action="edit" id="${module.id}">
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








