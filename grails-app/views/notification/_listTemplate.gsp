<util:remotePaginate controller="book" action="filter" total="${Notification.count()}"
                     update="listTemplateDivId" max="20" pageSizes="[10, 20, 50,100]"/>

<util:remotePaginate controller="book" action="filter" total="${Notification.count()}" update="listTemplateDivId"
                     max="20" pageSizes="[10:'10 Per Page', 20: '20 Per Page', 50:'50 Per Page',100:'100 Per Page']"/>