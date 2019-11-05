<%@ page import="noticeboard.IdentityService" %>
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
                    <i class="fa fa-book"></i>
                    <i class="fa"></i>
                    Class Notes
                </h5>
            </sec:ifAllGranted>
            <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <h5 class="card-title">
                    <i class="fa fa-folder-open-o"></i>
                    <i class="fa"></i>
                    Class notes
                    <g:link class="btn btn-success btn-sm" controller="note" action="create" id="${group.id}">
                        <i class="fa fa-plus"></i>
                        Create
                    </g:link>
                </h5>
            </sec:ifNotGranted>

        </div>
        <div class="card-body">
                <g:if test="${!group.notes}">
                    <div class="mx-auto">
                        No class notes
                    </div>
                </g:if>
                <g:each var="note" in="${group.notes}">
                    <g:link action="show" id="${note.id}">
                            <i class="fa fa-folder"></i>
                            ${note.folder} <br>
                    </g:link>
                </g:each>
        </div>
    </div>
</sec:ifLoggedIn>


</body>
</html>








