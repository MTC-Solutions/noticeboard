<div class="card card-primary">
    <div class="card-header">
        <h3 class="card-title">${admin.title} ${admin.lastName} ${admin.firstName}</h3>
    </div>
    <!-- /.card-header -->
    <div class="card-body">
           <strong><i class="fa fa-user-o"></i> Title:</strong> ${admin.title}<br>
           <strong><i class="fa fa-user-o"></i> First Name:</strong> ${admin.firstName}<br>
           <strong><i class="fa fa-user-o"></i> Middle Name:</strong> ${admin.middleName}<br>
           <strong><i class="fa fa-user-o"></i> Last Name:</strong> ${admin.lastName}<br>
           <strong><i class="fa fa-envelope-o"></i> Email:</strong> ${admin.email}<br>
           <strong><i class="fa fa-clock-o"></i> Date Created: </strong> ${admin.dateCreated}<br>
           <strong><i class="fa fa-clock-o"></i> Last Updated: </strong> ${admin.lastUpdated}<br><br>
           <g:form controller="admin" action="delete" id="${admin.id}">
               <g:link class="btn btn-primary" controller="admin" action="edit" id="${admin.id}">
                   <i class="fa fa-pencil"></i>
                   Edit Admin
               </g:link>
               <button type="submit" class="btn btn-danger">
                   <i class="fa fa-trash"></i>
                   Delete Admin
               </button>
           </g:form>

    </div>
    <!-- /.card-body -->
</div>