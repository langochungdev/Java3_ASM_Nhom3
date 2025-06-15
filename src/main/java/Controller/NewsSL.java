package Controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import DAO.NewsDAOImpl;
import DAO.NewsletterDAOImpl;
import Entity.News;
import Entity.Newsletter;
import Entity.User;
import Utils.Mailer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/tintuc")
@MultipartConfig
public class NewsSL extends HttpServlet {
    private final NewsDAOImpl dao = new NewsDAOImpl();
    private final NewsletterDAOImpl newsletterDAO = new NewsletterDAOImpl();

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
                String uploadPath = req.getServletContext().getRealPath("/metadata");
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

                    // ✅ Gửi mail cho tất cả người đăng ký
                    List<Newsletter> subs = newsletterDAO.findAll();
                    String imagePath = req.getServletContext().getRealPath("/metadata/" + imageName);

                    for (Newsletter sub : subs) {
                        if (sub.isEnabled()) {
                            String to = sub.getEmail();
                            String subject = "[Tin mới] " + title;
                            String body = "<h3>" + title + "</h3>"
                                        + "<p>" + content + "</p>"
                                        + "<p><a href='http://localhost:8080/asm-java3/main?page=tinchitiet&id=" + newId + "'>Xem chi tiết</a></p>";

                            Mailer.send("langochungse23@gmail.com", to, subject, body, imagePath);
                        }
                    }

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
