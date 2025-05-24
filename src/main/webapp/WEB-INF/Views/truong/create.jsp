<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <title>Quản lý tốt nghiệp</title>
</head>
<body>
<div class="row">
    <div class="col-lg-6 col-md-6 col-sm-6 container justify-content-center card">
        <h1 class="text-center">Tạo trường học mới</h1>
        <div class="card-body">
            <form:form action="${pageContext.request.contextPath}/truong" method="POST" modelAttribute="truongs">
                <div class="form-group">
                    <label>Mã Trường:</label>
                    <form:input path="maTruong" 
                               class="form-control" 
                               placeholder="Nhập mã trường"/>
                    <form:errors path="maTruong" cssClass="text-danger"/>
                </div>
                
                <div class="form-group">
                    <label>Tên trường:</label>
                    <form:input path="tenTruong" 
                               class="form-control" 
                               placeholder="Nhập tên trường"/>
                    <form:errors path="tenTruong" cssClass="text-danger"/>
                </div>
                
                <div class="form-group">
                    <label>Địa chỉ:</label>
                    <form:input path="diaChi" 
                               class="form-control" 
                               placeholder="Nhập địa chỉ"/>
                    <form:errors path="diaChi" cssClass="text-danger"/>
                </div>
                
                <div class="form-group">
                    <label>Số điện thoại:</label>
                    <form:input path="Sdt" 
                               class="form-control" 
                               placeholder="Nhập số điện thoại"/>
                    <form:errors path="Sdt" cssClass="text-danger"/>
                </div>
                
                <div class="box-footer">
                    <button type="submit" class="btn btn-primary">Lưu</button>
                </div>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>