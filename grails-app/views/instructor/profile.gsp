<html>
<head>
    <sec:ifLoggedIn>
        <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_INSTRUCTOR}, ${noticeboard.IdentityService.ROLE_STUDENT}">
            <meta name="layout" content="home">
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_SUPER_ADMIN}, ${noticeboard.IdentityService.ROLE_ADMIN}">
            <meta name="layout" content="app">
        </sec:ifAnyGranted>

        <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_INSTITUTION_ADMIN}">
            <meta name="layout" content="app">
        </sec:ifAnyGranted>
        <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_INSTITUTION_SUPER_ADMIN}">
            <meta name="layout" content="app">
        </sec:ifAnyGranted>
    </sec:ifLoggedIn>
</head>

<body>
<div class="container">
    <sec:ifLoggedIn>
        <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_INSTRUCTOR}, ${noticeboard.IdentityService.ROLE_STUDENT}">
            <g:applyLayout name="partials/homeNavbar"/>
            <br>
            <div class="row">

                <!-- Post Content Column -->
                <div class="col-lg-8">


                    <br> <!-- Title -->


                    <div class="card card-primary">
                        <div class="card-header">
                            <h3 class="card-title">
                                <i class="fa fa-user-o"></i>
                                Profile
                            </h3>
                        </div>
                        <!-- /.card-header -->
                        <!-- form start -->
                        <div class="card-body">
                            <b><i class="fa fa-user-o"></i></b>
                            &nbsp;Instructor
                                <br>
                            <b><i class="fa fa-user-o"></i></b>
                            &nbsp;${instructor.title}
                            ${instructor.firstName}
                            ${instructor.lastName}<br>
                            <i class="fa fa-graduation-cap"></i>
                            ${instructor.institution.name}
                            <br>
                        <g:link controller="user" action="changePassword" >
                            <i class="fa fa-lock"></i>
                            Change password
                        </g:link>
                        </div>
                    </div>

                    <div class="card card-primary">
                        <div class="card-header">
                            <h5 class="card-title">
                                <i class="fa fa-book"></i>
                                Modules
                            </h5>
                        </div>
                        <!-- /.card-header -->
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <g:if test="${!instructor.groups}">
                                        No registered module
                                    </g:if>
                                    <g:each var="group" in="${instructor.groups}">
                                        <g:link controller="group" action="show" id="${group.id}">
                                            <i class="fa fa-book"></i>
                                            ${group.module.code}
                                            <span class="badge badge-danger pull-right"> ${group.notifications.size()} </span><br>
                                        </g:link>
                                    </g:each>

                                </div>
                            </div>

                        </div>
                        <!-- /.card-body -->
                    </div>
                </div>

                <!-- Sidebar Widgets Column -->
                <div class="col-md-4">

                    <!-- Search Widget -->

                    <!-- Categories Widget -->
                    <div class="card my-4">
                        <h5 class="card-header">Categories</h5>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <ul class="list-unstyled mb-0">
                                        <li>
                                            <a href="#">Web Design</a>
                                        </li>
                                        <li>
                                            <a href="#">HTML</a>
                                        </li>
                                        <li>
                                            <a href="#">Freebies</a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-lg-6">
                                    <ul class="list-unstyled mb-0">
                                        <li>
                                            <a href="#">JavaScript</a>
                                        </li>
                                        <li>
                                            <a href="#">CSS</a>
                                        </li>
                                        <li>
                                            <a href="#">Tutorials</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Side Widget -->
                    <div class="card my-4">
                        <h5 class="card-header">Side Widget</h5>
                        <div class="card-body">
                            You can put anything you want inside of these side widgets. They are easy to use, and feature the new Bootstrap 4 card containers!
                        </div>
                    </div>

                </div>

            </div>
            <!-- /.row -->
        </sec:ifAnyGranted>

        <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_SUPER_ADMIN}, ${noticeboard.IdentityService.ROLE_ADMIN}">
            <g:applyLayout name="partials/adminNavbar"/>
        </sec:ifAnyGranted>

        <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_INSTITUTION_ADMIN}">
            <g:applyLayout name="partials/insitutionAdminNavbar"/>
        </sec:ifAnyGranted>

        <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_INSTITUTION_SUPER_ADMIN}">
            <g:applyLayout name="partials/insitutionAdminNavbar"/>
        </sec:ifAnyGranted>
    </sec:ifLoggedIn>


</div>
</body>
</html>