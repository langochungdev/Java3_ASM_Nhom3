<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String error = request.getParameter("error");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
%>

<div class="container">
    <h2 class="text-center my-4">Quản lý Loại Tin</h2>

    <form method="post" action="loaitin">
        <div class="mb-3">
            <label>Mã loại tin:</label>
            <input type="text" name="id" class="form-control" value="<%= id != null ? id : "" %>" required>
        </div>
        <div class="mb-3">
            <label>Tên loại tin:</label>
            <input type="text" name="name" class="form-control" value="<%= name != null ? name : "" %>" required>
        </div>

        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">${param.error}</div>
        </c:if>

        <div class="d-flex gap-2">
            <button type="submit" name="action" value="create" class="btn btn-success">Thêm</button>
            <button type="submit" name="action" value="update" class="btn btn-warning">Sửa</button>
            <button type="submit" name="action" value="delete" class="btn btn-danger"
                    onclick="return confirm('Bạn có chắc chắn muốn xóa?');">Xóa</button>
            <a href="admin?page=loaitin" class="btn btn-secondary">Reset</a>
        </div>
    </form>

    <hr class="my-4"/>

    <table class="table table-bordered text-center">
        <thead class="table-light">
        <tr>
            <th>Mã</th>
            <th>Tên</th>
            <th>Chọn</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${categoryList}">
            <tr>
                <td>${c.id}</td>
                <td>${c.name}</td>
                <td>
                    <a href="admin?page=loaitin&id=${c.id}&name=${c.name}" class="btn btn-sm btn-primary">Chọn</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
