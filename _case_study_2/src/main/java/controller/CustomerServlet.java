package controller;

import model.bean.Customer;
import model.service.CustomerService;
import model.service.impl.CustomerServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CustomerServlet", urlPatterns = "/customer")
public class CustomerServlet extends HttpServlet {

    CustomerService customerService = new CustomerServiceImpl();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String actionClient = request.getParameter("actionClient");

        if (actionClient == null) {
            actionClient = "";
        }

        switch (actionClient) {

            case "update":
                String id = request.getParameter("id");
                String name=request.getParameter("name");
                String gender = request.getParameter("gender");
                String dateOfBirth=request.getParameter("dateOfBirth");
                String email = request.getParameter("email");
                String address=request.getParameter("address");
                String idCard = request.getParameter("idCard");
                String phone=request.getParameter("phone");
                String typeCustomer = request.getParameter("typeCustomer");

                Customer customer =new Customer(id, name, dateOfBirth, idCard, phone, email, address, typeCustomer, gender);

                this.customerService.update(customer);


                loadList(request, response);
                break;
            case "create":

                break;
            default:
                loadList(request,response);
            }
        }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String actionClient = request.getParameter("actionClient");

        if (actionClient == null) {
            actionClient = "";
        }

        switch (actionClient) {

            case "create":
                String idCreate = request.getParameter("id");
                String nameCreate=request.getParameter("name");
                String genderCreate = request.getParameter("gender");
                String dateOfBirthCreate=request.getParameter("dateOfBirth");
                String emailCreate = request.getParameter("email");
                String addressCreate=request.getParameter("address");
                String idCardCreate = request.getParameter("idCard");
                String phoneCreate=request.getParameter("phone");
                String typeCustomerCreate = request.getParameter("typeCustomer");

                Customer customerCreate =new Customer(idCreate, nameCreate, dateOfBirthCreate, idCardCreate
                        , phoneCreate, emailCreate, addressCreate, typeCustomerCreate, genderCreate);

                this.customerService.create(customerCreate);
//                if (!this.customerService.create(customerCreate)){
//
//                    request.setAttribute("customerListServlet", customerService.findAll());
//                    request.getRequestDispatcher("customer.jsp").forward(request, response);
//
//                }

                loadList(request, response);



                break;

            case "update":


                break;

            case "delete":
                String idDelete = request.getParameter("id");
                this.customerService.delete(Integer.parseInt(idDelete));
                loadList(request,response);
                break;

            default:
                loadList(request, response);
        }


    }

    private void loadList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("customerListServlet", customerService.findAll());
        request.getRequestDispatcher("customer.jsp").forward(request, response);


    }
}
