<html>
<head>

</head>
<body>


        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-briefcase"></i>
                    Work
                    <g:link class="btn btn-success btn-sm" action="create" id="${group.id}">
                        <i class="fa fa-plus"></i>
                        Create
                    </g:link>
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
            <g:if test="${group.works}">
                <g:each var="work" in="${group.works}">
                    <g:link action="show" id="${work.id}">

                            <i class="fa fa-folder"></i>
                            ${work.name}

                    </g:link> <br>
                    Total Mark: ${work.totalMark}<br>
                    <g:form useToken="true" action="delete" id="${work.id}">
                        <g:link class="btn btn-info btn-sm" action="show" id="${work.id}">
                            <i class="fa fa-edit"></i>
                            Edit
                        </g:link>
                        <button type="submit" class="btn btn-danger btn-sm">
                            <i class="fa fa-trash"></i>
                            Delete
                        </button>
                    </g:form>
                    <hr>
                </g:each>
            </g:if>
            <g:if test="${!group.works}">
                <h5>No work</h5>
            </g:if>
            </div>
        </div>

</body>
</html>