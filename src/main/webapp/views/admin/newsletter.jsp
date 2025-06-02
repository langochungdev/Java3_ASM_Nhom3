<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<%
    String error = request.getParameter("error");
    String email = request.getParameter("email");
    String enabled = request.getParameter("enabled");
%>

<div class="container">
    <h2 class="text-center my-4">Quản lý Newsletter</h2>

    <!-- Form nhập -->
    <form method="post" action="newsletter">
        <div class="mb-3">
            <label for="email" class="form-label">Email:</label>
            <input type="email" class="form-control" name="email" id="email"
                   value="<%= email != null ? email : "" %>" required />
        </div>
        <div class="mb-3">
            <label for="enabled" class="form-label">Trạng thái:</label>
            <select name="enabled" id="enabled" class="form-select">
                <option value="true" <%= "true".equals(enabled) ? "selected" : "" %>>Hoạt động</option>
                <option value="false" <%= "false".equals(enabled) ? "selected" : "" %>>Ngừng</option>
            </select>
        </div>

        <!-- Hiển thị lỗi nếu có -->
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">${param.error}</div>
        </c:if>

        <!-- Nút chức năng -->
        <div class="d-flex gap-2">
            <button type="submit" name="action" value="create" class="btn btn-success">Thêm</button>
            <button type="submit" name="action" value="update" class="btn btn-warning">Sửa</button>
            <button type="submit" name="action" value="delete" class="btn btn-danger">Xóa</button>
            <a href="admin?page=newsletter" class="btn btn-secondary">Reset</a>
        </div>
    </form>

    <hr class="my-4" />

    <!-- Bảng hiển thị danh sách -->
    <table class="table table-bordered table-striped text-center align-middle">
        <thead class="table-light">
            <tr>
                <th>Email</th>
                <th>Trạng thái</th>
                <th>Chọn</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="n" items="${newsletterList}">
                <tr>
                    <td>${n.email}</td>
                    <td>
                        <c:choose>
                            <c:when test="${n.enabled}">Hoạt động</c:when>
                            <c:otherwise>Ngừng</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="admin?page=newsletter&email=${n.email}&enabled=${n.enabled}" class="btn btn-sm btn-primary">Edit</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
