<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Trang quản trị</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

<style>
  html, body {
    height: 100%;
    margin: 0;
  }
  body {
    display: flex;
    flex-direction: column;
    min-height: 100vh;
  }
  header, nav, footer {
    flex-shrink: 0;
  }
  /* Header và Footer fix cao */
  header, footer {
    height: 60px; /* bạn muốn chiều cao nào chỉnh */
    line-height: 60px;
  }
  nav {
    height: 50px; /* chiều cao nav */
    line-height: 50px;
  }
  /* Phần nội dung chính chiếm phần còn lại, không cuộn ngoài, có thể cuộn trong */
  main.content {
    flex: 1 1 auto;
    overflow-y: auto;
  }
</style>
</head>

<body>
	<header class="bg-primary text-white text-center">
    Header: Thiết kế thử đồ
  </header>

	<nav class="navbar navbar-expand bg-light">
		<div class="container">
			<ul class="navbar-nav mx-auto">
				<li class="nav-item"><a class="nav-link text-dark" href="admin?page=trangchu">Trang chủ</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="admin?page=tintuc">Tin tức</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="admin?page=loaitin">Loại tin</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="admin?page=nguoidung">Người dùng</a></li>
				<li class="nav-item"><a class="nav-link text-dark" href="admin?page=newsletter">Newsletter</a></li>
			</ul>
		</div>
	</nav>

	<main class="content container">
		<jsp:include page="${includePage}" />
	</main>

	<footer class="bg-primary text-white text-center">
    Footer: Thiết kế thử đồ
  </footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
