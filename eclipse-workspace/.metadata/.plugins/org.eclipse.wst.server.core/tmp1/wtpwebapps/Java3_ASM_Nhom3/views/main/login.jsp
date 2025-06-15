<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
<script>
    function togglePassword() {
        const pwd = document.getElementById("password");
        pwd.type = pwd.type === "password" ? "text" : "password";
    }
</script>
<header class="bg-dark text-white shadow-sm">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<div class="container">
				<a class="navbar-brand" href="#">Trang tin tức HKH</a>
				<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav mx-auto">
						<li class="nav-item"><a class="nav-link" href="main?page=main">Trang chủ</a></li>
						<li class="nav-item"><a class="nav-link" href="main?page=vanhoa">Văn hóa</a></li>
						<li class="nav-item"><a class="nav-link" href="main?page=phapluat">Pháp luật</a></li>
						<li class="nav-item"><a class="nav-link" href="main?page=thethao">Thể thao</a></li>
					</ul>
					<div class="ms-auto">
						<a href="login" class="btn btn-outline-light">Đăng nhập</a>
					</div>
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
                <input type="text" class="form-control" name="id" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu</label>
                <div class="input-group">
                    <input type="password" class="form-control" name="password" id="password" required>
                    <button type="button" class="btn btn-outline-secondary" onclick="togglePassword()">👁️</button>
                </div>
            </div>

            <div class="form-check mb-3">
                <input type="checkbox" class="form-check-input" name="remember" id="remember">
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
		<div class="container">
			<div class="row">
				<div class="col-md-4 mb-3 mb-md-0">
					<h5>Trang tin tức HKH</h5>
					<p class="small">Cập nhật tin tức mới nhất.</p>
				</div>
				<div class="col-md-4 mb-3 mb-md-0">
					<h5>Liên kết nhanh</h5>
					<ul class="list-unstyled">
						<li><a href="#" class="text-white text-decoration-none">Chính sách bảo mật</a></li>
						<li><a href="#" class="text-white text-decoration-none">Điều khoản sử dụng</a></li>
					</ul>
				</div>
				<div class="col-md-4">
					<h5>Liên hệ</h5>
					<ul class="list-unstyled">
						<li>Email: langochungse23@gmail.com</li>
						<li>Hotline: 0373763354</li>
					</ul>
				</div>
			</div>
			<div class="text-center mt-3">
				<p class="small mb-0">© 2025 Tin túc HKH. All rights reserved.</p>
			</div>
		</div>
	</footer>
