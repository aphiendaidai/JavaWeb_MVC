<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2><i class="fas fa-school me-2"></i>Danh sách trường học</h2>
        <a href="${pageContext.request.contextPath}/truong/new" class="btn btn-primary">
            <i class="fas fa-plus me-2"></i>Thêm trường mới
        </a>
    </div>
    
    <div class="card">
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
                                    <a href="${pageContext.request.contextPath}/truong/delete/${t.maTruong}" 
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('Bạn có chắc muốn xóa trường này?')">
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