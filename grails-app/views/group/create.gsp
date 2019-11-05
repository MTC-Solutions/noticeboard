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
                    Create Group
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" useToken="true" controller="group" action="save" id="${module.id}" method="POST">
                    <b>Group name</b>
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Group Name" name="name"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${group}">
                                <g:renderErrors  bean="${group}" field="heading"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
                    </button>
                        <g:link class="btn btn-danger" action="index" id="${module.id}">
                            <i class="fa fa-arrow-left"></i>
                            Back
                        </g:link>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
