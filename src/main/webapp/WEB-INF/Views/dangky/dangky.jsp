<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="fas fa-clipboard-list me-2"></i>Danh sách đăng ký khóa học</h2>
        <a href="${pageContext.request.contextPath}/dangky/new" class="btn btn-primary">
            <i class="fas fa-plus me-2"></i>Thêm đăng ký mới
        </a>
    </div>
    
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Mã đăng ký</th>
                            <th>Sinh viên</th>
                            <th>Khóa học</th>
                            <th>Giảng viên</th>
                            <th>Trường</th>
                            <th class="text-center">Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${dangky}" var="dk">
                            <tr>
                                <td>${dk.maDK}</td>
                                <td>${dk.sinhVien.hoTen}</td>
                                <td>${dk.khoaHoc.tenKH}</td>
                                <td>${dk.khoaHoc.giangVien.hoTen}</td>
                                <td>${dk.khoaHoc.truong.tenTruong}</td>
                                     <sec:authorize access="hasRole('ADMIN')">
               
                 
                                
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/dangky/edit/${dk.maDK}" class="btn btn-warning btn-sm">
                                        <i class="fas fa-edit"></i> Sửa
                                    </a>
                                    <a href="${pageContext.request.contextPath}/dangky/delete/${dk.maDK}" class="btn btn-danger btn-sm"
                                       onclick="return confirm('Bạn có chắc muốn xóa đăng ký này?')">
                                        <i class="fas fa-trash"></i> Xóa
                                    </a>
                                </td>
                                                    </sec:authorize>
                                
                                
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div> 