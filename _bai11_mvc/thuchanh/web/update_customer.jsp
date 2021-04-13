<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 12-Apr-21
  Time: 1:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Update customer</h2>
<form action="">
    <p>
        Name:
        <input type="text" name="name" value="${customerObj.name}"/>
    </p>
    <p>
        Email
        <input type="text" name="email" value="${customerObj.email}"/>
    </p>
    <p>
        <input type="submit" value="Update">
    </p>
</form>
</body>
</html>
