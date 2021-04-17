<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="bootstrap413/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>

</head>
<body>

<!-- Button modal Create -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#Create">
    create
</button>


<!-- Modal Create -->
<div class="modal fade" id="Create" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitleCreate">Create Customer</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <form action="/customer" >

                                <div class="form-group">

                                    <label for="idCreate">ID</label>
                                    <input type="text" class="form-control" name="id" id="idCreate" placeholder="Example input">
                                </div>
                                <div class="form-group">

                                    <label for="nameCreate">Name</label>
                                    <input type="text" class="form-control" name="name"id="nameCreate" placeholder="Example input">
                                </div>
                                <div class="form-group">
                                    <label for="genderCreate">Gender</label>
                                    <input type="text" class="form-control" name="gender" id="genderCreate" placeholder="Another input">
                                </div>
                                <div class="form-group">
                                    <label for="dateOfBirthCreate">Date of birth</label>
                                    <input type="text" class="form-control" name="dateOfBirth" id="dateOfBirthCreate" placeholder="Another input">
                                </div>
                                <div class="form-group">
                                    <label for="idCardCreate">Id Card</label>
                                    <input type="text" class="form-control" name="idCard" id="idCardCreate"  placeholder="Another input">
                                </div>
                                <div class="form-group">
                                    <label for="phoneCreate">Phone</label>
                                    <input type="text" class="form-control" name="phone" id="phoneCreate" placeholder="Another input">
                                </div>
                                <div class="form-group">
                                    <label for="emailCreate">Email</label>
                                    <input type="text" class="form-control" name="email" id="emailCreate" placeholder="Another input">
                                </div>
                                <div class="form-group">
                                    <label for="addressCreate">Address</label>
                                    <input type="text" class="form-control" name="address" id="addressCreate"  placeholder="Another input">
                                </div>
                                <div class="form-group">
                                    <label for="typeCustomerCreate">Type Customer</label>
                                    <input type="text" class="form-control" name="typeCustomer" id="typeCustomerCreate" placeholder="Another input">
                                </div>

                                <div class="row">

                                    <div class="col-md-6">
                                        <input type="submit" name="actionClient" value="create">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="submit" name="actionClient" value="close">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--<h3 style="color: red">${msg}</h3>--%>

<div class="container">
    <div class="row">
        <div class="col-lg-12">

            <h2>List Customer</h2>


        </div>
    </div>
</div>

<div class="container-fluid">
    <div class="row">
        <div class="col-lg-12">
            <table id="tableCustomer" class="table table-striped table-bordered " style="width: 100%">
                <thead>
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>Date of Birth</th>
                    <th>Gender</th>
                    <th>Id Card</th>
                    <th>Phone</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Type Customer</th>
                    <th>Update</th>
                    <th>Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="customer" items="${customerListServlet}" varStatus="loop">
                    <tr>
                        <td><c:out value="${customer.id}"/></td>
                        <td><c:out value="${customer.name}"/></td>
                        <td><c:out value="${customer.dateOfBirth}"/></td>
                        <td><c:out value="${customer.gender}"/></td>
                        <td><c:out value="${customer.idCard}"/></td>
                        <td><c:out value="${customer.phone}"/></td>
                        <td><c:out value="${customer.email}"/></td>
                        <td><c:out value="${customer.address}"/></td>
                        <td><c:out value="${customer.customerType}"/></td>
                        <td><a class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter"
                                href="#" onclick="setIdUpdate('${customer.id}','${customer.name}',
                                '${customer.dateOfBirth}','${customer.gender}','${customer.idCard}',
                                '${customer.phone}','${customer.email}','${customer.address}',
                                '${customer.customerType}')">Update</a></td>

                        <td>
                            <a class="btn btn-primary" data-toggle="modal" data-target="#exampleModal"
                               href="#"
                               onclick="setIdDeleteToForm('${customer.id}')">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Modal Delete -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Customer</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Are you sure ?????
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="submitFormDelete()">Delete</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal Update -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLongTitle">Update Customer</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12">
                            <form id="formUpdate" action="/customer" method="post">
                                <div class="form-group">
                                    <input type="hidden" name="id" id="idCustomerUpdate">
<%--                                    <input type="hidden" name="actionClient" id="update">--%>

                                    <label for="nameUpdate">Name</label>
                                    <input type="text" class="form-control" name="name" id="nameUpdate" placeholder="Example input">
                                </div>
                                <div class="form-group">
                                    <label for="genderUpdate">Gender</label>
                                    <input type="text" class="form-control" name="gender" id="genderUpdate" placeholder="Another input">
                                </div>
                                <div class="form-group">
                                    <label for="dateOfBirthUpdate">Date of birth</label>
                                    <input type="text" class="form-control" name="dateOfBirth" id="dateOfBirthUpdate" placeholder="Another input">
                                </div>
                                <div class="form-group">
                                    <label for="idCardUpdate">Id Card</label>
                                    <input type="text" class="form-control" name="idCard" id="idCardUpdate" placeholder="Another input">
                                </div>
                                <div class="form-group">
                                    <label for="phoneUpdate">Phone</label>
                                    <input type="text" class="form-control" name="phone" id="phoneUpdate" placeholder="Another input">
                                </div>
                                <div class="form-group">
                                    <label for="emailUpdate">Email</label>
                                    <input type="text" class="form-control" name="email" id="emailUpdate" placeholder="Another input">
                                </div>
                                <div class="form-group">
                                    <label for="addressUpdate">Address</label>
                                    <input type="text" class="form-control" name="address" id="addressUpdate" placeholder="Another input">
                                </div>
                                <div class="form-group">
                                    <label for="typeCustomerUpdate">Type Customer</label>
                                    <input type="text" class="form-control" name="typeCustomer" id="typeCustomerUpdate" placeholder="Another input">
                                </div>

                                <div class="row">

                                    <div class="col-md-6">
                                        <input type="submit" name="actionClient" value="update">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="submit" name="actionClient" value="close">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<form action="/customer" id="deleteForm">

    <input type="hidden" name="actionClient" value="delete">

    <input type="hidden" name="id" id="idCustomerDelete">

</form>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="bootstrap413/js/bootstrap.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 3
        });
    });
</script>
<script>
    function setIdDeleteToForm(idCustomer) {

        document.getElementById("idCustomerDelete").value= idCustomer;

    }

    function submitFormDelete() {

        document.getElementById("deleteForm").submit();

    }

    function setIdUpdate(id, name, dateOfBirth, gender, idCard,
                         phone, email, address, customerType) {

        document.getElementById("idCustomerUpdate").value= id;
        document.getElementById("nameUpdate").value=name;
        document.getElementById("dateOfBirthUpdate").value=dateOfBirth;
        document.getElementById("genderUpdate").value=gender;
        document.getElementById("idCardUpdate").value=idCard;
        document.getElementById("phoneUpdate").value=phone;
        document.getElementById("emailUpdate").value=email;
        document.getElementById("addressUpdate").value=address;
        document.getElementById("typeCustomerUpdate").value=customerType;


    }


</script>

</body>
</html>
