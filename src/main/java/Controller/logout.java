package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/logout")
public class logout extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Xoá session nếu có
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("currentUser") != null) {
            session.invalidate(); // huỷ toàn bộ session
        }

        // Không xóa cookie – để tự hết hạn sau 30 ngày

        // Quay về trang chủ
        res.sendRedirect("main?page=main");
    }
}
