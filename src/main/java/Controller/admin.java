package Controller;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin")
public class admin extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String page = request.getParameter("page");
        String includePage;
        
        switch (page != null ? page : "") {
            case "tintuc":
                includePage = "/views/admin/tintuc.jsp";
                break;
            case "loaitin":
            	includePage = "/views/admin/loaitin.jsp";
                break;
            case "nguoidung":
            	includePage = "/views/admin/nguoidung.jsp";
                break; 
            case "newsletter":
            	includePage = "/views/admin/newsletter.jsp";
                break; 
            default:
                includePage = "/views/main/trangchu.jsp";
                break;
        }
        
        request.setAttribute("includePage", includePage);
        request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
    }
}