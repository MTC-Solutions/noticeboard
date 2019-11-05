<html>
<head>

</head>
<body>
<!-- Example DataTables Card-->
<sec:ifLoggedIn>
    <div class="card mb-3 card-primary">
        <div class="card-header">
            <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <h3>
                    <i class="fa fa-table"></i>
                    <i class="fa"></i>
                    Marks for ${module.code}
                </h3>
            </sec:ifAllGranted>
            <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <h3 class="card-title">
                    <i class="fa fa-table"></i>
                    <i class="fa"></i>
                    Marks for ${module.code}
                    <g:link class="btn btn-success btn-sm" controller="mark" action="create" id="${module.id}">
                        <i class="fa fa-plus"></i>
                        Add
                    </g:link>
                    <g:link class="btn btn-danger btn-sm" controller="mark" action="upload" id="${module.id}">
                        <i class="fa fa-upload"></i>
                        Upload
                    </g:link>
                </h3>
            </sec:ifNotGranted>

        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Student name</th>
                        <th>Achieved mark</th>
                        <th>Total Mark</th>
                        <th>Progress</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Student number</th>
                        <th>Achieved mark</th>
                        <th>Total Mark</th>
                        <th>Progress</th>
                        <th>Action</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <g:each var="mark" in = "${work.marks}">
                        <tr>
                            <td>${mark.markStudentNumber}</td>
                            <td>${mark.achievedMark}</td>
                            <td>${mark.totalMark}</td>
                            <td>${mark.progress}</td>
                            <td>
                                <prettytime:display  date="${mark.dateCreated}"/>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</sec:ifLoggedIn>


</body>
</html>








