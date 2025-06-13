package Controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import DAO.DAOchung;
import DAO.NewsDAOImpl;
import DAO.NewsletterDAOImpl;
import Entity.News;
import Entity.Newsletter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

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
//hung
            case "tinchitiet":
                String id = request.getParameter("id");
                if (id != null) {
                    News news = new NewsDAOImpl().findById(id);
                    request.setAttribute("news", news);

                    if (news != null) {
                        HttpSession session = request.getSession();
                        List<String> viewedIds = (List<String>) session.getAttribute("viewedNewsIds");

                        if (viewedIds == null) {
                            viewedIds = new ArrayList<>();
                        }
                        viewedIds.remove(id);
                        viewedIds.add(0, id); 
                        if (viewedIds.size() > 5) {
                            viewedIds = viewedIds.subList(0, 5);
                        }
                        session.setAttribute("viewedNewsIds", viewedIds);
                        if (news.getCategoryId() != null) {
                            List<News> relatedNews = new NewsDAOImpl().findByCategory(news.getCategoryId());
                            request.setAttribute("relatedNews", relatedNews);
                        }
                    }
                }

                includePage = "/views/main/tinchitiet.jsp";
                break;
            case "recent":
                HttpSession session = request.getSession();
                List<String> viewedIds = (List<String>) session.getAttribute("viewedNewsIds");
                List<News> viewedNews = new ArrayList<>();

                if (viewedIds != null) {
                    for (String vid : viewedIds) {
                        News n = new NewsDAOImpl().findById(vid);
                        if (n != null) {
                            viewedNews.add(n);
                        }
                    }
                }

                request.setAttribute("viewedNews", viewedNews);
                includePage = "/views/main/tinvuaxem.jsp";
                break;

            default:
                List<News> list = new NewsDAOImpl().findHomeNews();
                request.setAttribute("newsList", list);
                includePage = "/views/main/trangchu.jsp";
                break;
        }

        request.setAttribute("includePage", includePage);
        request.getRequestDispatcher("/views/main.jsp").forward(request, response);
    }
//hung end
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//hung 
        String email = request.getParameter("newsletter");
        if (email != null && !email.trim().isEmpty()) {
            NewsletterDAOImpl dao = new NewsletterDAOImpl();
            Newsletter newsletter = new Newsletter(email.trim(), true);

            if (dao.findById(email.trim()) == null) {
                dao.create(newsletter);
                request.setAttribute("message", "Đăng ký email thành công!");
            } else {
                request.setAttribute("message", "Email đã tồn tại trong danh sách!");
            }
        } else {
            request.setAttribute("message", "Vui lòng nhập email hợp lệ!");
        }
 
        doGet(request, response);
//hung end
    }
}
