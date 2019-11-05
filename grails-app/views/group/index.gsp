<html>
<head>

</head>
<body>

<div class="card mb-3 card-primary">
    <div class="card-header">
        <h5 class="card-title">
            <i class="fa fa-database"></i>
            Groups
            <g:link class="btn btn-success btn-sm" action="create" id="${module.id}">
                <i class="fa fa-plus"></i>
                Create
            </g:link>
        </h5>
    </div>
    <div class="card-body">
        <g:if test="${module.groups}">
            <g:each var="group" in="${module.groups}">

                    <g:link action="show" id="${group.id}">
                        <i class="fa fa-folder"></i>
                        ${group.name}
                    </g:link>

            </g:each>
        </g:if>
        <g:if test="${!module.groups}">
            No group
        </g:if>

    </div>
</div>
</body>
</html>








