<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12-Apr-21
  Time: 1:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List student by JSTL</title>
</head>
<body>
<h2>List student by JSTL</h2>
<table border="1">
    <tr>

        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Address</th>
        <th colspan="2">Action</th>
    </tr>
    <c:forEach var="customer" items="${customerListServlet}" varStatus="loop">
        <tr>
            <td>${customer.id}</td>
            <td><c:out value="${customer.name}"/></td>
            <td>${customer.email}</td>
            <td><c:out value="${customer.address}"/></td>

            <td><a href="/customer?actionClient=update&id=${customer.id}">Update</a></td>
            <td><a href="/customer?actionClient=delete&id=${customer.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
