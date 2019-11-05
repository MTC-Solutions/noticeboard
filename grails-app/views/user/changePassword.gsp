<html>
<head>
    <meta name="layout" content="loginTemplate">
</head>
<body>
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
            <small>Reset password</small></h3>
        </div>
        <div class="card-body">

            <g:if test='${flash.message}'>
                <div class="text-danger">
                    <p>${flash.message}</p>
                </div>
            </g:if>

            <g:form>
                <div class="form-group">
                    <label>Email address</label>
                    <input class="form-control" name="${usernameParameter ?: 'username'}"  type="email" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <input class="btn btn-primary btn-block" type="submit" value="Reset Password">
            </g:form>

        </div>
    </div>
</div>

</body>

</html>

</body>
</html><html>
<head>
    <meta name="layout" content="loginTemplate">
</head>
<body>
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
            <small>Reset password</small></h3>
        </div>
        <div class="card-body">

            <g:if test='${flash.message}'>
                <div class="text-danger">
                    <p>${flash.message}</p>
                </div>
            </g:if>

            <g:form>
                <div class="form-group">
                    <label>Email address</label>
                    <input class="form-control" name="${usernameParameter ?: 'username'}"  type="email" aria-describedby="emailHelp" placeholder="Enter email">
                </div>
                <input class="btn btn-primary btn-block" type="submit" value="Reset Password">
            </g:form>

        </div>
    </div>
</div>

</body>

</html>

</body>
</html><html>
<head>
    <meta name="layout" content="loginTemplate">
</head>
<body>
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
            <small>Change password</small></h3>
        </div>
        <div class="card-body">

            <g:if test="${flash.message}">
                <p class="text-danger">${flash.message}</p>
            </g:if>

            <g:form class="form-validation" useToken="true" action="saveNewPassword" method="POST">

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-lock"></i></span>
                    </div>
                    <input type="password" name="currentPassword" class="form-control" placeholder="Current Password">
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fa fa-lock"></i></span>
                    </div>
                    <input type="password" name="newPassword" id="new-password" class="form-control" placeholder="New Password">
                </div>

                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1"><i class="fa fa-lock"></i></span>
                    </div>
                    <input type="password" name="confirmPassword" class="form-control" placeholder="Confirm Password">
                </div>

                <input class="btn btn-primary btn-block" type="submit" value="Change Password">

                    <div class="text-center">
                        <g:link class="d-block" controller="user" action="profile">
                            <i class="fa fa-arrow-left"></i>
                            Back to profile
                        </g:link>
                    </div>

            </g:form>

        </div>
    </div>
</div>

</body>

</html>

</body>
</html>