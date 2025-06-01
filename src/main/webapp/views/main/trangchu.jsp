<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:forEach var="item" items="${newsList}">
    <a href="main?page=tinchitiet&id=${item.id}" class="d-flex text-decoration-none text-dark mb-3 align-items-start">
        <div class="flex-shrink-0 bg-primary text-white d-flex justify-content-center align-items-center rounded"
             style="width:120px; height:90px;">
            <img src="${item.image}" alt="ảnh" class="img-fluid rounded" style="max-width:100%; max-height:100%;">
        </div>
        <div class="ms-3">
            <h2 class="h5">${item.title}</h2>
            <p class="mb-1">
                <c:choose>
                    <c:when test="${fn:length(item.content) > 50}">
                        ${fn:substring(item.content, 0, 50)}...
                    </c:when>
                    <c:otherwise>
                        ${item.content}
                    </c:otherwise>
                </c:choose>
            </p>
            <p class="text-muted small">${item.postedDate} / ${item.author}</p>
        </div>
    </a>
</c:forEach>
