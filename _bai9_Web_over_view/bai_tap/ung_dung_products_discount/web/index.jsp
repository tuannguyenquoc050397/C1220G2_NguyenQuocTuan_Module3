<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 08-Apr-21
  Time: 2:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/index">

    <table>
      <tr>
        <td>Product description</td>
        <td><textarea name="description" cols="30" rows="10"></textarea></td>
      </tr>
      <tr>
        <td>List price</td>
        <td><input type="text" name="price"></td>
      </tr>
      <tr>
        <td>Discount percent</td>
        <td><input type="text" name="discount"></td>
      </tr>
      <tr>
        <td> <input type = "submit" id = "submit" value = "discount"/></td>
      </tr>
    </table>
  </form>
      <h2>price: <%=request.getAttribute("price")%>></h2>
    <h2>discount: <%=request.getAttribute("discount")%>></h2>
    <h2>amount: <%=request.getAttribute("result")%>></h2>

  </body>
</html>
