<!doctype html>
<html lang="en" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>
        <g:layoutTitle default="noticeboard"/>
    </title>

    <asset:link rel="icon" href="favicon.ico" type="image/x-ico" />

    <!-- stylesheets -->
    <!-- Font Awesome -->
    <asset:stylesheet src = "font-awesome/css/font-awesome.min.css"/>

    <!-- Theme style -->
    <asset:stylesheet src = "noticeboard/css/adminlte.min.css"/>

    <!-- datatables -->
    <asset:stylesheet src = "datatables/dataTables.bootstrap4.min.css"/>

    <!-- iCheck -->
    <asset:stylesheet src = "iCheck/flat/blue.css"/>

    <g:layoutHead/>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">

    <!-- display different navigation bars according to authenticated user -->

    <sec:ifLoggedIn>
        <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_INSTRUCTOR}">
            <g:applyLayout name="partials/instructorNavbar"/>
        </sec:ifAllGranted>

        <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_ADMIN}, ${noticeboard.IdentityService.ROLE_SUPER_ADMIN}">
            <g:applyLayout name="partials/adminNavbar"/>
        </sec:ifAnyGranted>

        <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}">
            <g:applyLayout name="partials/studentNavbar"/>
        </sec:ifAllGranted>

        <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_INSTITUTION_SUPER_ADMIN}">
            <g:applyLayout name="partials/insitutionAdminNavbar"/>
        </sec:ifAllGranted>

        <sec:ifAllGranted roles="${noticeboard.IdentityService.ROLE_INSTITUTION_ADMIN}">
            <g:applyLayout name="partials/insitutionAdminNavbar"/>
        </sec:ifAllGranted>

    </sec:ifLoggedIn>


    <!-- end -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">

                <div class="content-header">
                    <div class="container-fluid">
                        <div class="row mb-2">
                            <div class="col-sm-6">
                                <sec:ifLoggedIn>
                                    <sec:ifNotGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}, ${noticeboard.IdentityService.ROLE_INSTRUCTOR}">
                                        Admin
                                    </sec:ifNotGranted>
                                    <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_STUDENT}, ${noticeboard.IdentityService.ROLE_INSTRUCTOR}">
                                        ${group.module.code}, ${group.name}
                                    </sec:ifAnyGranted>

                                </sec:ifLoggedIn>
                            </div><!-- /.col -->
                            <div class="col-sm-6">
                                <ol class="breadcrumb float-sm-right">
                                    <g:link>
                                        <sec:ifLoggedIn>
                                            <i class="fa fa-user-o"></i>
                                            <sec:loggedInUserInfo field="username"/>
                                        </sec:ifLoggedIn>
                                    </g:link>
                                </ol>
                            </div><!-- /.col -->
                        </div><!-- /.row -->
                    </div>
                </div>

                <g:if test="${flash.message}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <strong>Success: </strong>
                        ${flash.message}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </g:if>

                <g:if test="${flash.error}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <strong>Failed: </strong>
                        ${flash.error}
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </g:if>
                <!-- content goes -->
                <g:layoutBody/>
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    <footer class="sticky-footer">
        <div class="container">
            <div class="text-center">
                <small>Copyright © Noticeboard 2018</small>
            </div>
        </div>
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>


<!-- javascripts -->
<!-- jQuery -->
<asset:javascript src = "jquery/jquery.min.js"/>

<!-- jQuery UI 1.11.4 -->
<asset:javascript src = "jQueryUI/jquery-ui.min.js"/>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<asset:javascript src = "validation/dist/jquery.validate.min.js"/>
<asset:javascript src = "validation.js"/>

<!-- Bootstrap 4 -->
<asset:javascript src = "bootstrap/js/bootstrap.bundle.min.js"/>

<!-- DataTables -->
<asset:javascript src = "datatables/jquery.dataTables.min.js"/>
<asset:javascript src = "datatables/dataTables.bootstrap4.min.js"/>
<asset:javascript src = "noticeboard/js/sb-admin-datatables.min.js"/>

<!-- Slimscroll -->
<asset:javascript src = "slimScroll/jquery.slimscroll.min.js"/>

<!-- FastClick -->
<asset:javascript src = "fastclick/fastclick.js"/>

<!-- AdminLTE App -->
<asset:javascript src = "noticeboard/js/adminlte.js"/>

</body>
</html>
