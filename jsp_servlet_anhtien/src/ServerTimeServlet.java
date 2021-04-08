import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(name = "ServerTimeServlet",urlPatterns = "/today")
public class ServerTimeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {PrintWriter writer = response.getWriter();

        Date today = new Date();

        PrintWriter printWriter = response.getWriter();
        printWriter.println("<html>");
        printWriter.println("<body>");
        printWriter.println("<h1>gdfcfghfdhfdhdfhgddh</h1>");
        printWriter.println("<h2 style='color: red'>" + today + "</h2>");
        printWriter.println("</body>");
        printWriter.println("</html>");
    }
}
