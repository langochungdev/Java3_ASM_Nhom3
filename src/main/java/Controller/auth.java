package Controller;

import java.io.IOException;
import java.util.Base64;

import DAO.UserDAOImpl;
import Entity.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet({"/login", "/logout"})
public class auth extends HttpServlet {
    private UserDAOImpl dao = new UserDAOImpl();

    private String encode(String data) {
        return Base64.getEncoder().encodeToString(data.getBytes());
    }

    private String decode(String encoded) {
        return new String(Base64.getDecoder().decode(encoded));
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String uri = req.getRequestURI();

        if (uri.endsWith("/logout")) {
            // 🔒 ĐĂNG XUẤT
            req.getSession().invalidate();

            boolean remember = false;
            Cookie[] cookies = req.getCookies();
            if (cookies != null) {
                for (Cookie c : cookies) {
                    if ("remember".equals(c.getName()) && "1".equals(c.getValue())) {
                        remember = true;
                        break;
                    }
                }
            }

            // Nếu KHÔNG tick ghi nhớ → xóa cookie
            if (!remember && cookies != null) {
                for (Cookie c : cookies) {
                    if ("auth".equals(c.getName()) || "remember".equals(c.getName())) {
                        c.setMaxAge(0);
                        c.setPath("/");
                        resp.addCookie(c);
                    }
                }
            }

            resp.sendRedirect("main?page=main");
        } else {
            // 🧑‍💻 VÀO TRANG LOGIN
            req.getRequestDispatcher("/views/main/login.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String id = req.getParameter("id");
        String pw = req.getParameter("password");
        String remember = req.getParameter("remember");

        User user = dao.login(id, pw);

        if (user != null) {
            // ✅ Lưu user vào session
            req.getSession().setAttribute("currentUser", user);

            // ✅ Nếu có chọn "Ghi nhớ tôi"
            if ("on".equals(remember)) {
                String raw = id + ":" + pw;
                String encoded = encode(raw);

                Cookie cAuth = new Cookie("auth", encoded);
                cAuth.setMaxAge(30 * 24 * 60 * 60);
                cAuth.setPath("/");

                Cookie cRemember = new Cookie("remember", "1");
                cRemember.setMaxAge(30 * 24 * 60 * 60);
                cRemember.setPath("/");

                resp.addCookie(cAuth);
                resp.addCookie(cRemember);
            }

            // ✅ Thành công → vào trang admin
            resp.sendRedirect("admin");
        } else {
            // ❌ Sai tài khoản
            req.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
            req.getRequestDispatcher("/views/main/login.jsp").forward(req, resp);
        }
    }
}
