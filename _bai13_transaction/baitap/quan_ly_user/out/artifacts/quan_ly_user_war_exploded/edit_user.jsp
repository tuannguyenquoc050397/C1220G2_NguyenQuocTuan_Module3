<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 14-Apr-21
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<h2>Edit User</h2>
<form action="/user" method="post">
    <input type="hidden" name="actionClient" value="editUser">
    <input type="hidden" name="id" value="${userObj.id}">
    <p>
        Name:
        <input type="text" name="name" value="${userObj.name}"/>
    </p>
    <p>
        Email:
        <input type="text" name="email" value="${userObj.email}"/>
    </p>

    <p>
        Country:
        <input type="text" name="country" value="${userObj.country}">
    </p>
    <p>
        <input type="submit" value="Update">
    </p>
</form>


</body>
</html>
