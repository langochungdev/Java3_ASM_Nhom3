package Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import DAO.CategoryDAO;
import DAO.DAOchung;
import DAO.NewsDAOImpl;
import DAO.NewsletterDAOImpl;
import Entity.Category;
import Entity.News;
import Entity.Newsletter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/main")
public class main extends HttpServlet {
    private DAOchung newsDAO = new NewsDAOImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String page = request.getParameter("page");
        String includePage;
        HttpSession session = request.getSession();

        List<Category> categories = new CategoryDAO().findAll();
        request.setAttribute("categories", categories);

        request.setAttribute("topViewed", ((NewsDAOImpl) newsDAO).findTopViewed(5));
        request.setAttribute("latestNews", ((NewsDAOImpl) newsDAO).findLatest(5));

        List<String> viewedIds = (List<String>) session.getAttribute("viewedNewsIds");
        List<News> viewedNews = new ArrayList<>();
        if (viewedIds != null) {
            for (String vid : viewedIds) {
                News n = ((NewsDAOImpl) newsDAO).findById(vid);
                if (n != null) {
                    viewedNews.add(n);
                }
            }
        }
        request.setAttribute("viewedNews", viewedNews);

        switch (page != null ? page : "") {
            case "phapluat":
                request.setAttribute("newsList", ((NewsDAOImpl) newsDAO).findByCategory("CAT01"));
                request.setAttribute("title", "Tin Pháp luật");
                request.setAttribute("colorClass", "text-danger");
                includePage = "/views/main/chuyenmuc.jsp";
                break;

            case "thethao":
                request.setAttribute("newsList", ((NewsDAOImpl) newsDAO).findByCategory("CAT02"));
                request.setAttribute("title", "Tin Thể thao");
                request.setAttribute("colorClass", "text-warning");
                includePage = "/views/main/chuyenmuc.jsp";
                break;

            case "vanhoa":
                request.setAttribute("newsList", ((NewsDAOImpl) newsDAO).findByCategory("CAT03"));
                request.setAttribute("title", "Tin Văn hóa");
                request.setAttribute("colorClass", "text-success");
                includePage = "/views/main/chuyenmuc.jsp";
                break;

            case "cat":
                String catId = request.getParameter("id");
                if (catId != null) {
                    request.setAttribute("newsList", ((NewsDAOImpl) newsDAO).findByCategory(catId));
                    Category selectedCat = new CategoryDAO().findById(catId);
                    if (selectedCat != null) {
                        request.setAttribute("title", selectedCat.getName());
                        request.setAttribute("colorClass", "text-primary");
                    }
                    includePage = "/views/main/chuyenmuc.jsp";
                } else {
                    includePage = "/views/main/trangchu.jsp";
                }
                break;

            case "toptin":
                request.setAttribute("viewedNews", ((NewsDAOImpl) newsDAO).findTopViewed(5));
                includePage = "/views/main/toptin.jsp";
                break;

            case "tinmoinhat":
                request.setAttribute("viewedNews", ((NewsDAOImpl) newsDAO).findLatest(5));
                includePage = "/views/main/tinmoinhat.jsp";
                break;

            case "tinchitiet":
                String id = request.getParameter("id");
                if (id != null) {
                    NewsDAOImpl dao = (NewsDAOImpl) newsDAO;
                    News news = dao.findById(id);
                    request.setAttribute("news", news);

                    if (news != null) {
                        dao.increaseViewCount(id);

                        if (viewedIds == null) viewedIds = new ArrayList<>();
                        viewedIds.remove(id);
                        viewedIds.add(0, id);
                        if (viewedIds.size() > 5) {
                            viewedIds = viewedIds.subList(0, 5);
                        }
                        session.setAttribute("viewedNewsIds", viewedIds);

                        if (news.getCategoryId() != null) {
                            List<News> related = dao.findByCategory(news.getCategoryId(), news.getId());
                            request.setAttribute("relatedNews", related);
                        }
                    }
                }
                includePage = "/views/main/tinchitiet.jsp";
                break;

            case "recent":
                includePage = "/views/main/tinvuaxem.jsp";
                break;

            default:
                List<News> list = ((NewsDAOImpl) newsDAO).findHomeNews();
                request.setAttribute("newsList", list);
                includePage = "/views/main/trangchu.jsp";
                break;
        }

        request.setAttribute("includePage", includePage);
        request.getRequestDispatcher("/views/main.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
    }
}
