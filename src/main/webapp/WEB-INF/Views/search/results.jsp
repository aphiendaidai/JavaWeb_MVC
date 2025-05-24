<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid">
    <h2 class="mb-4"><i class="fas fa-search me-2"></i>Kết quả tìm kiếm</h2>
    
    <!-- Kết quả tìm kiếm trường học -->
    <c:if test="${not empty truong}">
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0"><i class="fas fa-school me-2"></i>Trường học</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Mã trường</th>
                                <th>Tên trường</th>
                                <th>Địa chỉ</th>
                                <th>Số điện thoại</th>
                                <th class="text-center">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${truong}" var="t">
                                <tr>
                                    <td><c:out value="${t.maTruong}"/></td>
                                    <td><c:out value="${t.tenTruong}"/></td>
                                    <td><c:out value="${t.diaChi}"/></td>
                                    <td><c:out value="${t.sdt}"/></td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/truong/edit/${t.maTruong}" 
                                           class="btn btn-warning btn-sm">
                                            <i class="fas fa-edit me-1"></i>Sửa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </c:if>
    
    <!-- Kết quả tìm kiếm giảng viên -->
    <c:if test="${not empty giangvien}">
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0"><i class="fas fa-chalkboard-teacher me-2"></i>Giảng viên</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Mã GV</th>
                                <th>Họ tên</th>
                                <th>Chức vụ</th>
                                <th>Số điện thoại</th>
                                <th>Trường</th>
                                <th class="text-center">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${giangvien}" var="gv">
                                <tr>
                                    <td><c:out value="${gv.maGV}"/></td>
                                    <td><c:out value="${gv.hoTen}"/></td>
                                    <td><c:out value="${gv.chucVu}"/></td>
                                    <td><c:out value="${gv.soDT}"/></td>
                                    <td><c:out value="${gv.truong != null ? gv.truong.tenTruong : 'Không có tên trường'}"/></td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/giangvien/edit/${gv.maGV}" 
                                           class="btn btn-warning btn-sm">
                                            <i class="fas fa-edit me-1"></i>Sửa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </c:if>
    
    <!-- Kết quả tìm kiếm sinh viên -->
    <c:if test="${not empty sinhvien}">
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0"><i class="fas fa-user-graduate me-2"></i>Sinh viên</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Mã SV</th>
                                <th>Họ tên</th>
                                <th>Ngày sinh</th>
                                <th>Địa chỉ</th>
                                <th>Số điện thoại</th>
                                <th>Trường</th>
                                <th class="text-center">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sinhvien}" var="sv">
                                <tr>
                                    <td><c:out value="${sv.maSV}"/></td>
                                    <td><c:out value="${sv.hoTen}"/></td>
                                    <td><fmt:formatDate value="${sv.ngaySinh}" pattern="dd/MM/yyyy"/></td>
                                    <td><c:out value="${sv.diaChi}"/></td>
                                    <td><c:out value="${sv.soDT}"/></td>
                                    <td><c:out value="${sv.truong != null ? sv.truong.tenTruong : 'Không có tên trường'}"/></td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/sinhvien/edit/${sv.maSV}" 
                                           class="btn btn-warning btn-sm">
                                            <i class="fas fa-edit me-1"></i>Sửa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </c:if>
    
    <!-- Kết quả tìm kiếm khóa học -->
    <c:if test="${not empty khoahoc}">
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">
                <h4 class="mb-0"><i class="fas fa-book me-2"></i>Khóa học</h4>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>Mã khóa học</th>
                                <th>Tên khóa học</th>
                                <th>Giảng viên</th>
                                <th>Thời gian</th>
                                <th>Trường</th>
                                <th class="text-center">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${khoahoc}" var="kh">
                                <tr>
                                    <td><c:out value="${kh.maKH}"/></td>
                                    <td><c:out value="${kh.tenKH}"/></td>
                                    <td><c:out value="${kh.giangVien.hoTen}"/></td>
                                    <td><c:out value="${kh.thoiGian}"/></td>
                                    <td><c:out value="${kh.truong != null ? kh.truong.tenTruong : 'Không có tên trường'}"/></td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/khoahoc/edit/${kh.maKH}" 
                                           class="btn btn-warning btn-sm">
                                            <i class="fas fa-edit me-1"></i>Sửa
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </c:if>
    
    <!-- Thông báo không có kết quả -->
    <c:if test="${empty truong and empty giangvien and empty sinhvien and empty khoahoc}">
        <div class="alert alert-info">
            <i class="fas fa-info-circle me-2"></i>Không tìm thấy kết quả nào phù hợp với từ khóa tìm kiếm.
        </div>
    </c:if>
</div> 