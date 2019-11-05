<html>
<head>

</head>
<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-pencil"></i>
                    Edit Institution
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" useToken="true" controller="institution" action="update" id="${institution.id}" method="POST">
                    <g:hasErrors bean="${institution}">
                        <div class="bg-danger">
                            <h5>Validation errors</h5>
                            <g:renderErrors bean="${institution}" as="list"/>
                            <br>
                        </div>
                    </g:hasErrors>
                    <b>Institution Name</b>
                    <div class="form-group">
                        <g:textField value="${institution.name}" class = "form-control" placeholder="Institution Name" name="name"/>
                    </div>

                    <b>Country</b>
                    <div class="form-group">
                        <g:textField value="${institution.country}" class = "form-control" placeholder="Country" name="country"/>
                    </div>

                    <b>City</b>
                    <div class="form-group">
                        <g:textField value="${institution.city}" class = "form-control" placeholder="City" name="city"/>
                    </div>

                    <b>Address</b>
                    <div class="form-group">
                        <g:textField value="${institution.address}" class = "form-control" placeholder="Main street" name="address"/>
                    </div>

                    <b>Postal code</b>
                    <div class="form-group">
                        <g:textField value="${institution.postalCode}" class = "form-control" placeholder="Postal code" name="postalCode"/>
                    </div>

                    <b>Email Address</b>
                    <div class="form-group">
                        <g:textField value="${institution.email}" class = "form-control" placeholder="Email Address" name="email"/>
                    </div>

                    <b>Phone number</b>
                    <div class="form-group">
                        <g:textField value="${institution.phoneNumber}" class = "form-control" placeholder="Phone number" name="phoneNumber"/>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-circle-o"></i>
                        Update
                    </button>
                    <sec:ifAnyGranted roles="${noticeboard.IdentityService.ROLE_ADMIN}, ${noticeboard.IdentityService.ROLE_SUPER_ADMIN}">
                        <g:link class="btn btn-danger" action="index">
                            <i class="fa fa-arrow-left"></i>
                            Back
                        </g:link>
                    </sec:ifAnyGranted>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
