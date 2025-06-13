package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import DAO.UserDAOImpl;
import Entity.User;

@WebServlet("/login")
public class login extends HttpServlet {
    private final UserDAOImpl userDAO = new UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");

        User user = userDAO.login(id, password);

        if (user != null) {
            // Lưu vào session
            HttpSession session = req.getSession();
            session.setAttribute("currentUser", user);

            // Nếu có tick ghi nhớ → lưu cookie
            if ("on".equals(remember)) {
                Cookie ckId = new Cookie("uid", user.getId());
                Cookie ckRole = new Cookie("urole", user.isRole() ? "admin" : "reporter");

                ckId.setMaxAge(30 * 24 * 60 * 60);     // 30 ngày
                ckRole.setMaxAge(30 * 24 * 60 * 60);

                res.addCookie(ckId);
                res.addCookie(ckRole);
            }

            res.sendRedirect("admin?page=main");


        } else {
            req.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            req.getRequestDispatcher("/views/main/login.jsp").forward(req, res);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/main/login.jsp").forward(req, res);
    }
}
