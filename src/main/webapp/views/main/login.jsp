<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String savedUser = "";
    String savedPass = "";
    boolean remembered = false;

    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie c : cookies) {
            if ("auth".equals(c.getName())) {
                try {
                    String decoded = new String(java.util.Base64.getDecoder().decode(c.getValue()));
                    String[] parts = decoded.split(":");
                    if (parts.length == 2) {
                        savedUser = parts[0];
                        savedPass = parts[1];
                    }
                } catch (Exception e) {
                    // Ignore nếu lỗi giải mã
                }
            }
            if ("remember".equals(c.getName()) && "1".equals(c.getValue())) {
                remembered = true;
            }
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <script>
        function togglePassword() {
            const pwd = document.getElementById("password");
            pwd.type = pwd.type === "password" ? "text" : "password";
        }
    </script>
</head>
<body class="bg-light">

<header class="bg-dark text-white shadow-sm">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">Trang tin tức HKH</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item"><a class="nav-link" href="main?page=main">Trang chủ</a></li>
                    <li class="nav-item"><a class="nav-link" href="main?page=vanhoa">Văn hóa</a></li>
                    <li class="nav-item"><a class="nav-link" href="main?page=phapluat">Pháp luật</a></li>
                    <li class="nav-item"><a class="nav-link" href="main?page=thethao">Thể thao</a></li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<div class="container d-flex justify-content-center align-items-center min-vh-100">
    <div class="card p-4" style="width: 22rem;">
        <h2 class="text-center mb-3">Đăng nhập</h2>

        <form method="post" action="login">
            <div class="mb-3">
                <label for="id" class="form-label">Tài khoản</label>
                <input type="text" class="form-control" name="id" id="id" value="<%= savedUser %>" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu</label>
                <div class="input-group">
                    <input type="password" class="form-control" name="password" id="password" value="<%= savedPass %>" required>
                    <button type="button" class="btn btn-outline-secondary" onclick="togglePassword()">👁</button>
                </div>
            </div>

            <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" name="remember" id="remember" <%= remembered ? "checked" : "" %>>
                <label class="form-check-label" for="remember">Ghi nhớ tôi</label>
            </div>

            <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>

            <c:if test="${not empty error}">
                <div class="alert alert-danger mt-3">${error}</div>
            </c:if>
        </form>
    </div>
</div>

<footer class="bg-dark text-white py-4 mt-auto">
    <div class="container text-center small">
        © 2025 Tin tức HKH. All rights reserved.
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
