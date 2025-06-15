package Controller;

import java.io.IOException;
import java.util.Base64;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import DAO.UserDAOImpl;
import Entity.User;

@WebServlet({"/login", "/logout"})
public class Auth extends HttpServlet {
    private final UserDAOImpl userDAO = new UserDAOImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String uri = req.getRequestURI();

        if (uri.endsWith("/logout")) {
            HttpSession session = req.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            res.sendRedirect("main?page=main");

        } else {
            Cookie[] cookies = req.getCookies();
            String savedId = null, savedPass = null;
            boolean remembered = false;

            if (cookies != null) {
                for (Cookie ck : cookies) {
                    if ("uid".equals(ck.getName())) {
                        savedId = ck.getValue();
                    } else if ("upass".equals(ck.getName())) {
                        savedPass = decode(ck.getValue());
                    }
                }
            }

            if (savedId != null && savedPass != null) {
                remembered = true;
            }

            req.setAttribute("savedId", savedId);
            req.setAttribute("savedPass", savedPass);
            req.setAttribute("remembered", remembered);
            req.getRequestDispatcher("/views/main/login.jsp").forward(req, res);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String id = req.getParameter("id");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");

        User user = userDAO.login(id, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("currentUser", user);

            if ("on".equals(remember)) {
                Cookie ckId = new Cookie("uid", user.getId());
                Cookie ckPass = new Cookie("upass", encode(user.getPassword()));
                Cookie ckRole = new Cookie("urole", user.isRole() ? "admin" : "reporter");

                int age = 30 * 24 * 60 * 60;
                ckId.setMaxAge(age);
                ckPass.setMaxAge(age);
                ckRole.setMaxAge(age);

                res.addCookie(ckId);
                res.addCookie(ckPass);
                res.addCookie(ckRole);
            } else {
                Cookie ckId = new Cookie("uid", "");
                Cookie ckPass = new Cookie("upass", "");
                Cookie ckRole = new Cookie("urole", "");

                ckId.setMaxAge(0);
                ckPass.setMaxAge(0);
                ckRole.setMaxAge(0);

                res.addCookie(ckId);
                res.addCookie(ckPass);
                res.addCookie(ckRole);
            }

            res.sendRedirect("admin?page=main");
        } else {
            req.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            req.getRequestDispatcher("/views/main/login.jsp").forward(req, res);
        }
    }

    private String encode(String input) {
        return Base64.getEncoder().encodeToString(input.getBytes());
    }

    private String decode(String input) {
        try {
            return new String(Base64.getDecoder().decode(input));
        } catch (IllegalArgumentException e) {
            return "";
        }
    }
}
