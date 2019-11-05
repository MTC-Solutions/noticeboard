<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-pencil"></i>
                    <i class="fa"></i>
                    Edit Module
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-validation" useToken="true" action="update" id="${module.id}" method="POST">
                    <div class="form-group">
                        <b>Module Name</b>
                        <g:textField value="${module.name}" class = "form-control" placeholder="Module Name" name="name"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${newModule}">
                                <g:renderErrors  bean="${newModule}" field="name"/>
                            </g:hasErrors>
                        </div>
                    </div>
                    <div class="form-group">
                        <b>Module Code</b>
                        <g:textField value="${module.code}" class = "form-control" placeholder="Module Code" name="code"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${newModule}">
                                <g:renderErrors  bean="${newModule}" field="code"/>
                            </g:hasErrors>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-circle-o"></i>
                        Update
                    </button>
                    <a href="" class="btn btn-danger">
                        <i class="fa fa-times"></i>
                        Cancel
                    </a>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>