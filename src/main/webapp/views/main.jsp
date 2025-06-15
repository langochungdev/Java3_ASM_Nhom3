<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
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

<!-- 🔥 5 tin được xem nhiều -->
<div class="border border-warning bg-warning-subtle rounded p-2 mb-4">
    <h6 class="text-primary fw-bold mb-2">🔥 5 tin được xem nhiều</h6>
    <c:forEach var="item" items="${topViewed}">
        <a href="main?page=tinchitiet&id=${item.id}"
           class="d-flex text-decoration-none text-dark border rounded p-2 mb-2 align-items-start bg-white">
            <img src="${item.image}" alt="ảnh" class="me-2 rounded" style="width: 80px; height: 60px; object-fit: cover;">
            <div class="flex-grow-1 small">
                <strong>${item.title}</strong><br>
                <span class="text-muted small">${item.viewCount} lượt xem</span>
            </div>
        </a>
    </c:forEach>
</div>

<!-- 🆕 5 tin mới nhất -->
<div class="border border-success bg-success-subtle rounded p-2 mb-4">
    <h6 class="text-success fw-bold mb-2">🆕 5 tin mới nhất</h6>
    <c:forEach var="item" items="${latestNews}">
        <a href="main?page=tinchitiet&id=${item.id}"
           class="d-flex text-decoration-none text-dark border rounded p-2 mb-2 align-items-start bg-white">
            <img src="${item.image}" alt="ảnh" class="me-2 rounded" style="width: 80px; height: 60px; object-fit: cover;">
            <div class="flex-grow-1 small">
                <strong>${item.title}</strong><br>
                <span class="text-muted small">${item.postedDate}</span>
            </div>
        </a>
    </c:forEach>
</div>

<!-- 👁 5 tin bạn đã xem -->
<div class="border border-info bg-info-subtle rounded p-2 mb-4">
    <h6 class="text-info fw-bold mb-2">👁 5 tin bạn đã xem</h6>
    <c:if test="${empty viewedNews}">
        <p class="text-muted small fst-italic">Bạn chưa xem bản tin nào.</p>
    </c:if>
    <c:forEach var="item" items="${viewedNews}">
        <a href="main?page=tinchitiet&id=${item.id}"
           class="d-flex text-decoration-none text-dark border rounded p-2 mb-2 align-items-start bg-white">
            <img src="${item.image}" alt="ảnh" class="me-2 rounded" style="width: 80px; height: 60px; object-fit: cover;">
            <div class="flex-grow-1 small">
                <strong>${item.title}</strong><br>
                <span class="text-muted small">${item.postedDate}</span>
            </div>
        </a>
    </c:forEach>
</div>




                <!-- Newsletter đăng ký -->
                <form action="main" method="post" class="input-group mt-4">
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