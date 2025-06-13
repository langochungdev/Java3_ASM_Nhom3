package Controller;
import java.io.IOException;
import java.util.List;
import DAO.NewsDAOImpl;
import DAO.NewsletterDAOImpl;
import Entity.News;
import Entity.Newsletter;
import Entity.User;
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
     // Kiểm tra phân quyền trong Controller
        User user = (User) request.getSession().getAttribute("currentUser");
        if (user != null && !user.isRole()) { // nếu là phóng viên
            if ("nguoidung".equals(page) || "newsletter".equals(page)) {
                response.sendError(HttpServletResponse.SC_FORBIDDEN, "Bạn không có quyền truy cập trang này!");
                return;
            }
        }
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
//hung
            case "newsletter":
                includePage = "/views/admin/newsletter.jsp";
                List<Newsletter> newsletterList = new NewsletterDAOImpl().findAll();
                request.setAttribute("newsletterList", newsletterList);
                break;
            default:
            	List<News> newsList = new NewsDAOImpl().findHomeNews();
                request.setAttribute("newsList", newsList);
                includePage = "/views/main/trangchu.jsp";
                break;
        }
        
        request.setAttribute("includePage", includePage);
        request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
    }
}
