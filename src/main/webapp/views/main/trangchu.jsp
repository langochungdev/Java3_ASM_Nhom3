<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="d-flex flex-column align-items-center">
    <c:forEach var="item" items="${newsList}">
        <a href="main?page=tinchitiet&id=${item.id}"
            class="d-flex text-decoration-none text-dark mb-3 align-items-start"
            style="max-width: 600px; width: 100%;">
            <div
                class="flex-shrink-0 bg-primary text-white d-flex justify-content-center align-items-center rounded"
                style="width: 120px; height: 90px;">
                <img src="${pageContext.request.contextPath}/images/${item.image}" alt="ảnh" class="img-fluid rounded h-100"
                    style="max-height: 200px;">
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
                <p class="text-muted small">${item.postedDate}/${item.author}</p>
            </div>
        </a>
    </c:forEach>
</div>
