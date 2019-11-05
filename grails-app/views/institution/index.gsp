<html>
<head>

</head>
<body>

<div class="card mb-3 card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-table"></i>
            Institutions
            <g:link class="btn btn-success btn-sm" controller="institution" action="create">
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
                    <th>Institution Name</th>
                    <th>Country</th>
                    <th>City</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Institution Name</th>
                    <th>Country</th>
                    <th>City</th>
                    <th>Action</th>
                </tr>
                </tfoot>
                <tbody>
                <g:each var="institution" in = "${institutions}">
                    <tr>
                        <td>${institution.name}</td>
                        <td>${institution.country}</td>
                        <td>${institution.city}</td>
                        <td>
                            <g:form useToken="true" controller="institution" action="delete" id="${institution.id}">
                                <g:link class="btn btn-info btn-sm" controller="institution" action="show" id="${institution.id}">
                                    <i class="fa fa-eye"></i>
                                </g:link>
                                <g:link class="btn btn-success btn-sm" controller="institution" action="edit" id="${institution.id}">
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








