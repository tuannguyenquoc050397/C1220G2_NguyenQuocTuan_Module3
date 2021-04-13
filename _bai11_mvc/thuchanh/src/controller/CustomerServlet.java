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

@WebServlet(name = "CustomerServlet", urlPatterns = {"", "/customer"})
public class CustomerServlet extends HttpServlet {

    private CustomerService customerService= new CustomerServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action == null){
            action = "";
        }
        switch (action){
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("actionClient");
        if(action == null){
            action = "";
        }
        switch (action){
            case "update":
                Integer id = Integer.parseInt(request.getParameter("id"));
                Customer customerFromService = this.customerService.findById(id);

                request.setAttribute("customerObj", customerFromService);
                request.getRequestDispatcher("update_customer.jsp").forward(request, response);
                break;
            case "delete":

                break;
            default:
                request.setAttribute("customerListServlet", this.customerService.findAll());
                request.getRequestDispatcher("list_by_jstl.jsp").forward(request,response);
                break;
        }
    }


}
