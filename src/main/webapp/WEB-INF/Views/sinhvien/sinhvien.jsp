<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="fas fa-user-graduate me-2"></i>Danh sách sinh viên</h2>
        <a href="${pageContext.request.contextPath}/sinhvien/new" class="btn btn-primary">
            <i class="fas fa-plus me-2"></i>Thêm sinh viên
        </a>
    </div>
    
    <div class="card">
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
                                    <a href="${pageContext.request.contextPath}/sinhvien/delete/${sv.maSV}" 
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('Bạn có chắc muốn xóa sinh viên này?')">
                                        <i class="fas fa-trash me-1"></i>Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div> 