
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List student by JSTL</title>
</head>
<body>

<h2><a href="/user?actionClient=create">Add New User</a> </h2>

<h2><a href="/user?actionClient=back">Back To New List</a></h2>

<h2><a href="/user?actionClient=sort">Sort List</a></h2>

<h2><a href="/user?actionClient=findByCountry">Find By Country</a></h2>

<form action="/user">
    <input type="hidden" name="actionClient" value="getById" />
    <input type="text" name="id" value="${keywordJSP}"/>
    <input type="submit" value="Search" />
</form>

<h2>List user by JSTL</h2>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th colspan="3">Action</th>
    </tr>

    <c:forEach var="user" items="${userListServlet}" varStatus="loop">
        <tr>
            <td>${user.id}</td>
            <td><c:out value="${user.name}"/></td>
            <td>${user.email}</td>
            <td>${user.country}</td>


            <td><a href="/user?actionClient=update&id=${user.id}">Update</a></td>
            <td><a href="/user?actionClient=delete&id=${user.id}">Delete</a></td>
            <td><a href="/user?actionClient=editUser&id=${user.id}">Edit_SP</a></td>
        </tr>
    </c:forEach>
</table>
        <p>${msg}</p>

<p>
    <a href="/user?actionClient=getAll">Get All User</a>
</p>


</body>
</html>
