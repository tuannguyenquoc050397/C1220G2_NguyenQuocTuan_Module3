
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Update User</h2>
<p style="color: red">${msg}</p>
<form action="/user" method="post">
    <input type="hidden" name="actionClient" value="update">
    <input type="hidden" name="id" value="${userObj.id}">
    <input type="hidden" name="country" value="${userObj.country}">

    <p>
        Name:
        <input type="text" name="name" value="${userObj.name}"/>
    </p>
    <p>
        Email:
        <input type="text" name="email" value="${userObj.email}"/>
    </p>
    <p>
        <input type="submit" value="Update">
    </p>
</form>
</body>
</html>
