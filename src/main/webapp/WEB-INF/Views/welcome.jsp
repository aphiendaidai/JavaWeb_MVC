<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chào mừng đến với Hệ thống Quản lý Khóa học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .welcome-section {
            padding: 100px 0;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        .feature-card {
            padding: 20px;
            border-radius: 10px;
            background: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: transform 0.3s ease;
        }
        .feature-card:hover {
            transform: translateY(-5px);
        }
        .btn-custom {
            padding: 10px 30px;
            border-radius: 25px;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
    </style>
</head>
<body>
    <div class="welcome-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h1 class="display-4 mb-4">Chào mừng đến với Hệ thống Quản lý Khóa học</h1>
                    <p class="lead mb-4">Nơi kết nối giảng viên và sinh viên, tạo môi trường học tập hiệu quả</p>
                    <div class="d-flex gap-3">
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-light btn-custom">Đăng nhập</a>
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-light btn-custom">Đăng ký</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <img src="https://img.freepik.com/free-vector/online-learning-isometric-concept_1284-17947.jpg" 
                         alt="Education" class="img-fluid">
                </div>
            </div>
        </div>
    </div>

    <div class="container my-5">
        <h2 class="text-center mb-5">Tính năng nổi bật</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="feature-card">
                    <h3>Quản lý khóa học</h3>
                    <p>Dễ dàng tạo và quản lý các khóa học với đầy đủ thông tin chi tiết</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card">
                    <h3>Đăng ký học</h3>
                    <p>Sinh viên có thể đăng ký tham gia các khóa học phù hợp</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-card">
                    <h3>Theo dõi tiến độ</h3>
                    <p>Giảng viên có thể theo dõi và đánh giá tiến độ học tập của sinh viên</p>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html> 