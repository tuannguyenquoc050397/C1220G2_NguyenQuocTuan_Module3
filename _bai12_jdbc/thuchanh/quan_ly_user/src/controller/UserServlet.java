package controller;

import model.bean.User;
import model.service.UserService;
import model.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UserServlet", urlPatterns = {"", "/user"})
public class UserServlet extends HttpServlet {

    private UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionClient = request.getParameter("actionClient");

        if (actionClient == null) {
            actionClient = "";
        }

        switch (actionClient) {
            case "create":
                Integer idNew = Integer.parseInt(request.getParameter("id"));
                String countryNew= request.getParameter("country");
                String nameNew = request.getParameter("name");
                String emailNew = request.getParameter("email");

                User userNew = new User(idNew, nameNew, emailNew, countryNew);
                String msgNew = null;
                if (this.userService.save(userNew, actionClient)) {
                    msgNew = "Update successfully!";

                    loadList(request, response);
                } else {
                    msgNew = "Update failed!";

                    request.setAttribute("msg", msgNew);
                    request.setAttribute("userObj", userNew);
                    request.getRequestDispatcher("create_user.jsp").forward(request, response);
                }


                break;
            case "update":
                Integer id = Integer.parseInt(request.getParameter("id"));
                String country= request.getParameter("country");
                String name = request.getParameter("name");
                String email = request.getParameter("email");

                User user = new User(id, name, email, country);

                String msg = null;
                if (this.userService.save(user, actionClient)) {
                    msg = "Update successfully!";
                    loadList(request, response);
                } else {
                    msg = "Update failed!";

                    request.setAttribute("msg", msg);
                    request.setAttribute("userObj", user);
                    request.getRequestDispatcher("update_user.jsp").forward(request, response);
                }
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String actionClient = request.getParameter("actionClient");

        if (actionClient == null) {
            actionClient = "";
        }

        switch (actionClient){

            case "back":

                loadList(request,response);
                

                break;

            case "create":
                    showNewForm(request, response);
                break;
            case "update":
                Integer id = Integer.parseInt(request.getParameter("id"));
                User studentFromService = this.userService.findById(id);

                request.setAttribute("userObj", studentFromService);
                request.getRequestDispatcher("update_user.jsp").forward(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            default:
                loadList(request, response);
        }


    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        User user = new User();
        user.setId(id);
        String msg=null;
        if (this.userService.save(user,"delete")){
            msg="delete successfully";

        }else {

            msg="delete fail !!";

        }


        request.setAttribute("msg", msg);
        request.getRequestDispatcher("list_user.jsp").forward(request, response);


    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("create_user.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }


    }

    private void loadList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("userListServlet", this.userService.findAll());
        request.getRequestDispatcher("list_user.jsp").forward(request, response);
    }
}
