package controller;

import java.io.IOException;
import dao.NewsletterDAOImpl;
import entity.Newsletter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/newsletter")
public class newsletter extends HttpServlet {
    private NewsletterDAOImpl dao = new NewsletterDAOImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String enabledParam = request.getParameter("enabled");
        boolean enabled = "true".equals(enabledParam);
        String action = request.getParameter("action");

        Newsletter newsletter = new Newsletter(email, enabled);

        String error = null;

        switch (action) {
            case "create":
                if (dao.findById(email) != null) {
                    error = "Email đã tồn tại, không thể thêm mới.";
                } else {
                    dao.create(newsletter);
                }
                break;

            case "update":
                if (dao.findById(email) == null) {
                    error = "Email không tồn tại, không thể cập nhật.";
                } else {
                    dao.update(newsletter);
                }
                break;

            case "delete":
                if (dao.findById(email) == null) {
                    error = "Email không tồn tại, không thể xóa.";
                } else {
                    dao.deleteById(email);
                }
                break;

            default:
                error = "Hành động không hợp lệ.";
        }

        if (error != null) {
            // Redirect kèm error và giữ lại dữ liệu nhập
            String redirectUrl = String.format("admin?page=newsletter&error=%s&email=%s&enabled=%s",
                    java.net.URLEncoder.encode(error, "UTF-8"),
                    java.net.URLEncoder.encode(email, "UTF-8"),
                    java.net.URLEncoder.encode(String.valueOf(enabled), "UTF-8"));
            response.sendRedirect(redirectUrl);
        } else {
            response.sendRedirect("admin?page=newsletter");
        }
    }
}
