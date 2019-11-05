<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-plus"></i>
                    Create Faculty
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" useToken="true" action="save" id="${institution.id}" method="POST">
                    <div class="form-group">
                        <g:textField class = "form-control" placeholder="Faculty Name" name="name"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${faculty}">
                                <g:renderErrors  bean="${faculty}" field="name"/>
                            </g:hasErrors>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
                    </button>
                        <g:link class="btn btn-danger" action="index" id="${institution.id}">
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