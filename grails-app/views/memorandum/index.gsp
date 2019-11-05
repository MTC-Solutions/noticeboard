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
                    <i class="fa fa-check-square"></i>
                    Memorandums
                </h5>
            </sec:ifAllGranted>
            <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <h5 class="card-title">
                    <i class="fa fa-check-square"></i>
                    <i class="fa"></i>
                    Memorandums
                    <g:link class="btn btn-success btn-sm" controller="memorandum" action="create" id="${group.id}">
                        <i class="fa fa-plus"></i>
                        Create
                    </g:link>
                </h5>
            </sec:ifNotGranted>

        </div>
        <div class="card-body">
            <g:if test="${!group.memorandums}">
                <div class="mx-auto">
                    No memorandum
                </div>
            </g:if>
            <g:each var="memorandum" in="${group.memorandums}">
                <g:link action="show" id="${memorandum.id}">
                    <i class="fa fa-folder"></i>
                    ${memorandum.folder} <br>
                </g:link>
            </g:each>
        </div>
    </div>
</sec:ifLoggedIn>


</body>
</html>








