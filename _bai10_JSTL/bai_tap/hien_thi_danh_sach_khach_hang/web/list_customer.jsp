<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 09-Apr-21
  Time: 1:49 PM
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

<table>
    <tr>
        <th>No</th>
        <th>Name</th>
        <th>Date of birth</th>
        <th>Address</th>
        <th>Image</th>
    </tr>
    <c:forEach var="customer" items="${customerListServlet}" varStatus="loop">
        <tr>
            <td><c:out value="${loop.index+1}"/> </td>
            <td><c:out value="${customer.name}" /></td>
            <td><c:out value="${customer.dateOfBirth}" /></td>
            <td><c:out value="${customer.address}" /></td>
            <td ><img src="${customer.picture}" alt="" height="50px" width="50px"></td>
        </tr>
    </c:forEach>

</table>


</body>
</html>
