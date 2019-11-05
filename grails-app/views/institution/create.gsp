<html>
<head>

</head>
<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-plus"></i>
                    Create Institution
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" useToken="true" url = "[action : 'save']">

                    <b>Institution Name</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Institution Name" name="name"/>
                        <g:hasErrors bean="${institution}">
                            <g:renderErrors bean="${institution}" as="list" field="name"/>
                        </g:hasErrors>
                    </div>

                    <b>Country</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Country" name="country"/>
                        <g:hasErrors bean="${institution}">
                            <g:renderErrors bean="${institution}" as="p" field="country"/>
                        </g:hasErrors>
                    </div>

                    <b>Address</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Main street" name="address"/>
                    </div>

                    <b>City</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="City" name="city"/>
                    </div>

                    <b>Postal code</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Postal code" name="postalCode"/>
                    </div>

                    <b>Email Address</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Email Address" name="email"/>
                    </div>

                    <b>Phone number</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Phone number" name="phoneNumber"/>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
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
