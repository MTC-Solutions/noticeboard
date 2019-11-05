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

                <g:form class="form-validation" useToken="true" controller="home" action="processPassword" method="POST">

                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                        </div>
                        <input name="email"  type="email" class="form-control" placeholder="Email Address">
                    </div>

                    <input class="btn btn-primary btn-block" type="submit" value="Reset Password">

                </g:form>
                <div class="text-center">
                    <g:link class="d-block" controller="home" action="index">
                        <i class="fa fa-arrow-left"></i>
                        Back to profile
                    </g:link>
                </div>

            </div>
        </div>
    </div>

    </body>

    </html>

    </body>
</html>