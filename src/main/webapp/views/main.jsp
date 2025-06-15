<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
		<!DOCTYPE html>
		<html lang="vi">

		<head>
			<meta charset="UTF-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1" />
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
			<title>Trang tin tức</title>
		</head>

		<body class="d-flex flex-column min-vh-100">
			<header class="bg-dark text-white shadow-sm">
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
					<div class="container">
						<a class="navbar-brand" href="#">Trang tin tức HKH</a>
						<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
							data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false"
							aria-label="Toggle navigation">
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
								<c:choose>
									<c:when test="${not empty sessionScope.currentUser}">
										<span class="me-2 text-white">${sessionScope.currentUser.fullname}</span>
										<a href="logout" class="btn btn-outline-light">Đăng xuất</a>
									</c:when>
									<c:otherwise>
										<a href="login" class="btn btn-outline-light">Đăng nhập</a>
									</c:otherwise>
								</c:choose>
							</div>

						</div>
					</div>
				</nav>
			</header>

			<div class="container flex-grow-1 my-4">
				<div class="row">
					<main class="col-lg-8 mb-4">
						<jsp:include page="${includePage}" />
					</main>

					<aside class="col-lg-4">
						<div class="list-group mb-3">
							<<<<<<< HEAD <a href="main?page=tinchitiet&id=1"
								class="list-group-item list-group-item-warning">5 bản tin được xem nhiều</a>
								<a href="main?page=tinchitiet&id=2" class="list-group-item list-group-item-warning">5
									bản tin được xem nhiều</a>
								<a href="main?page=recent" class="list-group-item list-group-item-info fw-bold">5 tin
									bạn đã xem</a>
						</div>
						=======
						<a href="main?page=toptin" class="list-group-item list-group-item-warning">🔥 5 tin được xem
							nhiều</a>
						<a href="main?page=tinmoinhat" class="list-group-item list-group-item-success">🆕 5 tin mới
							nhất</a>
						<a href="main?page=recent" class="list-group-item list-group-item-info">👁 5 tin đã xem</a>
				</div>
				>>>>>>> origin/hai

				<form action="main" method="post" class="input-group">
					<input type="email" name="newsletter" placeholder="Nhập email nhận tin" class="form-control" />
					<button class="btn btn-primary" type="submit">Đăng ký</button>
				</form>

				<c:if test="${not empty message}">
					<div class="alert alert-info mt-2">${message}</div>
				</c:if>
				</aside>
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

			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
		</body>

		</html>