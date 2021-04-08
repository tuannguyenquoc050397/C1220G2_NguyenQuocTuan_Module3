import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "discountServlet", urlPatterns = "/index")
public class discountServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        float  price=Float.parseFloat(request.getParameter("price"));
        float discount=Float.parseFloat(request.getParameter("discount"));
        float result= price*discount/100;
        request.setAttribute("price",price);
        request.setAttribute("discount",discount);
        request.setAttribute("result",result);
        request.getRequestDispatcher("index.jsp").forward(request,response);
    }
}
