package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

import DAO.NewsDAOImpl;
import Entity.News;
import Entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/tintuc")
@MultipartConfig
public class NewsServlet extends HttpServlet {
    private final NewsDAOImpl dao = new NewsDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        User currentUser = (User) req.getSession().getAttribute("currentUser");

        if (currentUser == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String id = req.getParameter("id");
        String title = req.getParameter("title");
        String content = req.getParameter("content");
        String postedDateStr = req.getParameter("postedDate");
        String categoryId = req.getParameter("categoryId");
        boolean home = req.getParameter("home") != null;
        String action = req.getParameter("action");

        String imageName = null;
        try {
            Part filePart = req.getPart("image");
            if (filePart != null && filePart.getSize() > 0) {
                imageName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
                String uploadPath = req.getServletContext().getRealPath("/images");
                new File(uploadPath).mkdirs();
                filePart.write(uploadPath + File.separator + imageName);
            }
        } catch (Exception ignored) {
        }

        try {
            // Lấy ảnh cũ nếu không upload ảnh mới
            if ((imageName == null || imageName.isEmpty()) && id != null) {
                News old = dao.findById(id);
                if (old != null) {
                    imageName = old.getImage();
                }
            }

            switch (action) {
                case "create": {
                    String newId = "news" + System.currentTimeMillis();
                    Date postedDate = new SimpleDateFormat("yyyy-MM-dd").parse(postedDateStr);
                    News news = new News(newId, title, content, imageName, postedDate, currentUser.getId(), 0, categoryId, home);
                    dao.create(news);
                    break;
                }
                case "update": {
                    Date postedDate = new SimpleDateFormat("yyyy-MM-dd").parse(postedDateStr);
                    News updated = new News(id, title, content, imageName, postedDate, currentUser.getId(), 0, categoryId, home);
                    dao.update(updated);
                    break;
                }
                case "delete": {
                    dao.deleteById(id);
                    break;
                }
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Lỗi xử lý tin tức: " + e.getMessage(), e);
        }

        resp.sendRedirect("admin?page=tintuc");
    }
}
