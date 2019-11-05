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
                    <i class="fa fa-pencil"></i>
                    Assignments
                </h5>
            </sec:ifAllGranted>
            <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <h5 class="card-title">
                    <i class="fa fa-table"></i>
                    <i class="fa"></i>
                    Assignments
                    <g:link class="btn btn-success btn-sm" controller="assignment" action="create" id="${group.id}">
                        <i class="fa fa-plus"></i>
                        Create
                    </g:link>
                    <g:link class="btn btn-danger btn-sm"action="create" id="${group.id}">
                        <i class="fa fa-upload"></i>
                        Upload
                    </g:link>
                </h5>
            </sec:ifNotGranted>

        </div>
        <div class="card-body">
                <g:if test="${!group.assignments}">
                    <div class="mx-auto">
                        No assignment
                    </div>
                </g:if>
                <g:each var="assignment" in="${group.assignments}">
                    <g:link action="show" id="${assignment.id}">
                            <i class="fa fa-folder"></i>
                            ${assignment.folder} <br>
                    </g:link>
                </g:each>
        </div>
    </div>
</sec:ifLoggedIn>


</body>
</html>








