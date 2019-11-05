<!-- Navbar -->
<nav class="main-header navbar navbar-expand bg-white navbar-light border-bottom">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#"><i class="fa fa-bars"></i></a>
        </li>
    </ul>

    <!-- Right navbar links -->
    <ul class="navbar-nav ml-auto">
        <!-- Messages Dropdown Menu -->
    <li class="nav-item dropdown">
        <g:link class="nav-link" controller="notification" action="index" id="${group.id}">
            <i class="fa fa-envelope"></i>
            <g:if test="${noticeboard.CountService.groupNotifications(group)}">
                <span class="badge badge-danger navbar-badge">
                    ${noticeboard.CountService.groupNotifications(group)}
                </span>
            </g:if>

        </g:link>
    </li>
        <!-- Notifications Dropdown Menu -->

        <li class="nav-item dropdown">
            <g:link class="nav-link" controller="notification" action="index" id="${group.id}">
                <i class="fa fa-bell-o"></i>
                <g:if test="${noticeboard.CountService.groupNotifications(group)}">
                    <span class="badge badge-danger navbar-badge">
                        ${noticeboard.CountService.groupNotifications(group)}
                    </span>
                </g:if>

            </g:link>
        </li>
        <li class="nav-item">
            <g:link class="nav-link" controller="notification" action="index" id="${group.id}">
                <i class="fa"></i>
            </g:link>

        </li>
    </ul>
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link">
        <span class="brand-text font-weight-light">Noticeboard</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="info">
                <a href="#" class="d-block">
                    <i class = "nav-icon fa fa-user-o"></i>&nbsp;
                Student
                </a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->

                <li class="nav-item">
                    <g:link class="nav-link" controller="user" action="profile">
                        <i class="nav-icon fa fa-dashboard"></i>
                        <p>
                            Dashboard
                        </p>
                    </g:link>
                </li>

                <li class="nav-item">
                    <g:link class="nav-link" controller="notification" action="index" id="${group.id}">
                        <i class="nav-icon fa fa-bell"></i>
                        <p>
                            Notifications
                            <span class="right badge badge-danger">
                                ${noticeboard.CountService.groupNotifications(group)}
                            </span>
                        </p>
                    </g:link>
                </li>

                <li class="nav-item">
                    <g:link class="nav-link" controller="note" action="index" id="${group.id}">
                        <i class="nav-icon fa fa-book"></i>
                        <p>
                            Class Notes
                            <span class="right badge badge-danger">
                                ${noticeboard.CountService.groupNotes(group)}
                            </span>
                        </p>
                    </g:link>
                </li>


                <li class="nav-item">
                    <g:link class="nav-link" controller="assignment" action="index" id="${group.id}">
                        <i class="nav-icon fa fa-pencil"></i>
                        <p>
                            Assignments
                            <span class="right badge badge-danger">
                                ${noticeboard.CountService.groupAssignments(group)}
                            </span>
                        </p>
                    </g:link>
                </li>

                <li class="nav-item">
                    <g:link class="nav-link" controller="mark" action="student" id="${group.id}">
                        <i class="nav-icon fa fa-check"></i>
                        <p>
                            Marks
                            <span class="right badge badge-danger">
                                ${noticeboard.CountService.groupWorks(group)}
                            </span>
                        </p>
                    </g:link>
                </li>

                <li class="nav-item">
                    <g:link class="nav-link" controller="memorandum" action="index" id="${group.id}">
                        <i class="nav-icon fa fa-check-square"></i>
                        <p>
                            Memorandums
                            <span class="right badge badge-danger">
                                ${noticeboard.CountService.groupMemorandums(group)}
                            </span>
                        </p>
                    </g:link>
                </li>

                <li class="nav-item">
                    <g:link class="nav-link" controller="user" action="changePassword">
                        <i class="nav-icon fa fa-lock"></i>
                        <p>
                            Change password
                        </p>
                    </g:link>
                </li>

                <li class="nav-item">

                    <g:link class="nav-link" controller="logout">
                        <i class="nav-icon fa fa-power-off"></i>
                        <p>
                            Logout
                        </p>
                    </g:link>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
