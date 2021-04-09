package servlet;

import bean.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = "/list")
public class CustomerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            List<Customer> customerList = new ArrayList<>();

            customerList.add(new Customer("Nguyen Thi A", "09/04/2021", "HN", "https://chiase24.com/wp-content/uploads/2019/09/Tuy%E1%BB%83n-t%E1%BA%ADp-h%C3%ACnh-%E1%BA%A3nh-hot-girl-h%E1%BB%8Dc-sinh-Cute-d%E1%BB%85-th%C6%B0%C6%A1ng-1.jpg"));
            customerList.add(new Customer("Nguyen Thi B", "09/04/2021", "DN", "https://chiase24.com/wp-content/uploads/2019/09/Tuy%E1%BB%83n-t%E1%BA%ADp-h%C3%ACnh-%E1%BA%A3nh-hot-girl-h%E1%BB%8Dc-sinh-Cute-d%E1%BB%85-th%C6%B0%C6%A1ng-1.jpg"));
             customerList.add(new Customer("Nguyen Thi C", "09/04/2021", "HCM", "https://chiase24.com/wp-content/uploads/2019/09/Tuy%E1%BB%83n-t%E1%BA%ADp-h%C3%ACnh-%E1%BA%A3nh-hot-girl-h%E1%BB%8Dc-sinh-Cute-d%E1%BB%85-th%C6%B0%C6%A1ng-1.jpg"));
             customerList.add(new Customer("Nguyen Thi D", "09/04/2021", "QN", "https://chiase24.com/wp-content/uploads/2019/09/Tuy%E1%BB%83n-t%E1%BA%ADp-h%C3%ACnh-%E1%BA%A3nh-hot-girl-h%E1%BB%8Dc-sinh-Cute-d%E1%BB%85-th%C6%B0%C6%A1ng-1.jpg"));
             customerList.add(new Customer("Nguyen Thi E", "09/04/2021", "QT", "https://chiase24.com/wp-content/uploads/2019/09/Tuy%E1%BB%83n-t%E1%BA%ADp-h%C3%ACnh-%E1%BA%A3nh-hot-girl-h%E1%BB%8Dc-sinh-Cute-d%E1%BB%85-th%C6%B0%C6%A1ng-1.jpg"));

            request.setAttribute("customerListServlet", customerList);
            request.getRequestDispatcher("list_customer.jsp").forward(request,response);


    }
}
