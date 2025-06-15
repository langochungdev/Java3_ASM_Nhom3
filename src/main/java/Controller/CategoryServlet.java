package Controller;

import DAO.CategoryDAO;
import Entity.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/loaitin")
public class CategoryServlet extends HttpServlet {
    private final CategoryDAO dao = new CategoryDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String id = req.getParameter("id");
        String name = req.getParameter("name");
        String action = req.getParameter("action");

        Category category = new Category(id, name);
        String error = null;

        switch (action) {
            case "create":
                if (dao.findById(id) != null) {
                    error = "Mã loại tin đã tồn tại!";
                } else {
                    dao.create(category);
                }
                break;
            case "update":
                if (dao.findById(id) == null) {
                    error = "Mã loại tin không tồn tại!";
                } else {
                    dao.update(category);
                }
                break;
            case "delete":
                if (dao.findById(id) == null) {
                    error = "Không tìm thấy loại tin để xóa!";
                } else {
                    dao.deleteById(id);
                }
                break;
            default:
                error = "Hành động không hợp lệ.";
        }

        if (error != null) {
            String redirectUrl = String.format("admin?page=loaitin&error=%s&id=%s&name=%s",
                    java.net.URLEncoder.encode(error, "UTF-8"),
                    java.net.URLEncoder.encode(id, "UTF-8"),
                    java.net.URLEncoder.encode(name, "UTF-8"));
            resp.sendRedirect(redirectUrl);
        } else {
            resp.sendRedirect("admin?page=loaitin");
        }
    }
}
