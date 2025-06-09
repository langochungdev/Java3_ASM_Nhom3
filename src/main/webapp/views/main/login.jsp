<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
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
            <form>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Nhập email">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" class="form-control" id="password" placeholder="Nhập mật khẩu">
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Remember me?</label>
                </div>
                <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
                <hr>
                <button type="submit" class="btn btn-primary w-100">Đăng ký</button>
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
    
</body>
</html>