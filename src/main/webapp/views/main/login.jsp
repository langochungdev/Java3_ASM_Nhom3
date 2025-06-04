<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="card p-4" style="width: 22rem;">
            <h2 class="text-center mb-3">Đăng nhập</h2>
            <form>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Nhập email">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" class="form-control" id="password" placeholder="Nhập mật khẩu">
                </div>
                <div class="mb-3 form-check">
                    <input type="checkbox" class="form-check-input" id="rememberMe">
                    <label class="form-check-label" for="rememberMe">Remember me?</label>
                </div>
                <button type="submit" class="btn btn-primary w-100">Đăng nhập</button>
            </form>
        </div>
    </div>
</body>
</html>