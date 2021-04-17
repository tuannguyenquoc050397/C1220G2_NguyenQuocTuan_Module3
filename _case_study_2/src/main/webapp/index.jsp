<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 15-Apr-21
  Time: 2:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>


    <link rel="stylesheet" href="/bootstrap413/css/bootstrap.min.css">
  </head>
  <body>


  <div class="container-fluid sticky-top ">
    <div class="row" style="height: 110px ;background-image: -webkit-linear-gradient(right, rgba(255,255,255,1) 0%,rgba(255,255,255,0) 50%), url('../img/unnamed.jpg')" >
      <div class="col-2 mt-4" style="left: 30px">
        <img src="../img/te2qSRH8.jpg" height="60%" width="60%"/>
      </div>
      <div class=" col-6"></div>
      <div class="col-4 mt-5" style="font-size: 20px; text-align: center; left: 0; top: 20px">
        <strong>Nguyen Quoc Tuan Vip Pro</strong>
      </div>
    </div>
  </div>



  <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top">
    <a class="navbar-brand" href="#"><strong>Tuan Pro</strong></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item ">
          <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Employee</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/customer">Customer</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Service</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contract</a>
        </li>

      </ul>
      <form class="form-inline my-2 my-lg-0">
        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
      </form>
    </div>
  </nav>
  <div class="container ">
    <div class="row">
      <div class="col-3" style="background: #33b5e5; height: 600px" >


      </div>
      <div class="col-9" style="background: #34ce57; height: 300px ">


      </div>
    </div>
  </div>

  <div class="container">
    <div class="row">
      <div class="col-12" style="background: #777777; height: 100px ">
        <strong>Footer</strong>
      </div>
    </div>
  </div>


  <script src="jquery/jquery-3.5.1.min.js"></script>
  <script src="datatables/js/jquery.dataTables.min.js"></script>
  <script src="datatables/js/dataTables.bootstrap4.min.js"></script>
  <script>
      $(document).ready(function() {
          $('#userTable').dataTable( {
              "dom": 'lrtip',
              "lengthChange": false,
              "pageLength": 5
          } );
      } );
  </script>

  </body>
</html>
