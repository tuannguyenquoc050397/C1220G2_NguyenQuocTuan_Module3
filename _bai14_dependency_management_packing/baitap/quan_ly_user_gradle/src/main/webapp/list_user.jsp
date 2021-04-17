
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List user by JSTL</title>

    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css" />
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css" />

</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-12">

            <table id="tableUser" class="table table-striped table-bordered" style="width: 100%">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Country</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="user" items="${userListServlet}" varStatus="loop">
                    <tr>
                        <td>${user.id}</td>
                        <td><c:out value="${user.name}"/></td>
                        <td>${user.email}</td>
                        <td>${user.country}</td>
                        <td><a href="/user?actionClient=update&id=${user.id}">Update</a>
                        <a href="/user?actionClient=delete&id=${user.id}">Delete</a>
                        <a href="/user?actionClient=editUser&id=${user.id}">Edit_SP</a></td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>


<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function() {
        $('#tableUser').dataTable( {
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        } );
    } );
</script>

</body>
</html>
