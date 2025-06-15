package Controller;

import DAO.UserDAOImpl;
import Entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Date;

@WebServlet("/admin/user")
public class UserServlet extends HttpServlet {
    private final UserDAOImpl dao = new UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");
        String id = req.getParameter("id");
        String fullname = req.getParameter("fullname");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String role = req.getParameter("role");

        String error = null;

        try {
            switch (action) {
                case "create":
                    if (dao.findById(id) != null) {
                        error = "Người dùng đã tồn tại!";
                    } else {
                        dao.insert(new User(id, "123", fullname, null, true, mobile, email, Boolean.parseBoolean(role)));
                    }
                    break;

                case "update":
                    if (dao.findById(id) == null) {
                        error = "Không tìm thấy người dùng!";
                    } else {
                        dao.update(new User(id, "123", fullname, null, true, mobile, email, Boolean.parseBoolean(role)));
                    }
                    break;

                case "delete":
                    User target = dao.findById(id);
                    User current = (User) req.getSession().getAttribute("currentUser");

                    if (target == null) {
                        error = "Không tìm thấy người dùng để xóa!";
                    } else if (target.getId().equals(current.getId())) {
                        error = "Bạn không được phép xóa chính mình!";
                    } else if (target.isRole() && current.isRole()) {
                        error = "Bạn không được phép xóa người dùng có quyền quản trị!";
                    } else {
                        dao.delete(id);
                    }
                    break;

                default:
                    error = "Hành động không hợp lệ!";
            }
        } catch (Exception e) {
            e.printStackTrace();
            error = "Lỗi xử lý dữ liệu người dùng!";
        }

        if (error != null) {
            String redirectUrl = req.getContextPath() + String.format(
                    "/admin?page=nguoidung&error=%s&id=%s&fullname=%s&email=%s&mobile=%s&role=%s",
                    URLEncoder.encode(error, "UTF-8"),
                    URLEncoder.encode(id, "UTF-8"),
                    URLEncoder.encode(fullname, "UTF-8"),
                    URLEncoder.encode(email, "UTF-8"),
                    URLEncoder.encode(mobile, "UTF-8"),
                    URLEncoder.encode(role, "UTF-8")
            );
            resp.sendRedirect(redirectUrl);
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin?page=nguoidung");
        }
    }
}