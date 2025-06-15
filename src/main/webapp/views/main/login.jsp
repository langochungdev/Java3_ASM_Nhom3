<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
    <script>
        function togglePassword() {
            const pwd = document.getElementById("password");
            pwd.type = pwd.type === "password" ? "text" : "password";
        }
    </script>
</head>
<body class="d-flex flex-column min-vh-100">

<header class="bg-dark text-white shadow-sm">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="main?page=main">Trang tin tức HKH</a>
        </div>
    </nav>
</header>

<div class="container d-flex justify-content-center align-items-center flex-grow-1 my-5">
    <div class="card p-4 shadow" style="width: 22rem;">
        <h2 class="text-center mb-3">Đăng nhập</h2>

        <form method="post" action="login">
            <div class="mb-3">
                <label for="id" class="form-label">Tài khoản</label>
                <input type="text" class="form-control" name="id" id="id"
                       value="${savedId != null ? savedId : ''}" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu</label>
                <div class="input-group">
                    <input type="password" class="form-control" name="password" id="password"
                           value="${savedPass != null ? savedPass : ''}" required>
                    <button type="button" class="btn btn-outline-secondary" onclick="togglePassword()">👁️</button>
                </div>
            </div>

            <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" name="remember" id="remember"
                       ${remembered ? "checked" : ""}>
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
    <div class="container text-center">
        <p class="small mb-0">© 2025 Tin tức HKH. All rights reserved.</p>
    </div>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
