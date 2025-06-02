<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="container mt-4">
    <!-- Thông tin người dùng -->
    <div class="row mb-4">
        <div class="col-md-12">
            <h2>Chào mừng, ${username}!</h2>
            <sec:authorize access="hasRole('ROLE_ADMIN')">
                <div class="alert alert-info">	
                    Bạn đang đăng nhập với quyền quản trị viên
                </div>
            </sec:authorize>
            <sec:authorize access="hasRole('ROLE_USER')">
                <div class="alert alert-info">
                    Bạn đang đăng nhập với quyền sinh viên
                </div>
            </sec:authorize>
        </div>
    </div>

    <!-- Thống kê -->
    <div class="row mb-4">
        <div class="col-md-12">
            <h3>Thống kê hệ thống</h3>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card bg-primary text-white">
                <div class="card-body">
                    <h5 class="card-title">Trường học</h5>
                    <p class="card-text display-4">${totalTruong}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card bg-success text-white">
                <div class="card-body">
                    <h5 class="card-title">Giảng viên</h5>
                    <p class="card-text display-4">${totalGiangVien}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-3">
            <div class="card bg-info text-white">
                <div class="card-body">
                    <h5 class="card-title">Sinh viên</h5>
                    <p class="card-text display-4">${totalSinhVien}</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <div class="card bg-warning text-white">
                <div class="card-body">
                    <h5 class="card-title">Khóa học</h5>
                    <p class="card-text display-4">${totalKhoaHoc}</p>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-3">
            <div class="card bg-danger text-white">
                <div class="card-body">
                    <h5 class="card-title">Đăng ký</h5>
                    <p class="card-text display-4">${totalDangKy}</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Dữ liệu mới nhất -->
    <div class="row">
        <!-- Trường học mới nhất -->
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Trường học mới nhất</h5>
                </div>
                <div class="card-body">
                    <div class="list-group">
                        <c:forEach items="${latestTruong}" var="truong">
                            <a href="#" class="list-group-item list-group-item-action">
                                ${truong.tenTruong}
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <!-- Giảng viên mới nhất -->
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Giảng viên mới nhất</h5>
                </div>
                <div class="card-body">
                    <div class="list-group">
                        <c:forEach items="${latestGiangVien}" var="giangVien">
                            <a href="#" class="list-group-item list-group-item-action">
                                ${giangVien.hoTen}
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <!-- Sinh viên mới nhất -->
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Sinh viên mới nhất</h5>
                </div>
                <div class="card-body">
                    <div class="list-group">
                        <c:forEach items="${latestSinhVien}" var="sinhVien">
                            <a href="#" class="list-group-item list-group-item-action">
                                ${sinhVien.hoTen}
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <!-- Khóa học mới nhất -->
        <div class="col-md-6 mb-4">
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Khóa học mới nhất</h5>
                </div>
                <div class="card-body">
                    <div class="list-group">
                        <c:forEach items="${latestKhoaHoc}" var="khoaHoc">
                            <a href="#" class="list-group-item list-group-item-action">
                                ${khoaHoc.tenKH}
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        
        
    </div>
</div>

<style>
.border-left-primary {
    border-left: 4px solid #4e73df !important;
}
.border-left-success {
    border-left: 4px solid #1cc88a !important;
}
.border-left-info {
    border-left: 4px solid #36b9cc !important;
}
.border-left-warning {
    border-left: 4px solid #f6c23e !important;
}
.card {
    transition: transform 0.2s;
}
.card:hover {
    transform: translateY(-5px);
}
.btn-block {
    padding: 1rem;
    font-weight: bold;
}
</style> 