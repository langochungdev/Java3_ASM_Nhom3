<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="selected" value="${selectedNews}" />

<div class="container py-4">
    <h2 class="text-center mb-4">${selected != null ? "Cập nhật" : "Đăng mới"} bài viết</h2>

    <form method="post" action="${pageContext.request.contextPath}/tintuc" enctype="multipart/form-data" class="row g-3">
        <input type="hidden" name="id" value="${selected.id}" />

        <div class="col-md-6">
            <label class="form-label">Tiêu đề:</label>
            <input class="form-control" name="title" value="${selected.title}" required />
        </div>

        <div class="col-md-6">
            <label class="form-label">Ngày đăng:</label>
            <input type="date" class="form-control" name="postedDate"
                   value="${selected.postedDate}" required />
        </div>

        <div class="col-12">
            <label class="form-label">Nội dung:</label>
            <textarea class="form-control" name="content" rows="5" required>${selected.content}</textarea>
        </div>

        <div class="col-md-6">
            <label class="form-label">Hình ảnh:</label>
<!--             <input class="form-control" type="file" name="image" /> -->
<%--             <c:if test="${selected.image != null}"> --%>
<!--                 <div class="mt-2"> -->
<!--                     Ảnh hiện tại: -->
<%--                     <img src="${pageContext.request.contextPath}/images/${selected.image}" width="100" /> --%>
<!--                 </div> -->
<%--             </c:if> --%>

<input class="form-control" type="file" name="image" id="imageInput" onchange="previewImage(event)" />

<c:if test="${selected.image != null}">
    <div class="mt-2">
        Ảnh hiện tại:
        <img src="${pageContext.request.contextPath}/images/${selected.image}" width="100" id="currentImage" />
    </div>
</c:if>

<!-- Khu vực hiển thị ảnh mới được chọn -->
<div id="previewContainer" class="mt-2" style="display: none;">
    Ảnh mới chọn:
    <img id="preview" src="#" alt="Preview" width="100" />
</div>
        </div>

        <div class="col-md-6">
            <label class="form-label">Loại tin:</label>
            <select class="form-select" name="categoryId" required>
                <option value="" disabled <c:if test="${selected == null}">selected</c:if>>-- Chọn loại tin --</option>
                <c:forEach var="c" items="${categories}">
                    <option value="${c.id}" <c:if test="${selected.categoryId eq c.id}">selected</c:if>>${c.name}</option>
                </c:forEach>
            </select>
        </div>

        <div class="col-12">
            <div class="form-check">
                <input class="form-check-input" type="checkbox" name="home" id="homeCheckbox"
                       <c:if test="${selected.home}">checked</c:if> />
                <label class="form-check-label" for="homeCheckbox">Hiển thị ở trang chủ</label>
            </div>
        </div>

        <div class="col-12 d-flex gap-2">
            <button type="submit" name="action" value="create" class="btn btn-primary" <c:if test="${selected != null}">disabled</c:if>>➕ Thêm</button>
            <button type="submit" name="action" value="update" class="btn btn-success" <c:if test="${selected == null}">disabled</c:if>>💾 Lưu cập nhật</button>
            <button type="submit" name="action" value="delete" class="btn btn-danger"
                    onclick="return confirm('Bạn có chắc chắn muốn xóa?');"
                    <c:if test="${selected == null}">disabled</c:if>>🗑️ Xóa</button>
            <a href="admin?page=tintuc" class="btn btn-secondary">Reset</a>
        </div>
    </form>

    <hr class="my-4" />

    <h3>📋 Danh sách bài viết</h3>
    <table class="table table-bordered table-striped text-center align-middle">
        <thead class="table-light">
        <tr>
            <th>Mã</th>
            <th>Tiêu đề</th>
            <th>Ngày đăng</th>
            <th>Loại</th>
            <th>Ảnh</th>
            <th>Thao tác</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="n" items="${items}">
            <tr>
                <td>${n.id}</td>
                <td>${n.title}</td>
                <td>${n.postedDate}</td>
                <td>
                    <c:forEach var="c" items="${categories}">
                        <c:if test="${c.id eq n.categoryId}">${c.name}</c:if>
                    </c:forEach>
                </td>
                <td>
                    <img src="${pageContext.request.contextPath}/images/${n.image}" width="80" />
                </td>
                <td>
                    <a href="admin?page=tintuc&id=${n.id}" class="btn btn-sm btn-warning">✏️ Sửa</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>


<script>
    function previewImage(event) {
        const file = event.target.files[0];
        const previewContainer = document.getElementById('previewContainer');
        const preview = document.getElementById('preview');

        if (file && file.type.startsWith('image/')) {
            const reader = new FileReader();

            reader.onload = function (e) {
                preview.src = e.target.result;
                previewContainer.style.display = 'block';
            };

            reader.readAsDataURL(file);
        } else {
            preview.src = '#';
            previewContainer.style.display = 'none';
        }
    }
</script>