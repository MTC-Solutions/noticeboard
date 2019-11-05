<!DOCTYPE html>
<html>
    <head>

        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="card card-primary">
        <div class="card-header">
            <h3 class="card-title">List of Institutions
                <g:link class="btn btn-success btn-sm" controller="institution" action="create">
                    <i class="fa fa-plus"></i>
                    Create
                </g:link>
            </h3>
        </div>
        <!-- /.card-header -->
        <div class="card-body">
            <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th>Username</th>
                    <th>Password expired</th>
                    <th>Account Expired</th>
                    <th>Account Locked</th>
                    <th>Enabled</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
                <tfoot>
                <g:each var="user" in = "${userList}">
                    <tr>
                        <td>${user.username}</td>
                        <td>${user.passwordExpired}</td>
                        <td>${user.accountExpired}</td>
                        <td>${user.accountLocked}</td>
                        <td>${user.enabled}</td>
                        <td>
                            <g:form resource="${this.user}" method="DELETE" class="form-inline">
                                <g:link class="btn btn-info btn-sm" controller="user" action="show" id="${user.id}">
                                    <i class="fa fa-eye"></i>
                                </g:link>
                                <g:link class="btn btn-success btn-sm" controller="user" action="edit" id="${user.id}">
                                    <i class="fa fa-pencil"></i>
                                </g:link>
                                <button type="submit" class="btn btn-danger btn-sm">
                                    <i class="fa fa-trash"></i>
                                </button>
                            </g:form>
                        </td>
                    </tr>
                </g:each>
                <tr>
                    <th>Username</th>
                    <th>Password expired</th>
                    <th>Account Expired</th>
                    <th>Account Locked</th>
                    <th>Enabled</th>
                    <th>Action</th>
                </tr>
                </tfoot>
            </table>
        </div>
        <!-- /.card-body -->
    </div>

    </body>
</html>