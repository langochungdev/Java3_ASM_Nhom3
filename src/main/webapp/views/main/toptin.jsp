<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<h2 class="h4 mb-4 text-center text-primary">🔥 5 bản tin được xem nhiều</h2>

<c:if test="${empty viewedNews}">
    <div class="alert alert-warning text-center">Không có dữ liệu hiển thị.</div>
</c:if>

<div class="d-flex flex-column align-items-center">
    <c:forEach var="item" items="${viewedNews}">
        <a href="main?page=tinchitiet&id=${item.id}"
           class="d-flex text-decoration-none text-dark mb-3 align-items-start border rounded p-2 shadow-sm"
           style="max-width: 600px; width: 100%;">
            <div class="flex-shrink-0 bg-light rounded overflow-hidden"
                 style="width: 120px; height: 90px;">
                <img src="${item.image}" alt="ảnh"
                     class="img-fluid rounded h-100 w-100"
                     style="object-fit: cover;">
            </div>
            <div class="ms-3">
                <h6 class="mb-1">${item.title}</h6>
                <p class="small mb-1 text-muted">
                    <c:choose>
                        <c:when test="${fn:length(item.content) > 50}">
                            ${fn:substring(item.content, 0, 50)}...
                        </c:when>
                        <c:otherwise>
                            ${item.content}
                        </c:otherwise>
                    </c:choose>
                </p>
                <p class="text-muted small mb-0">${item.postedDate} / ${item.author}- 👁 ${item.viewCount} lượt xem</p>
            </div>
        </a>
    </c:forEach>
</div>
