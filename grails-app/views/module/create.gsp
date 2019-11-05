<body>
<div class="row">
    <div class="col-md-8 mx-auto">
        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-plus"></i>
                    Create Module
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <g:form class="form-valdidation" useToken="true" controller="module" action="save" id="${course.id}" method="POST">
                    <div class="form-group">
                        <b>Module Name</b>
                        <g:textField class = "form-control" placeholder="Module Name" name="name"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${module}">
                                <g:renderErrors  bean="${module}" field="name"/>
                            </g:hasErrors>
                        </div>
                    </div>
                    <div class="form-group">
                        <b>Module Code</b>
                        <g:textField class = "form-control" placeholder="Module Code" name="code"/>
                        <div class="text-danger">
                            <g:hasErrors bean="${module}">
                                <g:renderErrors  bean="${module}" field="code"/>
                            </g:hasErrors>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">
                        <i class="fa fa-save"></i>
                        Save
                    </button>
                        <g:link class="btn btn-danger" action="index" id="${course.id}">
                            <i class="fa fa-arrow-left"></i>
                            Back
                        </g:link>
                </g:form>
            </div>
        </div>
    </div>
</div>
</body>