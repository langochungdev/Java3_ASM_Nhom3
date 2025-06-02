<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Trang quản trị</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
</head>
<body class="d-flex flex-column min-vh-100">
	<header class="bg-primary text-white text-center py-3">
		<h1>Header: Thiết kế thử đồ</h1>
	</header>

	<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<div class="container">
			<div class="navbar-nav mx-auto">
				<a class="nav-link text-dark" href="admin?page=main">Trang chủ</a>
				<a class="nav-link text-dark" href="admin?page=tintuc">Tin tức</a>
				<a class="nav-link text-dark" href="admin?page=loaitin">Loại tin</a>
				<a class="nav-link text-dark" href="admin?page=nguoidung">Người dùng</a>
				<a class="nav-link text-dark" href="admin?page=newsletter">Newsletter</a>
			</div>
		</div>
	</nav>

	<main class="flex-grow-1 container my-4">
		<jsp:include page="${includePage}" />
	</main>

	<footer class="bg-primary text-white text-center py-3 mt-auto">
		Footer: Thiết kế thử đồ
	</footer>
</body>


</html>
