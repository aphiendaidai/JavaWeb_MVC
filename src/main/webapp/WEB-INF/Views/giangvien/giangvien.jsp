<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="fas fa-chalkboard-teacher me-2"></i>Danh sách giảng viên</h2>
        
        
                                           <sec:authorize access="hasRole('ADMIN')">
        
        <a href="${pageContext.request.contextPath}/giangvien/new" class="btn btn-primary">
            <i class="fas fa-plus me-2"></i>Thêm giảng viên
        </a>
                                           </sec:authorize>  
        
        
        
    </div>
    
    <div class="card">
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
                                <td><c:out value="${gv.truong !=null ? gv.truong.tenTruong: 'Không có tên trường'} "/></td>
                                  <sec:authorize access="hasRole('ADMIN')">
               
                 
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/giangvien/edit/${gv.maGV}" 
                                       class="btn btn-warning btn-sm">
                                        <i class="fas fa-edit me-1"></i>Sửa
                                    </a>
                                    <a href="${pageContext.request.contextPath}/giangvien/delete/${gv.maGV}" 
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('Bạn có chắc muốn xóa giảng viên này?')">
                                        <i class="fas fa-trash me-1"></i>Xóa
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