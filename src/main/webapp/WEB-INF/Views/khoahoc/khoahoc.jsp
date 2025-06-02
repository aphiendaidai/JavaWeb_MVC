<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="fas fa-book me-2"></i>Danh sách khóa học</h2>
                                           <sec:authorize access="hasRole('ADMIN')">
        
        <a href="${pageContext.request.contextPath}/khoahoc/new" class="btn btn-primary">
            <i class="fas fa-plus me-2"></i>Thêm khóa học mới
        </a>
                                           </sec:authorize>  
        
        
    </div>
    
    <div class="card">
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
                                <td><c:out value="${kh.truong !=null ? kh.truong.tenTruong: 'Không có tên trường'} "/></td>
                              
                                   <sec:authorize access="hasRole('ADMIN')">
               
                 
                                <td class="text-center">
                                    <a href="${pageContext.request.contextPath}/khoahoc/edit/${kh.maKH}" class="btn btn-warning btn-sm">
                                        <i class="fas fa-edit"></i> Sửa
                                    </a>
                                    
                                    
                                    <a href="${pageContext.request.contextPath}/khoahoc/delete/${kh.maKH}" class="btn btn-danger btn-sm"
                                       onclick="return confirm('Bạn có chắc muốn xóa khóa học này?')">
                                        <i class="fas fa-trash"></i> Xóa
                                    </a>
                                   </sec:authorize>  
                                    
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div> 