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
                    <i class="fa fa-bell"></i>
                    <i class="fa"></i>
                    Notifications
                </h5>
            </sec:ifAllGranted>
            <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <h5 class="card-title">
                    <i class="fa fa-table"></i>
                    <i class="fa"></i>
                    Notifications
                    <g:link class="btn btn-success btn-sm" controller="notification" action="create" id="${group.id}">
                        <i class="fa fa-plus"></i>
                        Create
                    </g:link>
                </h5>
            </sec:ifNotGranted>

        </div>
        <div class="card-body">
            <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                        <tr>
                            <th>Notifications</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tfoot>
                        <tr>
                            <th>Notifications</th>
                            <th>Action</th>
                        </tr>
                        </tfoot>
                        <tbody>
                        <g:each var="notification" in = "${group.notifications}">
                            <tr>
                                <td>${notification.description}</td>
                                <td>
                                    <g:form useToken="true" action="delete" id="${notification.id}" method="post">
                                        <g:link class="btn btn-info btn-sm" action="show" id="${notification.id}">
                                            <i class="fa fa-eye"></i>
                                        </g:link>
                                        <button onclick="return confirm('Are you sure you wan\'t delete the notification?')" type="submit" class="btn btn-danger btn-sm">
                                            <i class="fa fa-trash"></i>
                                        </button>
                                    </g:form>
                                </td>
                            </tr>
                        </g:each>
                        </tbody>
                    </table>
                </div>
            </sec:ifNotGranted>
            <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_INSTRUCTOR}">
                <g:if test="${!group.notifications}">
                    <div class="mx-auto">
                        No notification
                    </div>
                </g:if>
                <g:each var="notification" in="${group.notifications.sort{it.dateCreated}}">
                    ${notification.description}<br>
                        <small>
                            <b>
                                <i class="fa fa-clock-o"></i>
                                Posted:
                            </b><prettytime:display  date="${notification.dateCreated}"/>
                        </small>
                    <hr>
                </g:each>
            </sec:ifNotGranted>

        </div>
    </div>
</sec:ifLoggedIn>


</body>
</html>








