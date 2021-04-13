<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12-Apr-21
  Time: 2:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List student by JSTL</title>
</head>
<body>

<p><a href="/product?actionClient=create&id=${product.id}">Create</a></p>

<h2>List product by JSTL</h2>
<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Amout</th>
        <th colspan="2">Action</th>
    </tr>
    <c:forEach var="product" items="${productListServlet}">
        <tr>
            <td>${product.id}</td>
            <td><c:out value="${product.name}"/></td>
            <td><c:out value="${product.amount}"/></td>
            <td><a href="/student?actionClient=update&id=${product.id}">Update</a></td>
            <td><a href="/student?actionClient=delete&id=${product.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
