<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>${news.title}</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>

<body class="container py-4">

    <!-- Tiêu đề -->
    <h1 class="mb-4">${news.title}</h1>

    <!-- Phần chính: ảnh + nội dung -->
    <div class="d-flex gap-3 mb-4">
        <!-- Ảnh đại diện -->
        <div class="flex-shrink-0">
            <img src="${pageContext.request.contextPath}/metadata/${news.image}" alt="ảnh"
                 class="img-fluid rounded"
                 style="width: 150px; height: 150px; object-fit: cover;">
        </div>

        <!-- Nội dung + tác giả -->
        <div class="flex-grow-1">
            <p>${news.content}</p>
            <div class="fst-italic text-muted text-end mt-3">
                ${news.author} / ${news.postedDate}
            </div>
        </div>
    </div>

    <!-- Tin cùng loại -->
    <div class="mt-5">
        <h2 class="mb-3">Tin cùng loại</h2>

        <c:if test="${not empty relatedNews}">
            <ul class="list-unstyled">
                <c:forEach var="item" items="${relatedNews}">
                    <li class="mb-2">
                        <a href="admin?page=tinchitiet&id=${item.id}" class="text-decoration-none">
                            ${item.title}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </c:if>

        <c:if test="${empty relatedNews}">
            <p class="text-muted">Không có bài viết cùng loại.</p>
        </c:if>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
