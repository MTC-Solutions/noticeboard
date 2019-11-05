<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="layout" content="loginTemplate">
    <title>Noticeboard</title>
</head>

<body>
<div class="container">
    <div class="card card-login mx-auto mt-5">
        <div class="card-header"><h3>
            Noticeboard
            <small>Please Login</small></h3>
        </div>
        <div class="card-body">

            <g:if test='${flash.message}'>
                <div class="text-danger">
                    <p>${flash.message}</p>
                </div>
            </g:if>

            <form class="form-validation" action="${postUrl ?: '/login/authenticate'}" method="POST" autocomplete="off">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-user"></i></span>
                    </div>
                    <input name="${usernameParameter ?: 'username'}"  type="email" class="form-control" placeholder="Username">
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-lock"></i></span>
                    </div>
                    <input name="${passwordParameter ?: 'password'}" type="password" class="form-control" placeholder="Password">
                </div>

                <div class="form-group">
                    <div class="form-check">
                        <label class="form-check-label">
                            <input class="form-check-input" name="${rememberMeParameter ?: 'remember-me'}" id="remember_me" <g:if test='${hasCookie}'>checked="checked"</g:if> type="checkbox"> Remember Password</label>
                    </div>
                </div>
                <input class="btn btn-primary btn-block" type="submit" value="${message(code: 'springSecurity.login.button')}">
            </form>
            <div class="text-center">
                <g:link class="d-block small" controller="home" action="forgotPassword">
                    Forgot Password?
                </g:link>
            </div>
        </div>
    </div>
</div>

</body>

</html>
