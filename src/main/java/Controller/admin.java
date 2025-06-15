package Controller;

import java.io.IOException;
import java.util.List;

import DAO.CategoryDAO;
import DAO.NewsDAOImpl;
import DAO.NewsletterDAOImpl;
import DAO.UserDAOImpl;
import Entity.Category;
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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String page = request.getParameter("page");
        String includePage;

        User user = (User) request.getSession().getAttribute("currentUser");

        switch (page != null ? page : "") {

            case "tintuc":
                String authorId = user != null ? user.getId() : null;
                NewsDAOImpl newsDAO = new NewsDAOImpl();

                String selectedId = request.getParameter("id");
                if (selectedId != null && !selectedId.trim().isEmpty()) {
                    News selected = newsDAO.findById(selectedId);
                    if (selected != null) {
                        request.setAttribute("selectedNews", selected);
                    }
                }

                request.setAttribute("items", newsDAO.findByAuthor(authorId));
                request.setAttribute("categories", new CategoryDAO().findAll());

                String success = request.getParameter("success");
                if (success != null) {
                    request.setAttribute("success", success);
                }

                includePage = "/views/admin/tintuc.jsp";
                break;

            case "loaitin":
                List<Category> categoryList = new CategoryDAO().findAll();
                request.setAttribute("categoryList", categoryList);
                request.setAttribute("id", request.getParameter("id"));
                request.setAttribute("name", request.getParameter("name"));
                includePage = "/views/admin/loaitin.jsp";
                break;

            case "nguoidung":
                request.setAttribute("userList", new UserDAOImpl().findAll());
                request.setAttribute("id", request.getParameter("id"));
                request.setAttribute("fullname", request.getParameter("fullname"));
                request.setAttribute("email", request.getParameter("email"));
                request.setAttribute("mobile", request.getParameter("mobile"));
                request.setAttribute("role", request.getParameter("role"));
                request.setAttribute("error", request.getParameter("error"));
                includePage = "/views/admin/nguoidung.jsp";
                break;

            case "newsletter":
                List<Newsletter> newsletterList = new NewsletterDAOImpl().findAll();
                request.setAttribute("newsletterList", newsletterList);
                includePage = "/views/admin/newsletter.jsp";
                break;

            case "tinchitiet":
                String newsId = request.getParameter("id");
                if (newsId != null) {
                    News news = new NewsDAOImpl().findById(newsId);
                    if (news != null) {
                        request.setAttribute("news", news);
                        request.setAttribute("relatedNews",
                                new NewsDAOImpl().findByCategory(news.getCategoryId(), news.getId()));
                    }
                }
                includePage = "/views/admin/tinchitiet.jsp";
                break;

            default:
                List<News> newsList = new NewsDAOImpl().findHomeNews();
                request.setAttribute("newsList", newsList);
                includePage = "/views/admin/trangchu.jsp";
                break;
        }

        request.setAttribute("includePage", includePage);
        request.getRequestDispatcher("/views/admin.jsp").forward(request, response);
    }
}
