<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
<title>Trang tin tức</title>
</head>
<body class="d-flex flex-column min-vh-100">

<header class="bg-primary text-white text-center py-3">
    <h1>Header: Thiết kế thử đồ</h1>
</header>

<nav class="navbar navbar-expand-sm navbar-light bg-light">
  <div class="container">
    <div class="navbar-nav mx-auto">
      <a class="nav-link" href="main?page=main">Trang chủ</a>
      <a class="nav-link" href="main?page=vanhoa">Văn hóa</a>
      <a class="nav-link" href="main?page=phapluat">Pháp luật</a>
      <a class="nav-link" href="main?page=thethao">Thể thao</a>
    </div>
  </div>
</nav>

<div class="container flex-grow-1 my-4">
  <div class="row">
    <main class="col-lg-8 mb-4">
      <jsp:include page="${includePage}" />
    </main>

    <aside class="col-lg-4">
      <div class="list-group mb-3">
        <a href="main?page=tinchitiet" class="list-group-item list-group-item-warning">
          5 bản tin được xem nhiều
        </a>
        <a href="main?page=tinchitiet" class="list-group-item list-group-item-warning">
          5 bản tin được xem nhiều
        </a>
        <a href="main?page=tinchitiet" class="list-group-item list-group-item-warning">
          5 bản tin được xem nhiều
        </a>
      </div>
      <input type="text" placeholder="newsletter" class="form-control" />
    </aside>
  </div>
</div>

<footer class="bg-primary text-white text-center py-3 mt-auto">
  Footer: Thiết kế thử đồ
</footer>

<!-- Bootstrap JS Bundle -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
