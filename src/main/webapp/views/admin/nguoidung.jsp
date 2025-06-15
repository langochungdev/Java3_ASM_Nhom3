<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container">
    <h2 class="text-center my-4">Quản lý Người Dùng</h2>

    <!-- Form nhập -->
    <form method="post" action="${pageContext.request.contextPath}/admin/user">
        <div class="row mb-3">
            <div class="col-md-4">
                <label for="id" class="form-label">Mã người dùng:</label>
                <input type="text" class="form-control" name="id" id="id"
                       value="${param.id}" required />
            </div>
            <div class="col-md-4">
                <label for="fullname" class="form-label">Họ tên:</label>
                <input type="text" class="form-control" name="fullname" id="fullname"
                       value="${param.fullname}" required />
            </div>
            <div class="col-md-4">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" name="email" id="email"
                       value="${param.email}" />
            </div>
        </div>
        <div class="row mb-3">
            <div class="col-md-4">
                <label for="mobile" class="form-label">Điện thoại:</label>
                <input type="text" class="form-control" name="mobile" id="mobile"
                       value="${param.mobile}" />
            </div>
            <div class="col-md-4">
                <label for="role" class="form-label">Vai trò:</label>
                <select name="role" id="role" class="form-select">
                    <option value="true" ${param.role == 'true' ? 'selected' : ''}>Quản trị</option>
                    <option value="false" ${param.role == 'false' ? 'selected' : ''}>Phóng viên</option>
                </select>
            </div>
        </div>

        <!-- Hiển thị lỗi nếu có -->
        <c:if test="${not empty param.error}">
            <div class="alert alert-danger">${param.error}</div>
        </c:if>

        <!-- Nút chức năng -->
        <div class="d-flex gap-2 mb-4">
            <button type="submit" name="action" value="create" class="btn btn-success">Thêm</button>
            <button type="submit" name="action" value="update" class="btn btn-warning">Sửa</button>
            <button type="submit" name="action" value="delete" class="btn btn-danger">Xóa</button>
            <a href="${pageContext.request.contextPath}/admin?page=nguoidung" class="btn btn-secondary">Reset</a>
        </div>
    </form>

    <hr class="my-4" />

    <!-- Bảng danh sách người dùng -->
    <table class="table table-bordered table-striped text-center align-middle">
        <thead class="table-light">
            <tr>
                <th>ID</th>
                <th>Họ tên</th>
                <th>Email</th>
                <th>Điện thoại</th>
                <th>Vai trò</th>
                <th>Chọn</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="u" items="${userList}">
                <tr>
                    <td>${u.id}</td>
                    <td>${u.fullname}</td>
                    <td>${u.email}</td>
                    <td>${u.mobile}</td>
                    <td>
                        <c:choose>
                            <c:when test="${u.role}">Quản trị</c:when>
                            <c:otherwise>Phóng viên</c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin?page=nguoidung&id=${u.id}&fullname=${u.fullname}&email=${u.email}&mobile=${u.mobile}&role=${u.role}"
                           class="btn btn-sm btn-primary">Chọn</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
