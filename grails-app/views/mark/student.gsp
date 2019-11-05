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
                    <i class="fa fa-check"></i>
                    <i class="fa"></i>
                    Marks for ${group.module.code}
                </h5>
            </sec:ifAllGranted>

        </div>
        <div class="card-body">
            <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Work</th>
                            <th>Achieved mark</th>
                            <th>Total Mark</th>
                            <th>Progress</th>
                            <th>Posted</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Work</th>
                            <th>Achieved mark</th>
                            <th>Total Mark</th>
                            <th>Progress</th>
                            <th>Posted</th>
                        </tr>
                        </tfoot>
                        <tbody>
                        <g:each var="mark" in = "${marks}">
                            <tr>
                                <td>${mark.work.name}</td>
                                <td>${mark.achievedMark}</td>
                                <td>${mark.work.totalMark}</td>
                                <td>${mark.progress}</td>
                                <td>
                                    <prettytime:display  date="${mark.dateCreated}"/>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </sec:ifAllGranted>

        </div>
    </div>
</sec:ifLoggedIn>
</body>
</html>








