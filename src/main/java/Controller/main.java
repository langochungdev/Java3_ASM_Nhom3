package Controller;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/main")
public class main extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String page = request.getParameter("page");
        String includePage;
        
        switch (page != null ? page : "") {
            case "phapluat":
                includePage = "/views/main/phapluat.jsp";
                break;
            case "thethao":
            	includePage = "/views/main/thethao.jsp";
                break;
            case "vanhoa":
            	includePage = "/views/main/vanhoa.jsp";
                break; 
            case "tinchitiet":
                includePage = "/views/main/tinchitiet.jsp";
                break;
            default:
                includePage = "/views/main/trangchu.jsp";
                break;
        }
        
        request.setAttribute("includePage", includePage);
        request.getRequestDispatcher("/views/main.jsp").forward(request, response);
    }
}