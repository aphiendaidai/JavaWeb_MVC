<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .form-control {
            border-radius: 20px;
            padding: 10px 20px;
        }
        .btn-login {
            border-radius: 20px;
            padding: 10px 20px;
            width: 100%;
            margin-top: 20px;
        }
        .alert {
            border-radius: 20px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <div class="login-header">
                <h2>Đăng nhập</h2>
                <p class="text-muted">Vui lòng đăng nhập để tiếp tục</p>
            </div>

            <c:if test="${param.error != null}">
                <div class="alert alert-danger">
                    Tên đăng nhập hoặc mật khẩu không đúng
                </div>
            </c:if>

            <c:if test="${param.logout != null}">
                <div class="alert alert-success">
                    Bạn đã đăng xuất thành công
                </div>
            </c:if>

            <form action="${pageContext.request.contextPath}/login" method="post">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                <div class="mb-3">
                    <label for="username" class="form-label">Tên đăng nhập</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
              
                <button type="submit" class="btn btn-primary btn-login">Đăng nhập</button>
            </form>

            <div class="text-center mt-3">
                <p>Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register">Đăng ký ngay</a></p>
                <a href="${pageContext.request.contextPath}/welcome" class="text-decoration-none">← Quay lại trang chủ</a>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 
