<%@ page import="noticeboard.Student" %>
<html>
<head>

</head>
<body>

        <div class="card card-primary">
            <div class="card-header">
                <h5 class="card-title">
                    <i class="fa fa-table"></i>
                    Marks for ${work.name}
                    <g:link  class="btn btn-success btn-sm" controller="mark" action="create" id="${work.id}">
                        <i class="fa fa-plus"></i>
                        Create
                    </g:link>
                    <g:link class="btn btn-danger btn-sm" controller="mark" action="upload" id="${work.id}">
                        <i class="fa fa-upload"></i>
                        Upload
                    </g:link>
                </h5>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Student Number</th>
                        <th>Achieved Mark</th>
                        <th>Total Mark</th>
                        <th>Progress</th>
                        <th>Posted</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Student Number</th>
                        <th>Achieved Mark</th>
                        <th>Total Mark</th>
                        <th>Progress</th>
                        <th>Posted</th>
                        <th>Action</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <g:each var="mark" in = "${work.marks}">
                        <tr>
                            <g:link controller="student" action="show" id="${noticeboard.Student.findByStudentNumber(mark.markStudentNumber).id}">
                                <td>${mark.markStudentNumber}</td>
                            </g:link>
                            <td>${mark.achievedMark}</td>
                            <td>${work.totalMark}</td>
                            <td>${mark.progress}</td>
                            <td>
                                <prettytime:display  date="${mark.dateCreated}"/>
                            </td>
                            <td>
                                <g:form useToken="true" controller="mark" action="delete" id="${mark.id}">

                                    <g:link class="btn btn-success btn-sm" controller="mark" action="edit" id="${mark.id}">
                                        <i class="fa fa-pencil"></i>
                                    </g:link>
                                    <button type="submit" class="btn btn-danger btn-sm">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </g:form>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            </div>
        </div>

</body>
</html>