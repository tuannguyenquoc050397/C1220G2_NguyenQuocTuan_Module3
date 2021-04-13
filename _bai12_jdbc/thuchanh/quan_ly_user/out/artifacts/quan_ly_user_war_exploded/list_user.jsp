
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List student by JSTL</title>
</head>
<body>

<h2><a href="/user?actionClient=create">Add New User</a>
    <h2><a href="/user?actionClient=back">Back To New List</a>


    </h2>

<h2>List user by JSTL</h2>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th colspan="2">Action</th>
    </tr>

    <c:forEach var="user" items="${userListServlet}" varStatus="loop">
        <tr>
            <td>${user.id}</td>
            <td><c:out value="${user.name}"/></td>
            <td>${user.email}</td>
            <td>${user.country}</td>


            <td><a href="/user?actionClient=update&id=${user.id}">Update</a></td>
            <td><a href="/user?actionClient=delete&id=${user.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
        <p>${msg}</p>

</body>
</html>
