<html>
<head>

</head>
<body>
<!-- Example DataTables Card-->
<sec:ifLoggedIn>
    <div class="card mb-3 card-primary">
        <div class="card-header">
            <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <h5>
                    <i class="fa fa-table"></i>
                    <i class="fa"></i>
                    Marks for ${module.code}
                </h5>
            </sec:ifAllGranted>
            <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <h3 class="card-title">
                    <i class="fa fa-table"></i>
                    <i class="fa"></i>
                    Marks for ${module.code}
                    <g:link class="btn btn-success btn-sm" controller="mark" action="create" id="${group.id}">
                        <i class="fa fa-plus"></i>
                        Add
                    </g:link>
                    <g:link class="btn btn-danger btn-sm" controller="mark" action="upload" id="${group.id}">
                        <i class="fa fa-upload"></i>
                        Upload
                    </g:link>
                </h3>
            </sec:ifNotGranted>

        </div>
        <div class="card-body">
            <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Achieved mark</th>
                            <th>Total mark</th>
                            <th>Progress</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Achieved mark</th>
                            <th>Total mark</th>
                            <th>Progress</th>
                            <th>Action</th>
                        </tr>
                        </tfoot>
                        <tbody>
                        <g:if test="${marks}">
                            <g:each var="mark" in = "${marks}">
                                <tr>
                                    <td>${mark.markStudentNumber}</td>
                                    <td>${mark.achievedMark}</td>
                                    <td>${work.totalMark}</td>
                                    <td>${mark.progress}</td>
                                    <td>
                                        <g:form action="delete" id="${mark.id}" method="post">
                                            <g:link class="btn btn-info btn-sm" action="show" id="${mark.id}">
                                                <i class="fa fa-eye"></i>
                                            </g:link>
                                            <g:link class="btn btn-success btn-sm"  action="edit" id="${mark.id}">
                                                <i class="fa fa-pencil"></i>
                                            </g:link>
                                            <button type="submit" class="btn btn-danger btn-sm">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </g:form>
                                    </td>
                                </tr>
                            </g:each>
                        </g:if>
                        </tbody>
                    </table>
                </div>
            </sec:ifAllGranted>

            <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <g:if test="${works}">
                    <div class="mx-auto">
                        <g:each var="work" in="${works}">
                            <h4>
                                <g:link action="show" id="${work.id}">
                                    <i class="fa fa-folder"></i>
                                    ${work.name}
                                </g:link>
                            </h4>
                        </g:each>
                    </div>
                </g:if>

                <g:if test="${!works}">
                    <div class="mx-auto">
                        <g:each var="work" in="${works}">
                            <h4>
                                No marks
                            </h4>
                        </g:each>
                    </div>
                </g:if>
            </sec:ifNotGranted>




        </div>
    </div>
</sec:ifLoggedIn>


</body>
</html>








