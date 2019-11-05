<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="#">Noticeboard</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">About</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Tutorials
                    </a>
                    <div class="dropdown-menu" aria-labelledby="tutorialDropdown">
                        <a class="dropdown-item" href="#">Videos</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Text Based</a>
                    </div>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <sec:ifNotLoggedIn>
                    <li class="nav-item">
                        <g:link class="nav-link"  controller="login" action="auth">
                            <i class="fa fa-lock"></i>
                            Login &nbsp;
                        </g:link>
                    </li>
                </sec:ifNotLoggedIn>

                <sec:ifLoggedIn>

                    <li class="nav-item">
                        <g:link class="nav-link" controller="logout">
                            <i class="nav-icon fa fa-user-o"></i>
                            <sec:loggedInUserInfo field="username"/>
                        </g:link>
                    </li>
                    <li class="nav-item">
                        <g:link class="btn btn-danger" controller="logout">
                            <i class="nav-icon fa fa-power-off"></i>
                                Logout
                        </g:link>
                    </li>
                </sec:ifLoggedIn>

            </ul>

        </div>
    </div>
</nav>
