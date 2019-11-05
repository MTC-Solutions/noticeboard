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
    <asset:stylesheet src = "noticeboard.css"/>
    <asset:stylesheet src = "noticeboard/css/adminlte.min.css"/>
    <asset:stylesheet src = "home.css"/>

    <g:layoutHead/>
</head>
<body >
<div class="wrapper">
    <!-- Content Wrapper. Contains page content -->
    <div>
        <!-- Content Header (Page header) -->
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <sec:ifNotLoggedIn>
                <g:applyLayout name="partials/homeNavbar"/>
            </sec:ifNotLoggedIn>
            <div class="container">
                <g:layoutBody/>
            </div><!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->


    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
    <!-- Footer -->
</div>


<!-- javascripts -->
<!-- jQuery -->
<asset:javascript src = "jquery/jquery.min.js"/>

<!-- Bootstrap 4 -->
<asset:javascript src = "bootstrap/js/bootstrap.bundle.min.js"/>


</body>
</html>
