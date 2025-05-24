<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid">
    <!-- Welcome Section -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card bg-primary text-white">
                <div class="card-body">
                    <h1 class="display-4"><i class="fas fa-graduation-cap me-2"></i>Chào mừng đến với Hệ thống Quản lý Trường học</h1>
                    <p class="lead">Quản lý thông tin trường học, giảng viên, sinh viên và khóa học một cách hiệu quả</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Statistics Cards -->
    <div class="row mb-4">
        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Tổng số trường</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalTruong}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-school fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-success text-uppercase mb-1">Tổng số giảng viên</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalGiangVien}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-chalkboard-teacher fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tổng số sinh viên</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalSinhVien}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-user-graduate fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6 mb-4">
            <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                    <div class="row no-gutters align-items-center">
                        <div class="col mr-2">
                            <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Tổng số khóa học</div>
                            <div class="h5 mb-0 font-weight-bold text-gray-800">${totalKhoaHoc}</div>
                        </div>
                        <div class="col-auto">
                            <i class="fas fa-book fa-2x text-gray-300"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Latest Records -->
    <div class="row">
        <div class="col-xl-6 col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-primary">Trường học mới nhất</h6>
                    <a href="${pageContext.request.contextPath}/truong" class="btn btn-sm btn-primary">
                        Xem tất cả
                    </a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Mã trường</th>
                                    <th>Tên trường</th>
                                    <th>Địa chỉ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${latestTruong}" var="t">
                                    <tr>
                                        <td>${t.maTruong}</td>
                                        <td>${t.tenTruong}</td>
                                        <td>${t.diaChi}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-6 col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-success">Giảng viên mới nhất</h6>
                    <a href="${pageContext.request.contextPath}/giangvien" class="btn btn-sm btn-success">
                        Xem tất cả
                    </a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Mã GV</th>
                                    <th>Họ tên</th>
                                    <th>Chức vụ</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${latestGiangVien}" var="gv">
                                    <tr>
                                        <td>${gv.maGV}</td>
                                        <td>${gv.hoTen}</td>
                                        <td>${gv.chucVu}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-xl-6 col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-info">Sinh viên mới nhất</h6>
                    <a href="${pageContext.request.contextPath}/sinhvien" class="btn btn-sm btn-info">
                        Xem tất cả
                    </a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Mã SV</th>
                                    <th>Họ tên</th>
                                    <th>Ngày sinh</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${latestSinhVien}" var="sv">
                                    <tr>
                                        <td>${sv.maSV}</td>
                                        <td>${sv.hoTen}</td>
                                        <td><fmt:formatDate value="${sv.ngaySinh}" pattern="dd/MM/yyyy"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Latest Courses -->
        <div class="col-xl-6 col-lg-6">
            <div class="card shadow mb-4">
                <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                    <h6 class="m-0 font-weight-bold text-warning">Khóa học mới nhất</h6>
                    <a href="${pageContext.request.contextPath}/khoahoc" class="btn btn-sm btn-warning">
                        Xem tất cả
                    </a>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Mã KH</th>
                                    <th>Tên khóa học</th>
                                    <th>Giảng viên</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${latestKhoaHoc}" var="kh">
                                    <tr>
                                        <td>${kh.maKH}</td>
                                        <td>${kh.tenKH}</td>
                                        <td>${kh.giangVien.hoTen}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Actions -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card shadow">
                <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">Thao tác nhanh</h6>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3 mb-3">
                            <a href="${pageContext.request.contextPath}/truong/new" class="btn btn-primary btn-block">
                                <i class="fas fa-plus me-2"></i>Thêm trường mới
                            </a>
                        </div>
                        <div class="col-md-3 mb-3">
                            <a href="${pageContext.request.contextPath}/giangvien/new" class="btn btn-success btn-block">
                                <i class="fas fa-plus me-2"></i>Thêm giảng viên mới
                            </a>
                        </div>
                        <div class="col-md-3 mb-3">
                            <a href="${pageContext.request.contextPath}/sinhvien/new" class="btn btn-info btn-block">
                                <i class="fas fa-plus me-2"></i>Thêm sinh viên mới
                            </a>
                        </div>
                        <div class="col-md-3 mb-3">
                            <a href="${pageContext.request.contextPath}/khoahoc/new" class="btn btn-warning btn-block">
                                <i class="fas fa-plus me-2"></i>Thêm khóa học mới
                            </a>
                        </div>
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