<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="d-flex flex-column align-items-center">
    <h2 class="h4 mb-4 text-primary">5 bản tin bạn đã xem gần đây</h2>

    <c:if test="${empty viewedNews}">
        <div class="alert alert-warning w-100 text-center" style="max-width: 600px;">
            Bạn chưa xem bản tin nào.
        </div>
    </c:if>

    <c:forEach var="item" items="${viewedNews}">
        <a href="main?page=tinchitiet&id=${item.id}"
           class="d-flex text-decoration-none text-dark mb-3 align-items-start border rounded p-2"
           style="max-width: 600px; width: 100%;">
           
            <div class="flex-shrink-0 bg-light rounded overflow-hidden"
                 style="width: 120px; height: 90px;">
                <img src="${item.image}" alt="ảnh"
                     class="img-fluid rounded h-100 w-100"
                     style="object-fit: cover;">
            </div>

            <div class="ms-3">
                <h2 class="h6 mb-1">${item.title}</h2>
                <p class="mb-1 small">
                    <c:choose>
                        <c:when test="${fn:length(item.content) > 50}">
                            ${fn:substring(item.content, 0, 50)}...
                        </c:when>
                        <c:otherwise>
                            ${item.content}
                        </c:otherwise>
                    </c:choose>
                </p>
                <p class="text-muted small mb-0">${item.postedDate} / ${item.author}</p>
            </div>
        </a>
    </c:forEach>
</div>
