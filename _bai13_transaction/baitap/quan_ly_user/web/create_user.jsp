
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Create user</h2>
<p style="color: red">${msg}</p>
<form action="/user" method="post">

    <input type="hidden" name="actionClient" value="create">

    <p>
        Id:
        <input type="text" name="id" />
    </p>
    <p>
        Name:
        <input type="text" name="name" />
    </p>
    <p>
        Email:
        <input type="text" name="email" />
    </p>
    <p>
        Country:
        <input type="text" name="country" />
    </p>
    <p>
        <input type="submit" value="Create">
    </p>
</form>
</body>
</html>
